title: "Podcamp Nashville 2010 Presentation"
published: "2010-03-08 11:05 AM"
---

For the few dozen faithful of you that attended PodCamp Nashville 2010 (and the even fewer dozen that read my articles) (lots of love to you all), here are the slides from my segment of Griffin Technology's presentation, entitled "Is The iPad Just A Big iPhone?" (Yes, we realize that the word "the" before "iPad" is against Apple rules. Rebellion!)

We were (secretly) hoping to get some folks on the offensive (or defensive) with that title, but the audience was actually quite civil and inquisitive. Which was good as well! 

The presentation was meant to have no barrier to entry – nothing super-technical, just some observations about how iPad is going to turn the user experience on its head.

You can [download a PDF of our slides](http://bit.ly/apdCIh), watch me mumble it up in this [very iPhoney iPhone video](http://www.youtube.com/view_play_list?p=39B5CAB3716BAEAB) of my talk (graciously provided by [Cintron](http://twitter.com/loudestnoise)), or (preferably) read on for the directors-cut blog-entry version of my segment.

![A couple of folks called out "yeeeeesssss" right here, but didn't have the cojones to follow it up later](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.001.jpg)

Let's get this out of the way:

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.008.jpg)

Rather, iPad is:

![I know, right?](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.009.jpg")

![Presentation structure! Dramatic opening lines! Solid gold. Um, where were we? Ah yes.](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.010.jpg)

![I find it ironic (or just amusing) that Microsoft has trademarked both of these terms.](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.011.jpg")

iPad is not a window-based interface -- rather, it's _surface_-based. The scrollbar, a standard feature of a window-based UI due to the infinitely variable sizes of windows, is a crutch in this environment. Full-sized apps will need to be developed specifically for, and live comfortably in, the iPad's form factor.

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.012.jpg)

Consider the homepage of the App Store on iPad. This could very easily have been a few feature images above a scrolling table view, but Apple chose to place a CoverFlow-style feature section above a section of apps that is traversed by horizontal swiping – all fitting nicely within the surface. And although I haven't seen it, I will bet you a beer that the landscape version of this App Store view rearranges itself in a way that vertical scrolling still isn't necessary.

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.013.jpg)

Even the scrolliest thing on your computer – the Internet – may look kind of funny for a while. Check out the New York Times homepage: easily twice as much content is visible. Think of the thousands of webpages out there with pages that take up half that amount of space and don't account for it! I know for a fact that I'll have to redo some of my own sites so they won't end up with a footer floating halfway down the iPad screen (with awkward white space below).

(Pro tip: expect _copious_ amounts of position:fixed elements in iPad-optimized webpages.

__- - - FYI - - -__

_Many of you have contacted me in regards to position:fixed not currently being supported in Mobile Safari. This is completely true, and I wrote that statement with implicit trust that Apple would throw web designers a bone with this one ... but the more I think about it, the more I suspect that position:fixed is disabled because it undermines the panning functionality of Mobile Safari. Chew on this one: Mobile Safari does not __scroll__ at all -- it __pans at various zoom levels.___

_So, I'm probably wrong, is what I'm saying._

_We now return you to your regularly scheduled article._

__- - - / FYI - - -__

Here's a (possibly tremendously important) thought: the iPad is a _portrait-oriented personal computer._ Everyone has been so caught up with the touchscreen, whiz-bang look, and thinness (of Jobs and iPad both) that they've failed to be properly _stunned_ at the realization that Apple is about to release the first natively portrait-oriented personal computer to hit the market in decades.

Another thought: The New York Times viewed on an iPad is arguably closer to _print_ design than _web_ design.

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.014.jpg)

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.015.jpg)

This is the iPad screen area, pixel-for-pixel, relative to the iPhone. (The actual physical size difference is slightly greater because of the lower resolution of the iPad's display.)

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.016.jpg)

512%, my friends. That is 5 times as much screen area for your users to scan and understand. iPhone has a relatively miniscule surface on which to place controls – essentially four corners and a middle area. iPad has a much, much larger blank canvas to fill.

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.017.jpg)

"But 1024x768 isn't very much space", you say. "I have a 19" monitor", you say. But how many programs do you keep open in a 1024x768 window (other than Safari)? Hmmm?

Here's why this section is about Controls: every day, your cursor protects you from unclear UI. It helpfully turns into a text cursor as you hover over textboxes, or a hand as you hover over a link or action item.

iPad has no such thing. Bad UI will stick out like a sore thumb, both in apps and on websites. Your tappable areas had better look tappable. Your controls had better look controllable. That decorative little page-curl in the corner of that entry had better turn a page. Without being able to subconsciously hover-to-test, users will end up frustrated at anything that doesn't do what it looks like it should do, or vice-versa.

![I can't legally say if we're currently working on this problem.](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.018.jpg")

As for the screen space issue, consider [iTalk Recorder](http://camerondaigle.com/v1/work/italk_2.0/), with UI designed by yours truly. The recording screen has exactly 3 controls: "Done", the recording name text field, and the Big Red Button. The listing screen has only a handful more. How will iTalk be expanded to fill 5 times the screen space without looking completely absurd?

I'll tell you what _isn't_ the solution to that design challenge: scaling everything up. A 4-inch-diameter Big Red Button will look like a prop from a Pee Wee Herman episode. Lots of empty textured space will look awkward. That recording listing would probably be a dropdown like Apple's Mail app on iPad, so it won't be there in portrait view. What's left to fill that space?

It's interesting to think about how much trouble some apps will have just _taking up enough space_ on the iPad display.

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.019.jpg)

The first round of iPad apps will be extremely interesting to experience. Many will feel strangely sparse. Others will attempt to compensate with freakishly oversized controls. Others will go off the deep end and become cluttered and confusing.

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.020.jpg)

Here's a standard rule in application development and UI design:

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.021.jpg)

Think about it. In your browser right now, just browse through the File, Edit, View menus. Hit Preferences. Right-click on anything at all. How many of those options do you use? Chances are it's way, way less than 20%. Are you a graphic designer? Think about Photoshop or Illustrator. Come on, man, you know you scan right through that Filter menu looking for Blur, and you probably haven't made a Picture Package in your life

However, let's update this rule for the year 2010.

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.022.jpg)

Here's why. Let's use Apple Mail as our example.

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.023.jpg)

Those are the controls available to the user within the standard Apple Mail window. A dozen, at least -- not counting the options under the Settings popup in the lower left corner and the standard maximize/minimize/close window controls.

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.024.jpg)

But let's not forget about the menu bar: around a hundred more actions, 2 clicks away. You get the idea.

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.025.jpg)

Let's compare that smorgasbord of options to Mail on the iPhone. In a mailbox listing view, there are exactly 6 actions the user can perform (not counting swiping to scroll). Every other action is compartmentalized away in views where they are more relevant, or removed entirely.

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.026.jpg)

So is iPad Mail a chopped-down desktop Mail, or an expanded iPhone Mail? The answer is pretty immediately evident: this is iPhone Mail, all grown up. Wonderfully clean. Message controls along the top, mailbox listing in a dropdown (or sidebar, in landscape view).

This is an _absolutely essential_ lesson for app developers. Applications that think the 20% Rule still applies in the streamlined, intuitive world of the iPad will find themselves woefully outdesigned by folks who Get It.

Apple has been headed this way for years, slowly chipping away at the user's passive acceptance of this rule. Dashboard widgets grew into iPhone apps, which will grow into iPad apps, and finally, this way of designing will start eating away at the world of desktop apps.

One day soon, any Mac hardware that has "File" and "Edit" menus at the top will be considered "Power Users Only" territory.

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.027.jpg)

Bob and weave. Right jab, right jab,

![](http://s3.amazonaws.com/camerondaigle/articles/griffin-podcamp-talk.028.jpg)

Uppercut.

(I'm left-handed.)