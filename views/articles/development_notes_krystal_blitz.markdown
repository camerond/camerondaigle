title: "Development Notes: Krystal Blitz"
published: "2009-09-01 05:37 PM"
---

This isn't strictly my design -- I was contracted in a development capacity -- but it was certainly an interesting change of pace to implement someone else's mockup and make it Web-friendly.

The job was to take the site mockup for [the new Krystal Blitz energy drink](http://www.krystalblitz.com) and implement it. Although a microsite such as this could typically be handled in Flash by most agencies, I built it in a combination of PHP, Javascript, and Flash to maximize accessibility -- this is a quick article about how I went about tackling it.

![](http://s3.amazonaws.com/camerondaigle/articles/blitz_1.jpg)

First of all, there's the site. The illustration style was spare enough that I was able to toss in quite a few little mouseover animations here and there without bloating the site's size. While the video window and logo animation are clearly Flash, the remainder of the website is standards-friendly HTML, with mouseovers built using CSS, Javascript, and a load-friendly [spritesheet.](http://krystalblitz.com/_images/blitz_sprites.png)

By the way, the site is also fully written out in standards-friendly text, for Google's benefit -- check out the [text-only cached version here.](http://74.125.47.132/search?q=cache:PoN7jGm39iUJ:krystalblitz.com/+krystalblitz.com&hl=en&client=firefox-a&gl=us&strip=1) This was accomplished via a classic CSS technique: divs with  background images and text indented a few thousand pixels to the left. Granted, I could have also generated the text with [sIFR](http://www.mikeindustries.com/blog/sifr/) or a similar technique, but in a case like this, it isn't near as important that the text is selectable as it is that Google is able to read it.

### Forms, forms, custom forms

A core function of the site is the elaborate send-to-a-friend form. The user can write a custom message, and the form generates a custom URL that it then emails to the recipient. When the lucky friend clicks the URL to visit, they'll see their friend's message.

This was a pretty interesting thing to implement, thanks to the client's requirement that the form be in their particular font. So, there was no way around this one -- the form necessitated the use of Flash:

![](http://s3.amazonaws.com/camerondaigle/articles/blitz_2.jpg)

The recipient then sees the message when they visit:

![](http://s3.amazonaws.com/camerondaigle/articles/blitz_3.jpg)

There were a number of ways to implement the display of the message. I needed a way to display it in the custom Blitz typeface -- and I needed to store the messages somewhere, of course.

My first instinct was to store the messages in a database. So the PHP script would, upon reception of the form data, do the following:

- Validate the data and respond to Flash if something is wrong
- Generate a unique ID (for the URL the recipient will click on)
- Store the message
- Send off the email to the recipient & confirmation email to the sender

... and then, when the recipient visits, a separate script would query the database & display the message using sIFR. However, on computers with no Flash (or Flash blocked), the message would display in regular text ... and MySQL seemed like overkill for a single little message.

### Easy Does It

The solution? Pleasantly enough, Actionscript 3 includes a function called `BitmapData.draw` that conveniently snaps a screenshot of a movie (a big step forward from the pixel-by-pixel processing I was familiar with in Actionscript 2). Then the Flash movie just encodes the image data in Base64 and sends it down to PHP, which then generates a unique filename and writes the image data. (Although I don't have the original articles I referenced on hand, the process I settled on is very similar to [this code snippet.](http://codesnippets.joyent.com/posts/show/1905)) 

The PHP script then saves the image with a filename that contains the same unique string of characters that is used in the recipient's URL. So, when the user clicks on their unique link, the query string pulls that particular message image from the directory and displays it -- no queries necessary.

The result? A unique tell-a-friend system that delivers a user's unique message without requiring the use of Flash or MySQL. The implementation is cleaner, lighter, and more accessible to Krystal lovers everywhere.