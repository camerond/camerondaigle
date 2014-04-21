title: "Refactoring Minical: a cup of Coffeescript"
published: "2014-03-24 08:00:00 AM"
original_version: "http://hashrocket.com/blog/posts/refactoring-minical-a-cup-of-coffeescript"
---

This past week I pushed a pretty thorough rewrite & cleanup of Minical, my jQuery datepicker plugin. I originally opened it up just to add one little feature, but quickly became sidetracked by how lousy the codebase was and how much better I could write it now (note: this happens with everything I've ever coded or designed, and is completely normal).

So I ended up rewriting far more of it than would fit in a blog post – but here's a breakdown of how I rewrote one particular method.

```coffeescript
showCalendar: (e) ->
  mc = if e then $(e.target).data("minical") else @
  $other_cals = $("[id^='minical_calendar']").not(mc.$cal)
  $other_cals.data("minical").hideCalendar() if $other_cals.length
  return true if mc.$cal.is(":visible") or mc.$el.is(":disabled")
  offset = if mc.align_to_trigger then mc.$trigger[mc.offset_method]() else mc.$el[mc.offset_method]()
  height = if mc.align_to_trigger then mc.$trigger.outerHeight() else mc.$el.outerHeight()
  position =
    left: "#{offset.left + mc.offset.x}px",
    top: "#{height + offset.top + mc.offset.y}px"
  mc.render().css(position).show()
  overlap = mc.$cal.width() + mc.$cal[mc.offset_method]().left - $(window).width()
  if overlap > 0
    mc.$cal.css("left", offset.left - overlap - 10)
  mc.attachCalendarKeyEvents()
```

This was the `showCalendar` method. It's dense and baffling – clearly written by my evil twin from 2011, as he cackled malevolently from the depths of his island volcano fortress. `showCalendar` has a ton of responsibilities:

- conditionally use either `this` or the event's target's data store for its `this` reference (because sometimes it's a handler)
- hide other calendars on the page
- bail out if the calendar is already showing or the text input is disabled
- position itself
- rebuild the calendar element
- adjust for overlap
- attach events

Sigh. To make matters worse, it was being called as an event handler ...

```coffeescript
@$el.on("focus.minical click.minical", @showCalendar)
```

... directly, from within a keydown handler function ...

```coffeescript
preventKeystroke: (e) ->
  mc = @
  if mc.$cal.is(":visible") then return true
  key = e.which
  keys =
    9:  -> true               # tab
    13: ->                    # enter
        mc.showCalendar()
        false
```

... and to reposition the calendar on window resize.

```coffeescript
if @move_on_resize
  $(window).resize(() ->
    $cal = $(".minical:visible")
    $cal.length && $cal.hide().data("minical").showCalendar()
  )
```

That is too many places! There are performance implications here (rebuilding the entire calendar every time the window resizes is gross), and the code is just downright confusing. Let's fix all the things!

First off, the positioning of the calendar should be its own method. Let's abstract that and reference it directly, and while we're at it, let's condense the overlap adjustment code in there too. It's still verbose, but hey, positioning is complicated. At least it's in its own little area now.

```coffeescript
positionCalendar: ->
  offset = if @align_to_trigger then @$trigger[@offset_method]() else @$el[@offset_method]()
  height = if @align_to_trigger then @$trigger.outerHeight() else @$el.outerHeight()
  position =
    left: "#{offset.left + @offset.x}px",
    top: "#{height + offset.top + @offset.y}px"
  @$cal.css(position)
  overlap = @$cal.width() + @$cal[@offset_method]().left - $(window).width()
  if overlap > 0
    @$cal.css("left", offset.left - overlap - 10)
  @$cal
```

And we'll reference THAT instead in our resize event and our showCalendar method.

```coffeescript
showCalendar: (e) ->
  mc = if e then $(e.target).data("minical") else @
  $other_cals = $("[id^='minical_calendar']").not(mc.$cal)
  $other_cals.data("minical").hideCalendar() if $other_cals.length
  return true if mc.$cal.is(":visible") or mc.$el.is(":disabled")
  mc.render()
  @positionCalendar().show()
  mc.attachCalendarKeyEvents()
```

```coffeescript
if @move_on_resize
  $(window).on('resize.minical', $.proxy(@positionCalendar, @))
```

Okay, that's already way better. `showCalendar` is far shorter and is being called one fewer time. But that conditional redefining of `this` could be done in a few different ways that are far more clean. It'll make far more sense to separate the event handler functionality into its own method. We'll do this by defining a `show.minical` event that calls showCalendar in the proper context.

```coffeescript
@$cal.on("show.minical", $.proxy(@showCalendar, @))
```

Now every other call to showCalendar can instead trigger the event on the element, and `showCalendar` itself is only being called in a single place.

Plus, if we do the same for the `hide.minical` event, we can reduce the "hide other calendars" functionality to one line, so these find/data/method lines ...

```coffeescript
$other_cals = $("[id^='minical_calendar']").not(mc.$cal)
$other_cals.data("minical").hideCalendar() if $other_cals.length
```

... become a single event trigger.

```coffeescript
$(".minical").not(@$cal).trigger('hide.minical')
```

Hey, our `showCalendar` method is almost sensible now:

```coffeescript
showCalendar: ->
  $(".minical").not(@$cal).trigger('hide.minical')
  return if @$cal.is(":visible") or @$el.is(":disabled")
  @render()
  @positionCalendar().show()
  @attachCalendarKeyEvents()
```

However, there's still one big problem: the calendar is re-rendering itself unconditionally every time it shows. We could add logic to `showCalendar` to combat this, but I don't think showCalendar should have to care if the calendar needs to be redrawn or not. It's only responsible for showing the calendar, after all.

To fix this, I ended up rewriting the `render` method and a bunch of the other event bindings. That's out of the scope of this blog post, but suffice to say I ended up with a new `highlightDay` method that is responsible for knowing when to redraw:

```coffeescript
highlightDay: (date) ->

  # try and find the day to highlight
  $td = @$cal.find(".#{date_tools.getDayClass(date)}")

  # bail if the day is illegal
  return if $td.hasClass("minical_disabled")
  return if @to and date > @to
  return if @from and date < @from

  # rerender the proper month and call itself again if the day isn't found
  if !$td.length
    @render(date)
    @highlightDay(date)
    return

  # highlight the day
  klass = "minical_highlighted"
  @$cal.find(".#{klass}").removeClass(klass)
  $td.addClass(klass)
```

So here's the current incarnation of `showCalendar`. (`selected_day` is an internal variable recording which day has been chosen and written to the input.)

```coffeescript
showCalendar: (e) ->
  $(".minical").not(@$cal).trigger('hide.minical')
  return if @$cal.is(":visible") or @$el.is(":disabled")
  @highlightDay(@selected_day)
  @positionCalendar().show()
  @attachCalendarEvents()
  e.preventDefault()
```

`showCalendar` is now less than half its original size. It doesn't need to know if or when the calendar is being redrawn, or even if the day it's supposed to be showing is legal. It's just responsible for highlighting the selected element (if there is one) and positioning the calendar element. Plus, the `highlightDay` implementation assures ow the calendar is only rendering when it needs to switch months. And there's just one conditional. Relief!

You can check out more about Minical over at [the Minical Github site](http://camerond.github.io/jquery-minical/). Overall, the rewrite process resulted in a rewrite of about 60% of the plugin, with a drastic increase in readability. I'm sure future me won't be quite as mad at present me as present me was at past me.
