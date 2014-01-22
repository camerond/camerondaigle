title: "Anatomy of the new Hashrocket: Frontend Design"
published: "2013-08-16 08:00:00 AM"
original_version: "http://hashrocket.com/blog/posts/anatomy-of-the-new-hashrocket-frontend-design"
---

We launched a new version of the Hashrocket site recently. This new design is a ground-up redesign & rewrite of the frontend – much of the backend was rewritten as well, but I'm a design guy, so if you want a backend breakdown, you'll have to buy Matt Polito an ice cream cake or something. Here's some cool stuff about the frontend.

### Liquidity

The Hashrocket site is designed to look good on a continuous spectrum from 1200px wide down to 320px. We don't target specific devices or widths – responsive sites are about making sure a site looks good at any size.

Base styles are designed for the widest viewport, and additional styles override those as the site gets narrower. We've found it's much more straightforward to design first for more complex wide layouts and then remove attributes (columns, for example) as the page becomes narrower than vice versa.

You can learn more about our patterns for responsive design in [this previous post of mine](http://hashrocket.com/blog/posts/using-sass-to-be-responsive-and-retina-ready), but the tl;dr of it all is that you should design wide, override narrow. 

### Retina Images

Only certain images on the new Hashrocket site are doubled up for retina: the header logo, for one, because I wanted to make sure it was sharp and not being resized by the browser. So the logo maintains its size no matter the width of the device, and the spacing around it tightens up as the window gets narrower.

The open source icons on the [Community page](http://hashrocket.com/community) and contact forms are doubled for the same reason – and the social icons in our footer & people page are simply [SymbolSet](http://symbolset.com) characters.

All other images on the site are not doubled up for retina. For example, each illustration on [the Process page](http://hashrocket.com/process) is in a column set to a width of 25% (actually 23.5%, thanks to additional margin) – so even though the images themselves are 360x190, even at that page's widest point (1200px), they're only rendered at 282x149. We found that was enough breathing room for the images to look nice in retina as well as all browser sizes.

The same sort of thing applies to the slideshows on the client detail pages and homepage. The homepage features a slideshow where the images are actually 1200x600 despite being rendered at 862x431 at their largest non-retina size – a compromise to allow for decent file sizes without depending on a second set of slideshow images loaded through a Javascript call or media query.

I think this will happen more and more as retina becomes the standard: it will be more important for images to have exact proportions rather than exact pixel sizes, because pixel accuracy won't be as much of a concern.

### Fun with `background-size`

The header backgrounds on our site (for example, the astronauts on [the team page](http://hashrocket.com/team)) are all being displayed smaller than native, and thanks to `background-size`, they always fit the content area properly.

This took a few tries to get right. The height of that header area is dependent upon the content, and the width is obviously variable all the way down to mobile, so multiple size-specific background images would be a pain (and result in jarring transitions as you resize your browser window) – and fixed-pixel background sizes would be inconvenient to maintain.

The solution was actually far simpler than I initially realized. The header section just has a background image with a `background-size` of `auto 90%` – that is, `auto` width, `90%` of height. So as the page gets narrower, the background image gets smaller, and if the text gets longer, the background image grows to fit. Piece of cake, actually – it just took some getting used to to think of a background image as such a fluid element.

### The Cycle2 Plugin

Our slideshows are courtesy of the indomitable [Cycle2](http://www.malsup.com/jquery/cycle2/) plugin, combined with the [Carousel](http://www.malsup.com/jquery/cycle2/download/) transition plugin. The original Cycle plugin (contributed to by our own [Shane Riley](http://hashrocket.com/team/shane-riley)) was solid and used often on our projects, but Cycle2 adds the ability to handle varying sizes, and does so very easily.

Here's how that works on our homepage. First, we have a couple of divs enclosing a set of images:

```haml
.slides
  .pano
    - (1..12).to_a.shuffle.each do |i|
      = image_tag "img_home_#{i}.jpg"
```

We call the cycle plugin. There's a little more going on here (events, a little cuteness to center the first slide), but this is the main initialization:

```javascript
this.$el.cycle({
  fx: "carousel",
  paused: true,
  carouselVisible: 3,
  carouselFluid: true,
  swipe: true
});
```

Here's the trick. The carousel plugin has a `carouselVisible` parameter that controls how many slides are shown at once. This is how it calculates the height of the carousel – we don't set that ourselves. However, we don't want 3 whole slides visible – we just want the edges of the left & right slides to be visible. So, we do this:

```sass
.slides
  overflow: hidden
  .pano
    margin: 0 -40%
```

The negative margin on the `.pano` accomplishes what we want. The Cycle2 plugin is still sizing for 3 slides, but we're just letting those bleed off of the edges.

Additionally, at a certain width, we don't want to show the edges of the left & right slides anymore. So, using the media query mixin detailed in [my aforementioned post about that](http://hashrocket.com/blog/posts/using-sass-to-be-responsive-and-retina-ready):

```sass
+max-width
  .slides
    .pano
    margin: 0 -100%
```

Voila! Clean and nice.

### Etc.

So there you have it. It's really exciting to have launched something that I consider to be such a huge step forward from our old site. There are other interesting bits & pieces out there – I'll leave the implementation of the faux-chart on our homepage as an exercise for the reader – but those were some of the main tricks & techniques we used. Thanks for reading.