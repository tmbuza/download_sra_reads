
# Install basic bookdown pkgs and automatically create a bib database
if (!require('base')) {
  install.packages('base', dependencies = TRUE)
}
library(base)

if (!require('bookdown')) {
  install.packages('bookdown', dependencies = TRUE)
}
library(bookdown)

if (!require('knitr')) {
  install.packages('knitr', dependencies = TRUE)
}
library(knitr)


if (!require('rmarkdown')) {
  install.packages('rmarkdown', dependencies = TRUE)
}
library(rmarkdown)


if (!require('tidyverse')) {
  install.packages('tidyverse', dependencies = TRUE)
}
library(tidyverse)


knitr::write_bib(c(.packages(), 'base','bookdown', 'knitr','rmarkdown'), 'library/packages.bib')

knitr::opts_chunk$set(
  echo  =FALSE,
  message  =FALSE,
  warning  =FALSE,
  cache  =FALSE,
  comment  =NA,
  collapse =TRUE,
  fig.path='./figures/',
  fig.show='asis',
  dev  ='png',
  fig.align='center',
  out.width  ="70%",
  fig.width  =7,
  fig.asp  =0.7,
  fig.show  ="asis"
)