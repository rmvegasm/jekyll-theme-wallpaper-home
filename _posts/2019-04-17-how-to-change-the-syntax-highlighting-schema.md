---
layout: post
title: How to change the syntax hightlighting schema
date: 2019-04-17 21:39 -0400
---


Like the theme but would like to use other syntax highlighting schema? Here
you'll find an account on the way syntax rules are included along instructions
for using your favorite schema.

## Syntax highlighting overview

This theme is intended for
[github-pages](https://guides.github.com/features/pages/) and for that reason
some choices have already been taken. Particularly, markdown will be processed
by [kramdown](http://kramdown.gettalong.org/) and syntax highlighting will be
done by [rouge](rouge.jneen.net). That said, the whole workflow goes like this:

1. You mark some text as a code block by *fencing* it between three backticks:
    ~~~
    ```bash
    #!/bin/bash

    NAME=$1
    echo 'Hello $NAME'
    ```
    ~~~

1. Kramdown will take this text, figure out it is a code block containing bash
   commands, and ask rouge how should each word be tagged. Rouge knows about
   an absurdly big number of programming languages, and will assign each word a
   semantic tag. The output will be something like this:

    ```html
    <div class="language-bash highlighter-rouge">
      <div class="highlight">
        <pre class="highlight">
          <code>
            <span class="c">#!/bin/bash</span>

            <span class="nv">NAME</span><span class="o">=</span><span class="nv">$1</span>
            <span class="nb">echo</span> <span class="s1">'Hello $NAME'</span>
          </code>
        </pre>
      </div>
    </div>
    ```

1. This doesn't tell how each tagged element should look, for this we need a
   stylesheet with rules for each of these classes. This page is using
   `assets/css/gruvbox-light.css`, and under those rules the above code renders
   like this:

    ```bash
    #!/bin/bash

    NAME=$1
    echo 'Hello $NAME'
    ```

That's all you need to grasp to start tweaking how your code gets highlighted.
This theme is minimal and i've only included two syntax stylesheets, one for the
dark background and the one in use in this page. Let's take a look at how to use
another stylesheet.

## Using a custom stylesheet

First you need to have a stylesheet. You could write your own, but there are
plenty of well thought and well tested schemas already there. Rouge itself ships
with a nice set of them, and here how to use them:

1. Assuming you have rouge installed, you can get a list of the available
   schemas with:
   
   ```
   $ rougify help style
   ```
   
1. Write a stylesheet from one of those and get it into a suitable place: 
   
   ```
   $ rougify style the-chosen-one > path/to/stylesheets/the-chosen-one.css
   ```

1. Inform jekyll through the `_config.yml` file to get the link to your
   stylesheet in the document's head:

   ```yaml
   syntax-theme: "path/to/stylesheets/the-chosen-one.css"
   ```

Now start the server and take a look at your code blocks. You might notice that
the syntax highlighting schema does not affect the inline code. Instead you are
back to the default monospace font + pink color. There is also something odd
about padding. Here comes the tricky part. This theme is designed to color
inline and block code alike. Therefore inline code has extra padding and will
only play well with the rest of the text if it is within a color box. If the
output from the kramdown-rouge process would have code within a `<code
class="highlight">`{:.language-html} tag everything would work out of the box.
But that's not the case. Instead, we get `<code
class="highlighter-rouge">`{:.language-html}, which is not covered by the
stylesheet we just generated. I haven't found a way to get the correct class in
the code tag[^note], so here is the workaround:

[^note]: If you know how to get the correct class (.highlight) please pont me in  the right direction.

1. Open the stylesheet in your favorite text editor, the first three rules will
   look something like this:

   ```css
   .highlight table td { padding: 5px; }
   .highlight table pre { margin: 0; }
   .highlight, .highlight .w {
     color: #fbf1c7;
     background-color: #282828;
   }
   ```
   We are interested in the third one, that specifies the color for the
   background and text.

1. Insert a new rule specifying the same colors for class `.highlighter-rouge`.
   Your stylesheet's head should now look like this:

   ```css
   .highlighter-rouge {
     color: #fbf1c7;
     background-color: #282828;
   }
   
   .highlight table td { padding: 5px; }
   .highlight table pre { margin: 0; }
   .highlight, .highlight .w {
     color: #fbf1c7;
     background-color: #282828;
   } 
   ```

That's all[^not]. Now inline code will use the same background and font color as the
blocks. If you like the theme and generate a new stylesheet please consider
making a contribution ;)

[^not]: This won't get true syntax highlighting to inline elements. Just foreground and bakground colors that match those of the block elements.
