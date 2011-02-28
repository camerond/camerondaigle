title: "A Normal Person's Guide to Quicksilver"
published: "2009-03-26 01:36 PM"
---

_(This is an old article from a previous version of the website that I thought deserved reprinting here. I attempted to explain QS in terms that anyone can follow, and as such, the article is far too long. I hope you enjoy anyway. - C)_

Here's what's going to happen: I'm going to teach you how to install and set up Quicksilver. Once we're done here, you will be ready to use it every day, and almost immediately, you will wonder how you ever got by in OSX without it. 

This goes for all of you -- but this article is specifically for those of you that have never heard of it (heretofore arbitrarily referred to, for the sake of clarity, as "normal people"). The rest of you can do what I did and slog through one of the dozen or so instructionals online. 

I am forewarning you: This article will be long, but that's because I'm making it _easy_. Fear not! I'll walk you through every step -- this is a guide for laypeople such as yourself, and it's based precisely upon my personal experiences with slogging through the aforementioned tutorials.

Alright, enough hype-talk. Before I even tell you what Quicksilver is, let's answer a more important question:

### What can Quicksilver do for me?

When we finish, you'll be equipped with the following:

* The ability to launch applications with a _single keystroke_
* A slim, trim dock that _only_ shows what programs you have running
* A near-instant search tool that knows to look at ONLY the files (and bookmarks) you care about (like a custom Spotlight search)
* A quick, easy way to resize images for email (without Photoshop)
* And just for fun, a calculator and a dictionary.

Even if that doesn't sound like much, trust me, it'll change the way you interact with your computer from now on.

### What is Quicksilver?

Well, it's mysterious, for some reason, and it just shouldn't be. Blacktree (the people responsible) describe it as "A unified, extensible interface for working with applications, contacts, music, and other data." Zzzzz. You probably checked out around the word "extensible", and I don't blame you.

However, maybe that's as clear as it gets: it's true, Quicksilver is an interface. It's kind of like a Spotlight (you know, command-space on your keyboard) that can also perform actions -- like "email this item" or "open this item in X program." So it doesn't just search; Quicksilver searches, and then it can _act_.

However, Quicksilver's greatest weakness (at least to non-power users) is that it's _too_ powerful -- it really can do all sorts of stuff. You can do things using Quicksilver that aren't necessarily any quicker or better than doing them the regular way. That's a very subjective call, though -- so for this article I'm limiting the Quicksilver techniques to the ones I personally use day-to-day. 

That said, you and I aren't looking for a tool that can do anything -- our goal is to have a tool that can make your computer easier to use, period. Fortunately, we can easily mold Quicksilver into just that.

#### Step 1: Installation

First things first: [click here to download Quicksilver](http://download.blacktree.com/download.php?id=com.blacktree.Quicksilver&type=dmg&new=yes). Double-click on yonder file and let's get started.

* You'll be greeted with Quicksilver's spiffy welcome screen. Click "continue" and then accept the license agreement.

* Ignore the "recommended plug-ins" page (make sure they're all unchecked). The way Quicksilver interacts with the other programs on your computer is through plug-ins, but I'll walk you through which ones to worry about later.

* Keep the activation key as `ctrl+space` unless you really hate the "control" button for some reason. Personally, I like having Quicksilver next to Spotlight (command-space), as they're similar functions (that is, if you ever even need to use Spotlight again after this).

* Keep the "Catalog Update" at Every 10 minutes. 

* Click Continue, Continue, and Finish. Installation complete! Onward!

#### Step 1.5: Try it!

Before we fine-tune Quicksilver into a mean green your-workflow-helping machine, you probably want to know how it works. So:

* Type ctrl-space. This is called "Invoking Quicksilver". From here, all is possible. A window will pop up that looks like this:

![The initial Quicksilver screen. We’ll change this shortly.](http://s3.amazonaws.com/camerondaigle/articles/quicksilver_1.jpg)

* Type the name of a program. "iChat", for instance. You'll see Quicksilver pull it up almost immediately. Hit Enter and iChat launches, or press Esc to make the Quicksilver window go away.

* Now, invoke Quicksilver and type the name of a folder. "Desktop", or "Documents", for example. You'll see that folder pop to the forefront. Hit Enter to open the folder, or Esc to exit.

* You'll see whatever phrase you are typing there at the top of the window. If you mistype, just hit Esc to exit the window, or wait a breath and retype; Quicksilver will replace whatever you had just typed.

* Note that you don't have to type something in order. Typing "ments" will probably pull up your Documents folder, and typing "ail" will probably pull up "Mail", and so on. It's pretty smart.

* Also note that a submenu pops up with other possible results. You can scroll up and down in that menu using the arrow keys, and just hit Enter to launch the selected item, or you can use the mouse (I guess, but it's slower).

* You can also use the arrow keys to browse through folders in the same menu. Try it - invoke Quicksilver, type "Documents", and hit the right arrow key to wander into your Documents folder.

This item-finding functionality is the core of Quicksilver. Play around with it; try typing different filenames in and getting used to the whole 'invoke, type' process. You'll find it's quite intuitive.

#### Step 2: The Plug-ins

Naturally, in order to configure everything right, we have to first download everything we want to configure. So, let's get started - it's a breeze.

* With Quicksilver open, click "Quicksilver -> Plug-ins ..." in the menubar to bring up the Plugins window.

There are something like 6 dozen plugins available, but we only want a few specific ones. Click on "All Plugins" on the left-hand side, and then click the checkboxes next to the following plugins. As you click each one, Quicksilver will install it. They'll each take about 5 seconds to install.

* Calculator Module
* Dictionary Module
* Flashlight Interface
* Image Manipulation Actions

That's it! This step is over.

#### Step 3: Basic Preferences

Let's get Quicksilver ready for action.

With the Plugins window still open, click the big button that says "Preferences".

Check the following checkboxes:

* Start at login
* Enable advanced features (when prompted, click Relaunch, it takes like 2 seconds)
* Show icon in menu bar (optional; this just displays Quicksilver next to your Wifi indicator in the upper-right for easy access to preferences and such)

![Here’s what your preferences pane should look like.](http://s3.amazonaws.com/camerondaigle/articles/quicksilver_2.png)

Now click "Appearance" on the left-hand side, and then in the "Command Interface" dropdown, choose "Flashlight". There are a number of interfaces available (feel free to try 'em out), but Flashlight looks exactly like Spotlight, so it's the easiest to get used to, and my personal preference.

Now that Quicksilver is ready to go, let's tell it what to use. On to the catalog!

#### Step 4. The Catalog

Have you ever searched in Spotlight, only to be treated to a zillion temp or settings files with indecipherable filenames, when all you really wanted was to find something that was probably in My Documents anyway? Quicksilver can fix that, by letting you define exactly what it includes in its search catalog.

* While you have Quicksilver open, go to "Quicksilver -> Catalog..." in the menubar (or type cmd-;). This will bring up the Catalog (the folders Quicksilver currently has in its index).

What we want to do here is trim unnecessary folders (so the Catalog can run as fast as possible). See how there's a checkbox and a number next to "Applications"? That means Quicksilver is indexing that number of items in your Applications directory. The fewer items Quicksilver is indexing, the faster it'll go.

![Currently indexing 92 applications.](http://s3.amazonaws.com/camerondaigle/articles/quicksilver_3.jpg)

So let's trim:

* On the left sidebar, click "Quicksilver", then uncheck the box next to "Quicksilver Catalog Entries".
* Then click "System" on the left sidebar. Nothing to uncheck here; just note that Quicksilver indexes all of your preference panes (look under "configuration"). No more hunting around System Preferences for you! Now you can just invoke Quicksilver, type "mouse", and you'll be taken right to the mouse preferences.
* Lastly, click "User". Uncheck "Recent Items".

Trimming complete! Now for the fun part: adding your own directories.

By default, Quicksilver only indexes 1 layer deep - that is, if you have a folder in My Documents (or on the Desktop), it'll know that there's a folder there, but not what's inside it. Well, that's no good; if you're like me, you have a folder with stuff you care about in it, and it'd be great to find stuff in that folder immediately, right? So let's add it in.

* Click "Custom"., and then click the little plus sign at the very bottom of the window. In the resulting menu, click "File & Folder Scanner".

![Here’s the button I’m talking about.](http://s3.amazonaws.com/camerondaigle/articles/quicksilver_4.jpg)

* Here you can add whatever folder you want to the catalog. If you want Quicksilver to scan the Desktop more than 1 layer deep, for example, then add it here.

* Once you've added your folder, select it and click the little "i" button in the bottom right, and then click "source options". The "Depth" slider adjusts how many layers deep Quicksilver will index. The number next to the folder's checkbox will tell you how many items are currently being indexed -- if that number gets higher than a few hundred, then reduce the depth; we don't want Quicksilver to get bogged down with tons of files.

![A folder set for ‘infinite’ folder depth](http://s3.amazonaws.com/camerondaigle/articles/quicksilver_5.jpg)

Once you're done adding your folders, have a Coke and a smile. Your Catalog is slimmed down, customized, and ready to roll.

#### Step 3: Using The Damn Thing: Optional Awesomeness

So, since you're the most patient person ever, you've made it this far. Quicksilver is slimmed down, trimmed up, and rarin' to go. You could just take it from there and stop reading, but wait! Here's where I make good on my promises and tell you how to really maximize its awesomeness.

__Trim your dock!__

This is a fairly drastic measure, to be sure -- but once you do it, you'll never go back.

The idea is that once you've gotten used to launching applications using Quicksilver, you won't need to click on any blasted dock icons ever again. Drag 'em off the dock! All of 'em! I dare you! 

I personally have my dock pared down to just Quicksilver and the Trash. That way, the dock is only showing me the particular programs that are running - and it's waaaaay smaller.

Like I said, it's drastic -- and it's totally optional -- but it might just be that extra bit of reorganization you're looking for.

__Resize images without Photoshop!__

Let's face it -- you probably don't have Photoshop. Or, you do, and it's a pain to use when all you want to do is make an image from your 8-megapixel digicam small enough so that you can email it to Great-Aunt Brunhilde without it taking up her entire monitor (and Hotmail inbox).

Well, check it out. Remember that Image Manipulation plugin I had you install? No? Too long ago? Right. Sorry. Anyway, it will do the job for you.

What we need to do is give Quicksilver the image to be resized. You can either do this by invoking Quicksilver and searching for it, or "grabbing" it. 

To grab it, highlight the image's icon in the Finder, invoke Quicksilver, and then hit command-G. Voila! The image is now the active item in Quicksilver.

Once the image is active, we want to perform an action on it. Up until now, we've just hit "Enter" to open it, but we can do all sorts of things to an item (most of which aren't really useful, which is why I haven't bothered). 

* Once you've grabbed your image, hit Tab. Now the word "Open..." is highlighted.

* Begin typing "Scale Image" until that action is highlighted. (It's just like searching for an item, except now you're searching through actions.)

* Now hit Tab again, and type a phrase. This plugin is really quite powerful - it can handle a lot of different phrases, formatted like this: "SIZE as FORMAT". To make the image 400 pixels wide, type "400px" and hit Enter. To make the image a 400 pixel wide JPG, type "400px as jpg" and hit Enter, and so on. To keep the image the same size, but change it to a GIF, type "100% as gif". 

(Don't forget that "as" in the middle. For specific phrase details, check out the "i" button for that plugin in your Plugins list.)

Once you hit Enter, you'll see the new, resized image appear in the same folder as the original image. Photoshop - who needs it? You can resize images by merely typing a sentence.

(By the way, you can totally grab multiple items. Just select a whole bunch of pictures, invoke QS, hit command-G, and proceed as before. For example, I just saved all of the PNG screenshots for this article as JPG with one Quicksilver command - "fit 500x700 as jpg".

__Launch applications with a single keystroke, part 1: Force it!__

I already showed you the basics of launching applications/documents/whatever in step 1.5 -- let's take it to the next level.

So I assume that there's an application you use a lot. Let's just say it's Safari. Let's also say you're a big-game hunter, and you have a folder named "Safari" with photos of your latest exploits in big-game hunterdom. Well, when you invoke Quicksilver and start typing 'S-a-f-a-r ...', the folder might come up as the first result instead of the browser. Alas!

Here's how it works: Quicksilver assigns 'rankings' to every file, and raises and lowers the rankings based on how you access the file (it "learns" what you use more). So, if you always access Safari (the program) when you type "Safari", it will start ranking that more highly than the folder of the same name.

However, you can manually tell Quicksilver to rank something as maximum, so it will show up first whenever you type something:

* Invoke Quicksilver and type the first letter of the program (or phrase, or whatever you want that has been bringing up the wrong item). For example, in our big-game-hunter scenario, we'd type "S".

* You'll see that secondary menu of  results pop up. Now, using the mouse, find Safari, right-click on it, and select "Set As Default For S".

* Ta-da! Now, whenever you invoke Quicksilver and type "S", Safari will appear first.

__Launch applications with a single keystroke, part 2: Hotkeys!__

This second way is even cooler -- we just need to make a simple Trigger. Triggers are just pre-recorded Quicksilver actions that you can assign to hotkeys.

If you're on a full-size Apple keyboard, find F13, F14, and F15. They're so lonely over there above the arrow keys, and they don't do squat. What I've done -- and I think you'll like it -- is to assign them to iChat, Safari, and Mail, respectively. 

So, whenever I start up, I hit all 3 keys to launch all 3 apps immediately. And if I'm typing and someone IMs me, I just hit F13 to switch right over to iChat and answer them.

So, here's how to do that. Get back into the Preferences pane (however you care to do so) and click the Triggers button. Now click that + sign at the bottom left, and select "HotKey".

You'll see a window pop up that looks an awful lot like the window from Step 1.5 (before we changed our interface to Flashlight). That's exactly what it is - a Quicksilver invocation. 

Use your shiny new Quicksilver skills to highlight the program you want to launch, and hit "Save". Here's my example, for opening Mail:

![The Open Mail trigger, ready to save.](http://s3.amazonaws.com/camerondaigle/articles/quicksilver_6.jpg)

Now you have a command called "Open Mail" in your triggers. Click the "i" button in the lower right, click the area next to "Hot Keys", and type your own.

(Keep in mind that these hotkeys might override ones in other programs. For example, F13 is great because basically nothing uses it, but you might not want to assign something to command-C, because then instead of copying text, you'll invoke a Quicksilver trigger.)

On a laptop? No F13 key? Well, since alt-tab shuffles through open programs, maybe alt-Q is a good shortcut to switch straight to iChat. It's up to you. Be creative!

__Bonus round: Calculator and Dictionary!__

If you've made it this far, I congratulate you. Here's your prize: two Quicksilver plugins that are just as handy as can be.

To use the Calculator, just invoke Quicksilver, type =, and then type your equation. Hit Enter and the result is displayed. Ultra-useful for a quick math problem now and then.

To use the Dictionary, invoke Quicksilver, and type a period. This enters you into "text mode" - whatever you type here is treated as text, not a search. Type the word you want to define, hit "tab", and begin to type "Dictionary". Once "Dictionary" is the action, hit Enter, and your definition will pop up.

Of course, both of these actions are available in your Dashboard as widgets, but Quicksilver is about a zillion times faster than loading your Dashboard, and as you get used to invoking Quicksilver to do all the other stuff in this article, you'll find that these both come naturally as well.

#### You're Done! Now Go Play

I'm glad you're reading this sentence. It means (possibly) that you have read through this article, or at least skimmed it and thought "hmmm, I might try this."

Quicksilver will be worth your time, believe me. Soon, you'll be just like me, hitting ctrl-space on your friend's laptop and saying "Dude! You don't have Quicksilver? You definitely need to try it out ..."