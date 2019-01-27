# Author: Pedro Henrique Pereira Braga
# Date: 2019-01-26
# Subject: Code to output HTML, PDF and MD from a Markdown document

# Add dependencies
using Pkg; Pkg.add.(["Plots", "DSP"])
using Pkg; Pkg.add.("Weave")
using Pkg; Pkg.add.(["Gadfly"])
using Pkg; Pkg.add.(["LaTeXStrings"])

#Use Weave
using Weave

# Weave the Document
## Output it to Markdown
weave(joinpath("", "WeavingDocumentsJl.jmd"),
      informat="markdown",
      out_path = :pwd, # This outputs the document to your current working directory
      doctype = "pandoc")

## to HTML
weave(joinpath("", "WeavingDocumentsJl.jmd"),
      informat="markdown",
      out_path = :pwd,
      doctype = "md2html")

## to PDF
weave(joinpath("", "WeavingDocumentsJl.jmd"),
      informat="markdown",
      out_path = joinpath("", "pdf"),
      doctype = "pandoc2pdf")
