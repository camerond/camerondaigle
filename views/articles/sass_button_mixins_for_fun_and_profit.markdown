title: "Sass Button Mixins for Fun & Profit"
published: "2014-04-17 08:00:00 AM"
original_version: "http://hashrocket.com/blog/posts/sass-button-mixins-for-fun-profit"
---

Here's a SASS pattern for constructing mixins that I've been enjoying lately – and has saved me from a number of CSS-related headaches.

We'll be looking at strategies for styling buttons (and by buttons, I mean links, submits, actual `button` tags – anything that'll look like a styled action in your design). Buttons are fantastic place to use [Sass mixins](http://sass-lang.com/documentation/file.SASS_REFERENCE.html#mixins) – there are a number of ways that button mixins can not only clean up our code, but also avoid unhealthy patterns and unexpected consequences.

### From Classes to Mixins

Suppose I needed to make a general button style. Without mixins, I'd probably make a class definition of `button`, as coders have been doing since the dawn of time ...

```sass
a.button
  // green background
  background: #00aa00
  // with a slightly lighter green on hover:
  &:hover
    background: #33cc33
```

... and suppose I need to add a delete button that uses the same button style, but is red.

```sass
a.button
  // base button styles
  &.delete
    // red background
    background: #ff0000
    &:hover
      // slightly lighter red
      background: #ff3333
```

So each additional class modification needs a class with adjustments for the regular state as well as others (`hover`, `active`, etc). However, Sass lets us implement the same styles without all of the repetition and classes. We can define a `button` mixin, and then use that mixin for a second button – now we won't need to add two classes to our 'delete' button.

```sass
= button
  // button styles

a.button
  +button

a.delete
  +button
  background: #ff0000
  &:hover
    background: #ff3333
```

Better, but we're still having to rewrite the hover state color when we modify our button. We can streamline this one step further by moving our background color into the mixin, and creating the `:hover` state programmatically using Sass' powerful color math functions:

```sass
= button($bg: blue)
  background: $bg
  color: #fff
  &:hover
    background: lighten($bg, 10%)

a
  &.button
    +button
  &.delete
    +button(#ff0000)
```

### Burned By Inheritance

Now, we've constructed a nice mixin pattern for any future buttons, there's one other potential problem. In the great class inheritance rulebook, a single class is the _weakest_ selector – that is, it's overridden by literally anything else that might accidentally point to your button. For example, you might not intend for this code to override the font size on your button, but it will:

```haml
.bully_container
  %a(href='#' class='button') I'm not supposed to be 30px
```

```sass
a.button
  font-size: 12px

.bully_container
  a
    font-size: 30px
```

There's a fundamental issue here that you might have noticed: our buttons are global classes with the _shallowest possible_ selector, yet the button itself will always be _deep within_ your DOM structure – the deepest, in fact (given that there will probably not be any elements within your button). A button is essentially a CSS inheritance endpoint.

Well, this is great news for mixins. One of the dangers of mixins is that they can inject styles anywhere and disregard the actual cascade, so sloppy usage can result in unexpected style inheritance. However, since the button is the end of the chain, we don't have to worry about its nonexistent children.

### Try not using global classes (no, really)

What I've started doing lately takes this system to its logical conclusion: avoiding global button classes and instead scoping mixins to specific buttons (or containers that have buttons).

For example, our forms typically have a set of actions at the end (to submit, cancel, etc). We'll put those actions in a `fieldset.actions` and scope mixins to that area. So here's how that would look for a submit button, a grey 'cancel' button, and a red 'delete' button:

```sass
fieldset.actions
  input[type='submit']
    +button
  a
    &.cancel
      +button(#888)
    &.delete
      +button(#ff0000)
```

I typically even abstract out the buttons into a set of mixins, which allows us to DRY our button colors even further. The mixins end up looking something like this:

```sass
= button-base($color)
  // button styles

= primary-action
  +button-base(#000)
= secondary-action
  +button-base(#888)
= destroy-action
  +button-base(#ff0000)
```

And, for our styles:

```sass
fieldset.actions
  input[type='submit']
    +primary-action
  a
    &.cancel
      +secondary-action
    &.delete
      +destroy-action
```

So there you have it. We've written refreshingly minimal Sass, we're inheriting any state changes (`hover`, `active`, etc.) automatically, and we're avoiding any unexpected inheritance from the rest of the DOM chain. As a plus (I consider it a plus, anyway), our class names are now more semantic – they indicate the action taken – and we don't need to throw a global 'button' class on everything.

This class-light and mixin-heavy philosophy might be a bit out of the norm, but it's been serving me well as of late. Moving specific button styles from a class inheritance structure to a mixin inheritance structure results in fewer classes and less markup overall, and also results in much more flexibility in terms of semantic class naming. Give it a shot – it might just work for you.
