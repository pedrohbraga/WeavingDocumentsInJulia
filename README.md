# Weaving Markdown documents in Julia

# Prelude

I built this tutorial because I have been interested in using Julia to perform some of the analyses related to my PhD thesis. When exploring new `R` routines and functions, I have always found it easier to write `RMarkdown` documents and tutorials as a way of learning. I am now doing the same with `Julia`. 

I hope you can enjoy it!

Best regards,
[Pedro Henrique P. Braga](https://github.com/pedrohbraga)

# Content

This document gives a brief illustration on how to create a scientific report document using [Julia](http://julialang.org/) and its
[Weave.jl](https://github.com/mpastell/Weave.jl) package. The `Weave.jl` package was built by [Matti Pastell](https://github.com/mpastell/), and it allows the "writing of text, mathematics and code in a single document which can be run capturing results into a rich report". 

Visit `Weave.jl`'s [documentation](http://weavejl.mpastell.com/) and [publication](http://dx.doi.org/10.21105/joss.00204) for further information.

Be sure to install `Weave.jl` package: `{j; eval=false} using Pkg; Pkg.add.("Weave")`.

# Feedback

Do not hesitate to give your feedback or your contributions to this document!

