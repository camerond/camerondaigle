title: 'Reading "The Humane Interface" - Early Impressions'
published: "2010-06-20 11:44 AM"
---

I've been reading Jef Raskin's [The Humane Interface](http://www.amazon.com/Humane-Interface-Directions-Designing-Interactive/dp/0201379376). It's packed with knowledge. Here's some.

### The Canon Cat's Startup Screen

Raskin references the Cat quite a bit in his book, and thanks to Wikipedia, I now know why: he designed the thing. Oh, Raskin also originated the Macintosh project. (It's possible that this information was in the book's prologue; nevertheless, now I know.)

> If we know where the user's attention is fixed, we can make changes in the system elsewhere, knowing that the changes will not distract the user. [...] When a user stopped working, the Cat stored a bit-for-bit image of the screen -- exactly as the display appeared when she stopped -- on the first track of the disk. When the user again loaded her disk, the Cat placed the most recently viewed image on the screen, in only a fraction of a second. (p. 29)

So the Cat _appeared_ to load your work instantaneously, but in reality, it cheated by loading a _screenshot_ of where you were last.

Sound familiar? Well, the iPhone (& iPad) use virtually the same trick. Apple recommends that, instead of a startup screen, your app display a screenshot PNG of its primary view. It's a sneaky illusion that shaves just a few instants off of the app's _perceived_ startup time. I thought this was a neat trick when I read about it for apps, but turns out it's been around for a couple of decades.

### A Solid Word Against Personalization, Also Applied Elsewhere

Emphasis author's:

> By providing preferences, we burden users with a task extraneous to their job function. A user of, say, a spreadsheet has to learn how to use not only the spreadsheet but also the customizing facilities. _Time spent in learning and operating the personalization features is time mostly wasted from the task at hand._ (p. 48)

Music to a UI designer's ears. Also:

> The central point of this issue is that if we are competent user interface designers and can make our interfaces nearly optimal, personalizations can only make the interface worse. (p. 49)

Preach!

So, Raskin's two arguments against customization are simple: 

- Customization is often the enemy of optimization
- Customization is another UI layer with which user must become fluent

The second point, I believe, is crucial -- not only to the idea of customization, but to interfaces in general. UI customization isn't the fad it once was, but it's been replaced by other tempting toys: CSS transforms, Javascript animations, asynchronous data handling, and so on.

Always ask yourself: is a particular UI solution, however creative and fashion-forward, requiring an extra layer of learning before the user can accomplish their original goal?

So, at risk of sounding patronizing: Interfaces should enable productivity. Productivity, as defined according to your _user_, is allowing them to accomplish _their_ task. If your interface design, however creative and fancy, becomes a task that they must accomplish _first_, it's a failure.

However, let's let Raskin play devil's advocate to himself:

> Where most of the users' time will be spent in routine operation of the product and where learning is only a small part of the picture, designing for productivity -- even if that requires retraining -- is often the correct decision. (p. 4)

So, what's the difference between "retraining" the user and getting in the way of their productivity? Well, if this was an easy answer, the world probably wouldn't need UI designers. However, I personally believe the answer needs to be intuitive, to some degree. Learning a new interface can either be an organic process of discovery (iOS apps are a huge opportunity for this -- make tappable items look tappable, and so on, and the user will learn quickly), or a chore. Know when to apply a new UI solution, and when to use the one in which your users are already fluent.

### The Pitfalls of Modal Behavior

"Modal behavior", in terms of interfaces, is (roughly) defined (by me, right here) as any input behavior that changes depending on context. 

Here's a fairly common example of poor modal design in hardware: you might have a TV remote with VOL UP and VOL DOWN buttons. They adjust your TV's volume, except when you're in a setup menu, where they're used to navigate up and down through the menu. Another example of terrible modal design: [the Griffin Navigate](http://www.griffintechnology.com/products/navigate). Six buttons, all of which have multiple modes, despite having specific functions printed on them. I love my former company, but that thing is an interface tragedy.

In software, modal keyboard behavior is very common, and something any computer user has learned to live with: try holding down Alt (or Ctrl, or Cmd) while you're attempting to type an email. No? Don't want to? Yep, you know what will happen: your entire keyboard will start issuing commands instead of typing.

Here's one that baffles me: in modern browsers, when a text area is active (i.e. you can type text into it), the Backspace (or Delete, on a Mac) key performs as requested - it removes the last letter that you typed. But, if the text area is inactive, it takes you BACK to your previous page. I can't tell you how many times I've accidentally left a page by not realizing I no longer had a text area highlighted. This kind of extreme behavior difference is, in my mind, a huge interface bummer.

By the way, the iOS eliminates this kind of modal hardware interaction almost completely. The keyboard only types letters, and tap is always a tap; there is no right-tap, no double-tap, and no drag-and-drop in Apple's app design.

_Correction to previous paragraph (thanks [@jaminguy](http://twitter.com/jaminguy)): while there is no double-tap to launch (the interaction I was thinking of when I wrote the above), there is a double-tap to zoom (duh). Drag-and-drop is used to move apps around, but drag-and-drop isn't used within any Apple apps. Although I'm open to a second correction._

I'll be reading more of this book, and hopefully posting more thoughts here soon. Hope you enjoy.