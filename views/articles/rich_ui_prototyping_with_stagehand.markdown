title: "Rich UI Prototyping with Stagehand"
published: "2014-01-13 08:00:00 AM"
original_version: "http://hashrocket.com/blog/posts/rich-ui-prototyping-with-stagehand"
---

I'm a huge proponent of increasing designer/developer communication and easing the handoff between static and implemented markup – and Stagehand is my latest attempt to bridge the gap.

### Prototype UI without writing Javascript.

Stagehand is a jQuery plugin that allows non-developer-types to simulate the states of a page simply by adding a few data attributes. For example, if a designer or frontend dev needs to slice a search page into HTML/CSS, they can easily slice the [blank slate](http://gettingreal.37signals.com/ch09_The_Blank_Slate.php), search results, and 'no results' messaging all in one view. Then, using the Stagehand toolbar, anyone visiting the static markup of the Search page can flip through the various states:

```haml
%section(data-stage='search' data-scene='blank slate')
  %h1 Search for something!

%section(data-stage='search' data-scene='results')
  // cool search result listing

%section(data-stage='search' data-scene='no results')
  %h1 No results for this query
  = link_to "try searching for something else", "#"
```

That's just the tip of the iceberg. In the month since I released Stagehand, it's been used for toolbars, nav dropdowns, dynamic forms, and more. It's a new way to think about mocking interfaces – one that's resulted in saved time and increased markup quality for our projects.

A solution like Stagehand was a long time coming. We've tried a number of different solutions over the years in efforts to figure out where to draw the line between simulating & implementing Javascript interactions:

### In which we stub out AJAX calls.

Back in the day, slicing AJAX features just involved setting the code up to call a dummy URL, which would then be swapped out for a real call in the real app view. We'd find ourselves with broken static markup as the Javascript was implemented for the real app, but we treated that as a necessary tradeoff for how convenient the URL-swapping method was.

To make matters worse, as client-side interfaces became more complex and frameworks (Backbone, Ember, etc.) became more common, we'd find unexpected layout bugs that were either deep within the implemented app or just plain hard to reproduce.

### In which we double down on Javascript files.

We've also tried maintaining a separate Javascript file just for the static markup, full of quick & easy jQuery toggles and animations. But as projects grew in complexity, the dummy JS would grow as well, resulting a few hundred lines of essentially throwaway code – plus, we ran the risk of making Javascript implementation decisions prior to the implementation of the framework that'd be tying everything together. Unhealthy!

### Stagehand: decoupled and happy.

Enter Stagehand. Now there can be a bare, bare minimum of JavaScript to go with our static markup, and interface states are simulated with Stagehand data attributes. Broken JavaScript is a thing of the past, and no throwaway JavaScript is written.

Honestly, it was hard for me to let go after years of the Hashrocket design & frontend team being responsible for core of the Javascript interactions along with the HAML/SASS. But thanks to Stagehand, I find myself focusing on designing & slicing every possible interface state, because it's so easy to write them all at once. It's helped me catch layout issues sooner and reduces the amount of assumptions the developers need to make when implementing views.

And I'm actively avoiding writing JavaScript, leaving 100% of the implementation to our capable team of developers, who've quickly and capably embraced JS & Coffeescript alongside Ruby, Elixir, Go and all the other stuff we're writing around here. As the nature of applications has changed, we must adapt – and it's my hope that Stagehand is the next step that we've been looking for.

That's a bit of how Stagehand has changed our process for the better – maybe it can do the same for you. Check out [the Stagehand homepage](http://camerond.github.io/stagehand/) for documentation & more examples – and then go forth and slice!
