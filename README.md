# MNSCU Web Templates

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
1. paste into D2L


## Pandoc protocol 

```bash
pandoc -f docx -t markdown logistic-regression.docx -o tmp.md
```

## Installing Pandoc

[https://pandoc.org/installing.html](Pandoc install page)
[https://github.com/jgm/pandoc/releases/tag/2.4](Pandoc release page)
[https://github.com/jgm/pandoc/releases/download/2.4/pandoc-2.4-windows-x86_64.msi](actual install file used 11/6/2018)

## Hugo

```bash
hugo new site hugo_test
