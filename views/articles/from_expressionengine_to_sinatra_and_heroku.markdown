title: "From ExpressionEngine to Sinatra and Heroku"
published: "2011-03-01 11:44 PM"
---

Almost a year ago, I moved from rainy Nashville to sunny Florida and joined the good people at [Hashrocket](http://hashrocket.com) -- from a team with 2 designers (me and another fellow), 1 frontend developer (me) and .5 backend developers (.2 of that was me) to a mature, agile, bleeding-edge web consultancy a couple dozen strong.

### Killing a fly with a big fat ugly hammer

This is the story of how I escaped the bonds of ExpressionEngine to build a lightweight website & blog using [Sinatra](http://www.sinatrarb.com/), [Heroku](http://heroku.com), and [Amazon S3](http://aws.amazon.com/s3/).

My old website was built in ExpressionEngine and hosted on [Eleven2](http://eleven2.com) (a good, cheap service). To write a post, I would log in and fill out a form, blog-style. I had a completely separate installation on my local Apache -- with a totally different database -- to test new templates. To upload new templates, I'd boot up Transmit and FTP those things up (default behavior in ExpressionEngine is even worse: pasting or writing new code into a textarea in the browser).

If you're a designer, you're probably familiar with all of the above. It's how things go in PHP-land.

Hang around Rails developers long enough, however, and merely looking at PHP code -- or logging into ExpressionEngine -- or even booting up Transmit, really -- starts to feel tedious and annoying. Hell, I haven't typed CSS or HTML (we use [HAML/SASS](http://haml-lang.com/)) since sometime last summer.

So, my old site festered, a bloated, monstrosity of unused features and squirrely code.

### Sinatra to the rescue

Enter the website before you -- a product of working for a team that believes in building apps from the ground up instead of taking a monolithic app (ExpressionEngine, Wordpress, etc) and trimming it down.

This site before you is written in [Sinatra](http://www.sinatrarb.com/) and hosted on [Heroku](http://heroku.com/), with images hosted on [Amazon S3](http://aws.amazon.com/s3/). It has no databases and costs about $0 to maintain, unless I somehow become SUPER FAMOUS overnight and have to pay Heroku proportionally to how awesome I am. It's hosted on [Github](https://github.com/camerond/camerondaigle), so if you're a developer, you can go there and pick on my Ruby code instead of reading this.

There's no admin login; I update it by writing new Markdown files and pushing them up with Git. It's not a solution for everyone, and prepackaged solutions still have their place. But for how I work, it's a huge relief.

The two articles that got me started were [this great overview from Hashrocket's own Paul Elliott on how to run a static site on Heroku](http://codingfrontier.com/running-a-static-site-for-free-on-heroku) and [this article on making a 'chameleon blog'](http://mustardamus.com/articles/create_a_micro_chameleon_blog_with_sinatra). The latter caught my eye because it detailed the implementation of a database-free blog, and I don't post with near enough frequency to really require a database.

### Here's what's up

There's nothing super-flashy about the implementation of this site, but I think parts are at least elegant enough to explain, so here we go.

#### Writing & Viewing Articles

The Physical & Digital pages are just static for now (they do contain repeating content, but sometimes editing a text file is _still_ faster than building out a whole data structure just to display one page.) The Articles page, however makes use of this loop, culled from the second link I mentioned earlier.

    get "/articles/:article/?" do
      file = "views/articles/#{params[:article]}.markdown"
      if File.exist?(file)
        @articles = load_structure('articles')
        load_into_haml('/articles/show', file)
      else
        404
      end
    end

The method looks for its matching Markdown file and parses it into a template. The `load_into_haml` bit is my own, moved into its own helper method for cleanliness' sake.

    def load_into_haml(template, file)
      article = File.read(file).split("---\n")
      @meta = YAML::load(article[0])
      @text = article[1]
      haml template.to_sym
    end

I have to credit [Nanoc](http://nanoc.stoneship.org/) with this cute idea: that `split` method allows me to add the article title and date as metadata in the Markdown file, separated by the main content by three hyphens. [Check it out here](https://github.com/camerond/camerondaigle/raw/master/views/articles/regarding_fixed_positioning_in_mobile_safari.markdown).

#### Indexing Articles

But then, if the title of each post is embedded in a separate file, how does the article listing display properly? Obviously opening and reading every Markdown file would be silly -- so instead I wrote a Rake task that indexes all of the articles into a YAML file. It's not as beautiful as it could be, but then, I haven't had any of the Ruby guys at work critique it yet:

    task :rebuild do
      a = []
      Dir["views/articles/*.markdown"].each do |f|
        article = File.read(f).split("---\n")
        meta = YAML::load(article[0])
        a.push({
          :title => meta['title'],
          :published => meta['published'],
          :slug => "/articles/" << File.basename(f, ".markdown"),
          :rss_summary => RDiscount.new(article[1].strip.split("\n")[0]).to_html
        })
        puts "indexing #{File.basename(f)}"
      end
      puts "#{a.count} articles indexed"
      File.open("views/articles/_structure.yaml", 'w') {
        |f| f.write a.sort_by{|a| a[:published]}.reverse.ya2yaml
      }
    end

Loop through the files, read the YAML metadata, push it to an array, and write the array to a single YAML file. The article slug is just read straight from the filename, and the RSS summary just pulls out the first paragraph. (The `ya2yaml` method is due to Ruby's built-in YAML builder freaking out about UTF-8 characters.)

The result is an autogenerated 'database' that, while it won't scale to hundreds of posts, will serve me nicely at my few-articles-a-year publishing rate.

#### Syncing to S3

Heroku doesn't prefer to host static content, so in the interest of keeping Heroku happy, all the images on the site are hosted at Amazon S3. You can check out the Rake task [here](https://github.com/camerond/camerondaigle/blob/master/Rakefile); this post is getting kind of long and it's not all that exciting (in short: it copies images from a local directory to S3 for me).

#### Making Smartypants, Markdown, Haml, and Sinatra play nice

I'm a designer, after all, so I'm a little obsessive about enabling [Smartypants](http://daringfireball.net/projects/smartypants/) whenever I use Markdown. I'm using [RDiscount](https://github.com/rtomayko/rdiscount), and it accepts a `:smart` option to enable SmartyPants, but the actual call to RDiscount is buried within HAML, which is buried within Sinatra's template handler, Tilt -- and while Sinatra accepts HAML settings, HAML doesn't provide a setting to enable it (as far as I can tell).

Confused? Yeah, I was. There's not a lot of good info on this issue for amateur Rubyists like myself. I thrashed on this problem for a while before I realized that all I needed was a helper method for passing text variables ...

    def markypants(article)
        RDiscount.new(article, :smart).to_html
    end

... and for `:markdown` blocks within HAML templates, a class override for Tilt:

    class Tilt::HamlTemplate
      module ::Haml::Filters::Markdown
        def render(text)
          RDiscount.new(text, :smart).to_html
        end
      end
    end

This is one of those problems that won't matter to you unless you come across it, in which case it will _really_ matter to you.

#### Also, a cute Javascript thing

Lastly, Markdown doesn't accept HTML classes of any kind, but I wanted to add special styled captions to images, so I have a Javascript method that takes the image `alt` (which Markdown _does_ accept) and append it to the paragraph. Here:

    $("#article_show img").each(function() {
    var $img = $(this);
    $img.parent('p').addClass('image').append($img.attr('alt'));
    });

Whee! My Markdown is now free of HTML.

### I think that's enough

So, there you go. I'm thrilled with the little arrangement I have here, and hopefully it'll encourage me to contribute more articles to the community -- the community sure helped me get this thing figured out, and I learned a lot about Ruby in the process.