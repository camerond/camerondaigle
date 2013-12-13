title: "Using SASS To Be Responstive and Retina-Ready"
published: "2013-04-26 08:00:00 AM"
original_version: "http://hashrocket.com/blog/posts/using-sass-to-be-responsive-and-retina-ready"
---

Responsive design is much more than just a buzzword and a loosely-organized set of principles – it's a design technique that requires you to approach almost every problem differently than a traditional website. It's also a pain to code. We're neck-deep in a new Hashrocket site design that's fully responsive and uses retina assets – and from that project (and others like it) we've ended up with a pretty solid starting point for tackling those requirements:

### Get iOS to Behave Responsively

There are two crucial lines of code you'll need to make pretty much anything responsive work properly: a `meta` tag and a `webkit` tag.

Put this in your `<head>`:

```haml
%meta(name="viewport" content="width=device-width, initial-scale=1")
```

This just tells the viewport to conform to your device width (so you don't have landscape mode appear larger than portrait mode, for instance) and scale properly. Some Googlings of this technique also might result in code recommendations to add in a `maximum-scale` value; this disables pinch-zooming and usually isn't necessary.

Put this in your Sass (or SCSS, whatever):

```sass
body
    -webkit-text-size-adjust: none
```

You probably know this one - it prevents iOS from sizing up your text for readability. If your site's properly responsive, you're taking care of font size with @media queries.

### The Viewport Width Mixin

Here's our mixin for keeping ourselves sane in the world of media queries. (This one and others require a newer version of Sass that supports passing content blocks to mixins; you should be using that anyway.)

```sass
= max-width($width: 640)
    @media screen and (max-width: #{$width}px)
        @content
```

Easy as pie. Just set the `$width` value to whatever you decide is your primary site breakpoint, and add others as necessary. This lets us write rules quickly and read them easily:

```sass
.foo
    margin: 60px
    +max-width
        margin: 40px
    +max-width(480)
        margin: 20px
```

### The Retina Mixin

Retina backgrounds are their own set of `@media`-based pain. Here are a pair of mixins that made our lives easier:

```sass
= retina
    @media screen and (-webkit-min-device-pixel-ratio: 2), screen and (min-device-pixel-ratio: 2)
        @content
= retina_bg($filename, $dimensions: false, $ext:"png")
    background-image: image-url("#{$filename}.#{$ext}")
    +retina
    background-image: image-url("#{$filename}@2x.#{$ext}")
    @if $dimensions != false
        background-size: $dimensions
```

The `retina` mixin is just generally helpful; the `retina_bg` mixin is absolutely essential. With `retina_bg`, we can write our retina background image styles in one line:

```sass
.bar
    +retina_bg("logo", 100px)
```

Now non-retina devices use `logo.png`, while retina uses `logo@2x.png`, like the iOS filename convention. It's worth noting that `background-size` isn't always necessary, so it's behind a conditional and just doesn't assign if it's not specified.

### Take Care Of Yourself Out There

I sincerely hope this post is useful to you and isn't just adding to the noise of `@media` tips that are out there these days. If you start with these pieces, you'll be well on your way to writing responsive styles that don't muck up the rest of your CSS and help you keep all those widths & ratios sorted.