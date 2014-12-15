title: "Drop-in Responsive Styles With Sass"
published: "2014-09-04 08:00:00 AM"
original_version: "http://hashrocket.com/blog/posts/drop-in-responsive-styles-with-sass"
---

Organizing responsive styles into your existing stylesheet is always a challenge, but a simple Sass mixin can provide you with a dead-simple way to inject responsiveness wherever it's needed.

Here's the scenario. You've got most of your responsive styles specified within `@media` calls, but sometimes, even nesting responsive styles feels like overkill. When only one or two items are changed responsively, lines of code can add up quickly. For example, say I have an element with a bunch of styles that only needs margin and font size to change at 800px or smaller:

```sass
.my_cool_element
  font-size: 24px
  margin-bottom: 40px
  // a ton of other stuff here
  @media screen and (max-width: 800px)
    font-size: 18px
    margin-bottom: 20px
```

There's a simple readability issue here: there might be a lot of lines of code in between the original and the responsive styles. Plus, if I want new styles at a second breakpoint (e.g. 480px for mobile), I'll need to list each attribute a third time under a new `@media` call.

This got me thinking. Given that I was finding myself using at most two breakpoints (roughly tablet-sized and roughly mobile-sized), and very often was only changing a few attributes per selector, was there a way to knock out all possible attribute values on one line?

Enter the `responsive` mixin.

```sass
= responsive($attr, $full, $mid:false, $narrow:false)
  #{$attr}: #{$full}
  @if $mid
    @media screen and (max-width: 800px)
      #{$attr}: #{$mid}
  @if $narrow
    @media screen and (max-width: 480px)
      #{$attr}: #{$narrow}
```

Here's the magic: with this mixin, I can specify all of my breakpoint values in one place. I just pass the attribute to `responsive`, along with each breakpoint's value.

```sass
.my_cool_element
  +responsive(font-size, 24px, 20px)
  +responsive(margin-bottom, 40px, 20px)
  font-size: 24px
  margin-bottom: 40px
```

So if I need to add more attributes at the 480px breakpoint, I can just pass a third value to the appropriate `+responsive` call:

```sass
.my_cool_element
  +responsive(font-size, 24px, 20px, 16px)
  +responsive(margin-bottom, 40px, 20px, 10px)
  font-size: 24px
  margin-bottom: 40px
```

I've found this technique to be tremendously useful for sprinkling my stylesheet with responsiveness. (I also recommend abstracting your breakpoint sizes into Sass variables, but that's outside the scope of this post.) Obviously you'll encounter scenarios in which you're changing 5 or 6 attributes, at which point that element will have outgrown this technique – but once I started approaching responsiveness with this mixin, I found it was cutting down on lots of verbose `@media` nesting.

So, give `+responsive` a shot! Maybe it'll make your life easier.
