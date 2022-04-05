<!--
Add here global page variables to use throughout your
website.
The website_* must be defined for the RSS to work
-->
@def website_title = "TPM 2022"
@def website_descr = "Workshop on Tractable Probabilistic Modeling"
@def website_url   = "https://tractable-probabilistic-modeling.github.io/tpm2022/"

@def author = "Martin Trapp"

@def mintoclevel = 2

@def prepath = "tpm2022"

<!--
Add here files or directories that should be ignored by Franklin, otherwise
these files might be copied and, if markdown, processed by Franklin which
you might not want. Indicate directories by ending the name with a `/`.
-->
@def ignore = ["node_modules/", "franklin", "franklin.pub"]

<!--
Add here global latex commands to use throughout your pages.
-->
\newcommand{\R}{\mathbb R}
\newcommand{\scal}[1]{\langle #1 \rangle}
