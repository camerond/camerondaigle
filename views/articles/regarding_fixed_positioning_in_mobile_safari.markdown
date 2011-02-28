title: "Regarding Fixed Positioning in Mobile Safari"
published: "2010-03-10 05:43 PM"
---

I don't want to retread ground here -- google ["position fixed mobile safari"](http://www.google.com/search?aq=f&sourceid=chrome&ie=UTF-8&q=position+fixed+mobile+safari) and you'll get plenty of solid articles about how to _simulate_ fixed positioning using CSS/Javascript. What I'm here to do is explain why my money is on fixed positioning __not__ being implemented on the iPad.

It has to do with the idea of the iPad/iPhone having a "surface" rather than a "window." (This isn't "proper" "terminology" -- I'm just using it for the sake of this illustration.) 

In full-size Safari, the browsing window that you have open are of variable size and width, and every time you resize said window, you're resizing Safari's entire _existence_. There is absolutely no concrete relation between your Safari window and your physical screen area. When your Safari window is smaller than the content it's displaying, scrollbars pop up to allow you to move the content around. Not rocket science, I know. Stick with me.

![](http://s3.amazonaws.com/camerondaigle/articles/201003_surface-1.jpg)

The content which you are viewing is constrained within a window, and said window is constrained within the actual physical display area.

Now, here's the iPad/iPhone:

![](http://s3.amazonaws.com/camerondaigle/articles/201003_surface-2.jpg)

What I mean by no "window" on the iPad/iPhone is simple: Safari is tied inextricably to the actual, physical screen area. There is only Safari and the MultiTouch surface, with no arbitrarily resizable view instance in between.

I honestly think this is part of what Jobs is talking about when he refers to the iPad being a more immediate experience. You, touching your app, through a _physical_ window instead of a _digital_ one.

I know this is kind of the long way around to get to my point, but I honestly think this fundamentally windowless approach is not getting the attention it deserves. I know you're getting antsy, though, so here's how that ties to fixed-position elements:

Fixed-position elements attach themselves to the "window", and resize along with it. Consider my secondary blog, which has a fixed-position element in each corner and a liquid main column:

![Yay!](http://s3.amazonaws.com/camerondaigle/articles/201003-propcal-1.jpg)

On first load, looks dandy, right? But what if you zoom in?

![WHERE IS YOUR GOD NOW](http://s3.amazonaws.com/camerondaigle/articles/201003-propcal-2.jpg)

I mean, what the heck else are those elements supposed to do? Should they stay attached to the corners of the viewport (see above: _not the same as a "browser window"_)? Should they only exhibit the proper "sticky" behavior at 100% zoom? What, exactly, is "100% zoom" in the world of Mobile Safari? The entire "fixed" interaction is dependent upon a thing called a "window" existing upon which to "fix".

I also made this point in the previous article, but it deserves repeating: you don't _scroll_ in Mobile Safari -- you _zoom and pan_. Good luck coming up with a CSS behavior that can keep up with that.

I'm sure the Javascript solutions will continue and probably be just fine. It's entirely possible that Apple may decide to support fixed-position elements in limited capacity (perhaps only when a website has disabled zooming, as one reader suggested), but I doubt it. I don't see them going out of their way to essentially _add_ CSS functionality to a mode that _removes_ interaction functionality from the Mobile Safari itself.

To me, though, this is really about the bigger picture. In my last post, I posited that any Mac hardware with “File” and “Edit” menus at the top will be considered “Power Users Only” territory. I believe the same will go for window-based operating systems. Just you wait and see.

