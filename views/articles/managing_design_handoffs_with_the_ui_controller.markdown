title: "Managing Design Handoffs with the UI Controller"
published: "2011-06-29 08:00:00 AM"
original_version: "http://blog.hashrocket.com/posts/managing-design-handoffs-with-the-ui-controller"
---

What's the best way for a design to make its way from PSD to working implementation? Ask a dozen development teams and you'll get a dozen different answers (and probably start a fight). Here's our answer out of the dozen (the other 11 are up to you – stay frosty out there). It's lo-fi, but helps keep everyone on the team on the same page.

Our technique boils down to this: every new page in the application gets built first in a directory of static views, which we always store under `/ui`.

### The Life Cycle of a View

Here's the simplest scenario: when a new design comp is approved, it's handed off to one of our front-end guys to slice. They then create a new static view in /ui. The developers can then take the completed markup to use as a reference for the implemented page.

Of course, not every page is that simple. For example, a link on the page might load a modal form that pops over the page. In that case, we'd use Shane's nifty [jQuery.modal](https://github.com/shaneriley/modal) plugin to load in a partial (also of static markup) to simulate that interaction – and since his modal plugin is reliant upon loading according to the `href` of the anchor that triggers it, no Javascript has to be changed in the fully-implemented version.

The beauty of the UI directory is that it allows us to have a living, organized representation of how the site should ideally behave. This helps us in terms of Agile-ity, as well: if a feature or requirement changes, we can make the change in the UI view, allowing the developers to know exactly what needs to change where. (And if the change breaks an existing view, we just push it to a branch.)

We also use separate, static layouts, allowing us to make changes to the page container & nav without impacting the implemented site.

### The UI Controller

Here's an example UI controller from [LensRentals.com](http://lensrentals.com), a recently released Hashrocket site:

    # in ui_controller.rb
    class UiController < ApplicationController
      layout :choose_layout
      private
        def choose_layout
          case action_name
          when /(home)|(cart)|(^email)|(^_)|(^[45])/
            false
          when /^(gift)|(account)|(checkout)/
            "no_nav"
          else
            "ui"
          end
        end
    end

    # in routes.rb
    match 'ui(/:action)', controller: 'ui'

    # in /views/ui/index.html.haml
    %ul
      - Dir.glob('app/views/ui/*.html.haml').sort.each do |file|
        - wireframe = File.basename(file,'.html.haml')
        -  unless wireframe == 'index' || wireframe.match(/^_/)
          %li= link_to wireframe.titleize, action: wireframe

And [here's what that looks like for LensRentals](http://d.pr/i/aC4w). Just a list of views (a lot of them, as it's a fully-launched product). It's pretty trivial to make make the index view smarter if views pile up; for example, another project of ours splits up views into sections based on their first word (e.g. `user_account_show` & `user_account_edit` would both be grouped under an "User" heading).

That's the ultra-basic overview of our UI directory. It's a simple, organic tool that has developed over time to do exactly what we need it to do, without requiring a lot of infrastructure or maintenance. Plus, it allows me as a front-end guy to poke around in a UI view and use Ruby loops to generate lots of example content quickly:

    %table
      %thead
        - ["First name", "MI", "Last name", "Phone", "Email", "Location"].each do |th|
          %th= th
      %tbody
        - 20.times do
          %tr
            - ["John", "Q", "Doe", "555-555-1234", "john@email.com", "Chicago, IL"].each do |td|
              %td= td

Whee!