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


