title: "The UI Controller, part 2: Faking It"
published: "2012-07-26 08:00:00 AM"
original_version: "http://blog.hashrocket.com/posts/the-ui-controller-part-2-faking-it"
---

Since writing about [the UI controller process](http://blog.hashrocket.com/posts/managing-design-handoffs-with-the-ui-controller) that we use for clean design handoffs, I've added another piece to the puzzle: a cleaner way to generate useful filler content through the [Faker](http://faker.rubyforge.org/) gem.

It's an occasional, yet frustrating problem: I design a page with some temporary names and [Lorem Ipsum](http://lipsum.com/) content, only to see something wrap or look weird after implementation because the real content is unexpectedly long or annoyingly short.

Plus, even when the content doesn't cause a problem, the actual workflow of pasting in filler content is suboptimal – I mean, I'm pasting Lorem Ipsum all over the page (which fills up the code with text that literally doesn't mean anything) and having to either come up with a bunch of names ("John Doe, Jim Namerson, Roger Thisisalongnametotestspacing") or just get lazy and repeat the same name over and over.

Look, frontend slicing is time-consuming enough as it is; typing filler content shouldn't make it more so. Enter [Faker](http://faker.rubyforge.org/).

### Let Faker do the faking so you can focus on the work

Faker's a little Ruby gem that's actually intended primarily to generate data for testing databases or whatever, but it's perfect for filling up static UI views. I'm not going to dig into the docs here, because they're [a piece of cake](http://rubydoc.info/github/stympy/faker/master/frames) for our usage here. Just call `Faker::` + something; since this is just a static view, we don't care how inefficient that might be.

Here's an example straight from a current project of mine:

```haml
%table
  %thead
    - ["School Name", "Students", "District", "City", "State"].each do |th|
      %th= th
  %tbody
    - 5.times do
      %tr
        %td= link_to Faker::Lorem.words(3).join(' '), "#"
        %td 3943
        %td 4
        %td= Faker::Address.city
        %td= Faker::Address.state_abbr
```

Hey, look at that! Thanks to a simple `each` loop and some calls to Faker, we now have a table with some reasonably realistic content.

### Writing your filler copy with Faker

But you might notice that I had to do a `.join` call after requesting `Faker::lorem.words()`. That's because Faker returns arrays when asked for multiple words & paragraphs, so I then had to join them together. That's incredibly suboptimal for generating body content – and that's the main thing we want Faker to help with, because we're tired of pasting in Lorem Ipsum, right?

So let's break this down: if we just call `Faker::Lorem.paragraphs(3)`, we're going to get back an array of 3 strings. We'll need to wrap those in a `<p>` tag and concatenate them together, and call `.html_safe()` (so the paragraph tags don't get filtered to `&lt;p&gt;`). So if we want to make 3 paragraphs, our call will look something like this:

```ruby
Faker::Lorem.paragraphs(3).map{|text| content_tag(:p, text)}.join.html_safe
```

Yuck, I don't know about you, but I don't want to ever type that more than once. Let's put it in a helper.

```ruby
module UiHelper

  def lorem(paragraphs)
    Faker::Lorem.paragraphs(paragraphs).map{|text| content_tag(:p, text)}.join.html_safe
  end

end
```
Hooray! Now you can write one clean line in your HAML and Faker will do the work for you.

```haml
= lorem(3)
```
Beautiful. No more trips to the [Lorem Ipsum Generator](http://lipsum.com/) for me.