# MNSCU Web Templates

## pandoc
```bash
pandoc -f docx -t html -s --mathjax logistic-regression.docx  --extract-media=./images -o logistic-recression-mathjax.html
```
## Color

MNSCU Blue: #003C66

## Protocol

1. copy Word content into markdown file
1. format (italics, bold, etc.) 
1. LaTex mathy bits
1. Markdown: Clip Markdown+Math to HTML (F1 or Ctrl+K .)
1. Paste content into _md.html
1. Extract body from html output
1. past into `<div id="mainContent">` after warning div
    - keep warning div on either side of the pasted in content
1. change body to div with same class
    - `<body class="markdown-body">` &rarr; `<div class="markdown-body">`
1. ~~paste into D2L~~ copy or download [template file](includes/metroTemplate.html)
1. paste in script and stylesheets:
    ```html
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/2.4.1/github-markdown.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.11.0/styles/default.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.10.0-rc.1/dist/katex.min.css" integrity="sha384-D+9gmBxUQogRLqvARvNLmA9hS2x//eK1FhVb9PiU86gmcrBrJAQT8okdJ4LMp2uv"
    crossorigin="anonymous">
    <link rel="stylesheet" href="https://gitcdn.xyz/repo/goessner/mdmath/master/css/texmath.css">
    <link rel="stylesheet" href="https://gitcdn.xyz/repo/goessner/mdmath/master/css/vscode-texmath.css">
    ```
1. find all `<h2>` tags and create `<a name="id-name">` so they look like this:
    ```html
    <h2 data-line="35" class="code-line code-line code-line code-line" id="resources"><a name="resources"></a>Resources</h2>
    ```
1. Create the sidebar links by copying out all the anchors to get something like:
    ```html
    <li><a href="#learning-objectives">Learning Objectives</a></li>
    <li><a href="#requirements">Requirements</a></li>
    <li><a href="#supplementary-materials">Supplementary Materials</a>Supplementary Materials</li>
    <li><a href="#resources">Resources</a>Resources</li>
    ```
    - use emmet to quickly wrap things in li elements. 
    > F1 >  
    > Emmet: Wrap individual lines with abbreviation
1. 


## Pandoc protocol 

```bash
pandoc -f docx -t markdown logistic-regression.docx -o tmp.md
pandoc -f docx -t gfm --extract-media=./media 
pandoc -f docx -t html --extract-media=./media 
```



## Installing Pandoc

[https://pandoc.org/installing.html](Pandoc install page)
[https://github.com/jgm/pandoc/releases/tag/2.4](Pandoc release page)
[https://github.com/jgm/pandoc/releases/download/2.4/pandoc-2.4-windows-x86_64.msi](actual install file used 11/6/2018)

## Hugo

```bash
hugo new site hugo_test
```

