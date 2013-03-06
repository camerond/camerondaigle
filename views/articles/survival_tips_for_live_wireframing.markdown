title: "Survival Tips For Live Wireframing"
published: "2012-10-12 08:00:00 AM"
original_version: "http://blog.hashrocket.com/posts/survival-tips-for-live-wireframing"
---

Hashrocket projects kick off in a big way: the client comes to town (or occasionally we go to them), we all sit in a big room, and we make wireframes and write story cards for up to 3 days solid. But it hasn't always been this way.

### The 5-Day Slog

In the earlier days of Hashrocket, wireframing and story carding took place in independent sessions. When the sessions were finally combined into one hybrid session – something I personally pushed for on my first projects here, as I couldn't imagine not being able to communicate visually with the client when discussing functionality – the meetings were monsters, commonly lasting 4-5 days.

As you can imagine, after the 3rd day or so, energy levels dipped, burnout kicked in, and – most importantly – we would find ourselves diving into features that were too far away: we've learned since then that, inevitably, requirements and features will change and mature, rendering story cards set 2-3 months into the future completely obsolete by the time they're needed.

So, here's what we do these days: our team (designer, developers, project manager) and their team, 3 days, one room, looking to hash out the MVP (minimum viable product) of the client's app. We have a big TV hooked up to a Mac Mini, with half of the display showing the project manager's VIM window as he writes story cards, and the other half showing our wonky-but-lovable wireframing tool of choice, [Balsamiq](http://www.balsamiq.com/).

### 1. Wireframe interactions, not layout. 

The first thing I tell the client when we get to the point of actually starting up Balsamiq and building our first wireframe (usually about halfway through the first day) is that Balsamiq is __deliberately ugly__. Seriously. The typeface is [some bastardized Balsamiq-only thing](http://support.balsamiq.com/customer/portal/articles/131378-balsamiq-mockups-font-faq) that replaced Comic Sans / Chalkboard in earlier versions.

I have no idea if the Balsamiq team intends that we treat "ugliness" as a feature in the way we do, but: for all of its design flaws, I love that Balsamiq is ugly and lo-fi. It helps me (and the client) focus on what the wireframes are representing from a functionality standpoint and not get into discussions about whether the nav should be on the left or the top, or whether the heading should be centered, or whether there should be a ... you get the idea. We're in a story carding session to hone down what their app _does_ – we don't want to be going off on a visual tangent as to how that should _look_.

This rule isn't set in stone – sometimes visual design conversations are absolutely necessary in story carding. And sometimes it's hard for me to just wireframe a simple table when my designer sense knows the final solution will be much more interesting than that. But the designer's role in story carding is to help with the concept, flow, and interactions of the app, and staying focused on that is what helps keep the session on track.

### 2. Only wireframe what exists

Here's how not to begin a wireframe: Logo, navigation element, and asking the client "okay, what're the items that go into the navigation here?" – because the nav should be empty at the start of the day: it's there to support navigation between features, and those features don't exist yet.

We __always__ wireframe from the perspective of a set of features and let that dictate the outer structure of the app. For example, in an app that allows simple management of clients & companies, we'll walk through the wireframes for listing, creating, and viewing a company first, at which point I'll add an item to the navigation: "Companies". And then we'll do the same for clients, and I'll add that – or maybe I won't, because maybe clients belong to companies, in which case we'll add a subnav to a company's page and go from there. See what I mean? Features dictate structure. And if we need to wireframe a dashboard, or homepage, or other page that's dependent upon other content, we wireframe those last.

This makes sense enough for design, but is absolutely essential to story carding, as we try to write stories in the order that they need to be delivered (for example, the developers can't deliver a "user views company" story until they've done the "user creates company" story). This approach can also be a challenge to design, because you have to let go & relax about what the more design-heavy pages (dashboard, homepage, etc) will look like until you've gone through the supporting pages.

This approach will inevitably lead (in Balsamiq, anyway) to a bunch of inconsistencies between files: navigation & other shared elements in various states of completion. However:

### 3. Get messy – you can tidy up later.

Story carding with a client can and should be a messy process, where feature sets are changed, wireframes are scrapped, conversations go back to the whiteboard, and (this has happened multiple times) the team lets an idea gestate overnight and comes back the next day with a fundamental shift in the app's concept. We roll with the punches – when something changes the nav, for example, the current wireframe is adjusted and we update the rest later, after the session is over.

Look, the last thing I as a designer want is 8 pairs of eyes staring at me while I noodle with the last 15-odd wireframe files and make sure everything's up to date. I'm still guilty of that occasionally (cut me some slack, I'm a designer and that button was misaligned and it was LITERALLY KILLING ME) but the name of the game in story carding is not to let the process get in the way of the discussion. So files are scrapped, quick sticky notes are thrown into the corner of wireframes, and when the client's not physically present in the room, I'll go back in, tidy up the joint and post a professional, organized set of wireframes to Basecamp.

### Now get to it!

Lo-fi now, high-fi later! After story carding is complete, we get to dig into those ugly, simplistic wireframes and work on real mockups, and it's a blast every time. The wireframes have done their job – they've provided a visual representation of all those long feature conversations – and when the client sees the real comps, the only surprises will be good ones (it's so pretty now!) instead of bad ones (what's this button doing here?) and the project will have taken its first steps toward success.