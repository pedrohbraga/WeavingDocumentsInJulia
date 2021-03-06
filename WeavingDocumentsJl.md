---
title: Weaving Markdown Documents with Julia
author: Pedro Henrique Pereira Braga
mail: ph.pereirabraga@gmail.com
date: January 26th, 2019
---

> Welcome!
> I built this tutorial because I have been interested in using Julia to perform
> some of the analyses related to my doctorate thesis. When learning new `R`
> routines and functions, I have always found it easier to write `RMarkdown`
> documents and tutorials as a way of learning. Do not hesitate to give your
> feedback or your contributions to this document. Enjoy!
>> Best regards,
>>> [Pedro H. P. Braga](https://github.com/pedrohbraga)


# Introduction

This document gives a brief illustration on how to create a scientific report
document using [Julia](http://julialang.org/) and its
[Weave.jl](https://github.com/mpastell/Weave.jl) package. The `Weave.jl` package
was built by [Matti Pastell](https://github.com/mpastell/), and it allows the
"writing of text, mathematics and code in a single document which can be run
capturing results into a rich report". Visit `Weave.jl`'s
[documentation](http://weavejl.mpastell.com/) and
[publication](http://dx.doi.org/10.21105/joss.00204) for further information.


For this, you will need to install the `Weave.jl` package:

~~~~{.julia}

using Pkg; Pkg.add.("Weave")
~~~~~~~~~~~~~




# Getting started
## The YAML header
Julia's markdown documents hold the extension `.jmd` and are built using markup
language. To learn more on Markdown, visit this
[website](https://www.markdownguide.org/) or access this
[cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

As I start point, I suggest that you create a `.jmd` document, so your Julia IDE
can properly highlight your markdown syntax (currently available within Atom
through the [language-weave](https://atom.io/packages/language-weave)
extension). Once created, you will need to start your document with an `YMAL`
header, as in the example below:

~~~~{.julia}

---
title: Creating Scientific Reports with Julia
author: Pedro Henrique Pereira Braga
date: January 26th, 2019
---
~~~~~~~~~~~~~




As seen in the beginning of this document, the above YAML allows `Julia` to add
a title, an author name and a date to your document.

You can then begin writing your text below the `---`. Following the Markdown
language, you can indicate titles and subtitles with `#` and `##`, `###` (and
other variants), respectively.

~~~~{.julia}

# Section Header One

Hi! My name is **Pedro**!

## Section Header Two

As in Markdown, you can use many in-line elements, such as the *single-asterisks*
to make things in *italic*, or the **double-asterisks** to make your text in
**bold**. You can also create [hyperlinks](http://www.julialang.org).

### Section Header Three
#### Section Header Four
##### Section Header Five
###### Section Header Six
~~~~~~~~~~~~~




## In-line code and code chunks

You can write in-line code using one backtick *`*, or define code chunks using
three consecutive backticks *```*.

You can create a code block without an specified-language, but if you write
`julia` right after the code block delimiter ( *```*`julia` ) or `j` after your in-line backtick ( *`*`j` ), Weave will know that you
want to run julia-language commands:

```
A code block without a "language":

function func(x)
    # ...
end
```

~~~~{.julia}

# This code block is in Julia code

function func(x)
    # ...
end
~~~~~~~~~~~~~




If nothing else is written after the backticks, code and output are captured
following the default parameter of code chunks:

~~~~{.julia}
# Loading packages
using Phylo
using DataFrames

# Creating species
species = ["Dog", "Cat", "Human", "Monkey", "Alien"];

# Creating communities
communities = DataFrame(Dog = [1, 1, 1],
                        Cat = [0, 1, 1],
                        Human = [1, 0, 0],
                        Monkey = [1, 0, 1],
                        Alien = [0, 0, 1])

nt = rand(Nonultrametric(species))
nt #the output comes right below
~~~~~~~~~~~~~


~~~~
BinaryTree{DataFrame,Dict{String,Any}} with 5 tips, 9 nodes and 8 branches.
Leaf names are Dog, Cat, Human, Monkey and Alien
~~~~





By defining chunk parameters (separated by `;`), you can, for example: hide
the code (`echo = FALSE`); provide figure captions (`fig_cap="A random walk."`);
define a label (`label="random"`); and, delimit the figure width and height
(`fig_width=7; fig_height=4`). See below an example of a figure generated using
the same above-mentioned chunk options:

~~~~
Plot{Plots.PlotlyBackend() n=1}
~~~~




Access `Weave.jl`'s [chunk
options documentation](http://weavejl.mpastell.com/stable/chunk_options/) to see
the currently supported chunk defining arguments.

## Quotes

You can also quote from external sources, such as books, websites or articles
using `>` following by a single-space before your text. See the following
example and its consecutive effect:

```
Here's a quote:
> Julia is a high-level, high-performance dynamic programming language for
> technical computing, with syntax that is familiar to users of other
> technical computing environments.

>> You can also set another level or `inline` parameters by adding `>>` and
>> a space before your "sub-quote".
```

Here's a quote:
> Julia is a high-level, high-performance dynamic programming language for
> technical computing, with syntax that is familiar to users of other
> technical computing environments.
>> You can also set another level or `inline` parameters by adding `>>` and a
>> space before your "sub-quote".

## Ordered and Unordered Lists

Unordered lists can be written with either `*`, `+`, or `-`. Note that an space
following the list-delimiter is always needed:

```
An unordered list:
  * *Italic item*
  * **Bold item**
    ```
    f(x) = x # Your favorite functions
    ```
  * And a sublist:
      + Sub-item one
      + Sub-item two
```

An unordered list:
  * *Italic item*
  * **Bold item**
    ```
    f(x) = x # Your favorite functions
    ```
  * And a sublist:
      + Sub-item one
      + Sub-item two

Ordered lists are written by replacing the "bullet" character, either `*`, `+`,
or `-`, with a positive integer followed by either `.` or `)`.

```
One ordered list starting from 1. to 3.:
 1. Item one
 2. Item two
 3. Item three

You can also create another list starting from numbers 5. to 7.:
 5) Item five
 6) Item six
 7) Item seven
```

One ordered list starting from 1. to 3.:
 1. Item one
 2. Item two
 3. Item three

You can also create another list starting from numbers 5. to 7.:
 5) Item five
 6) Item six
 7) Item seven

## Footnotes

You can also use footnotes to add numbered [^1] or named footnotes [^named] to
paragraphs. For this, you can add `[^number]` or `[^text]` after a desired text,
and then append it to your desired place in the text by writing the following
syntax:

```
[^1]: Numbered footnote text.

[^named]:
    Named footnote text containing several toplevel elements.
      * item one
      * item two
      * item three

    ```julia
    function func(x)
        # ...
    end
    ```
```

## Weaving the document

When you are finally done with your document, you can save it to your preferred
directory and then *Weave* it. You can do this with the help of the `weave`
function. Type and run `?weave` to learn about the function's arguments or
access the [documentation](http://weavejl.mpastell.com/stable/usage/). Run
`list_out_formats()` to see supported output formats. Below, you can see
examples showing how to weave this document to Markdown, HTML and PDF.

~~~~{.julia}

# Output it to Markdown
weave(joinpath("", "WeavingDocumentsJl.jmd"),
      informat="markdown",
      out_path = :pwd, # This outputs the document to your current working directory
      doctype = "pandoc")

# to HTML
weave(joinpath("", "WeavingDocumentsJl.jmd"),
      informat="markdown",
      out_path = :pwd,
      doctype = "md2html")

# to PDF
weave(joinpath("", "WeavingDocumentsJl.jmd"),
      informat="markdown",
      out_path = joinpath("", "pdf"),
      doctype = "pandoc2pdf")
~~~~~~~~~~~~~


~~~~{.julia}

# Remember that you can set your working directory with cd. Here is an example:
cd("C:\\Users\\phper\\Documents\\GitHub\\pedrohbraga\\WeavingDocumentsInJulia")
~~~~~~~~~~~~~




# Learn more

Read the `Weave.jl` [documentation](http://mpastell.github.io/Weave.jl/stable/)

Read the `julia` [Markdown
documentation](https://docs.julialang.org/en/v1/stdlib/Markdown/)

#### References

1. Pastell, Matti. 2017. Weave.jl: Scientific Reports Using Julia. The Journal
of Open Source Software. http://dx.doi.org/10.21105/joss.00204
2. Bezanson, Jeff, Alan Edelman, Stefan Karpinski, and Viral B. Shah. 2017.
“Julia: A Fresh Approach to Numerical Computing.” SIAM Review 59 (1): 65–98.
doi:10.1137/141000671.
3. Xie, Yihui. 2015. Dynamic Documents with R and Knitr. 2nd ed. Boca Raton,
Florida: Chapman; Hall/CRC. http://yihui.name/knitr/.
