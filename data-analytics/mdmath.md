# Simple Linear Regression Module

## Learning Objectives

-	Describe applications of regression
-	Explain the concept of a probabilistic model
-	Hypothesize the form of a straight-line model with a single predictor variable
-	Use the method of least squares to estimate the intercept and slope in the simple regression model
-	Specify the model assumptions for a simple regression model
-	Assess the utility of the simple regression model by making inferences about the slope
-	Use the least squares model to estimate the mean value of the response variable for a specific value of the predictor variable
-	Use the least squares model to predict a particular value of the response variable for a given value of the predictor variable
-	Calculate the coefficients of correlation and determination and understand their relationship to simple linear regression
-	Show how residuals can be used to detect departures from the simple linear regression model assumptions
-	Understand procedures for coping with departures from the model assumptions
-	Use the Durbin-Watson Test for detecting residual correlation


## Requirements

Most of the examples, activities, and assessment exercises in this module assume basic knowledge and experience with the R programming language.  Others require the use of MS Excel.  If you are not familiar with R, a good resource is the R module which is also available on D2L.  The code for the examples in this document were produced using Version 1.1.419 of RStudio.  To use the non-base packages, such as **car**, you must install them prior to referencing them with a command such as the **library( )** function.
Prior to undertaking this module, a basic understanding of elementary statistics is assumed.  In particular, one should be familiar with concepts such as probability and sampling distributions, confidence interval estimation, and hypothesis testing.  An excellent source for refreshing your memory on these topics is provided in the next section.


## Supplementary Materials

Besides the information provided in this document, a number of other materials are posted on D2L for your use in learning simple linear regression.  They include:
-	Code for reproducing all of the examples
-	Code for the 10 activities 
-	Code for the Final Assessment questions
-	A pdf file of the third edition of **OpenIntro Statistics** by David M. Diez, Christopher D. Barr, and Mine Cetinkaya-Rundel.  In particular, Chapter 7 (pages 331-371) is an “Introduction to Linear Regression” which provides additional examples and exercises on many of the topics that are covered in the module.  The first six chapters also can be used as a review of material typically covered in an introductory statistics course.
-	Two YouTube videos:
    - Using R for Simple Linear Regression
    - Using MS Excel for Simple Linear Regression

## Resources

Following is a list of online materials which are referenced in the content of this document.  Many of them provide additional explanations and examples beyond what is covered in the following sections.

https://www.deepdyve.com/lp/wiley/francis-galton-and-regression-to-the-mean-rkELkMmOVt

https://www.r-bloggers.com/r-tutorial-series-simple-linear-regression/

https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/women.html

http://www.learnbymarketing.com/tutorials/explaining-the-lm-summary-in-r/

https://www.datamentor.io/r-programming/plot-function

http://www.r-tutor.com/elementary-statistics/quantitative-data/scatter-plot

https://www.math.ucla.edu/~anderson/rw1001/library/base/html/segments.html

https://saylordotorg.github.io/text_introductory-statistics/s14-correlation-and-regression.html

https://stat.ethz.ch/R-manual/R-devel/library/stats/html/confint.html

https://www.r-bloggers.com/extracting-information-from-objects-using-names/

http://data.princeton.edu/R/linearmodels.html

http://www.endmemo.com/program/R/coef.php

https://www.rdocumentation.org/packages/base/versions/3.5.0/topics/numeric

http://www.r-tutor.com/elementary-statistics/simple-linear-regression/confidence-interval-linear-regression

http://www.r-tutor.com/elementary-statistics/simple-linear-regression/prediction-interval-linear-regression

https://thepracticalr.wordpress.com/tag/xlim/

http://www.endmemo.com/program/R/points.php

http://www.endmemo.com/program/R/seq.php

https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/lines.html

https://datascienceplus.com/mastering-r-plot-part-1-colors-legends-and-lines/

http://www.r-tutor.com/elementary-statistics/numerical-measures/correlation-coefficient

https://www.r-bloggers.com/correlation-and-linear-regression/

http://analyticspro.org/2016/03/07/r-tutorial-how-to-use-diagnostic-plots-for-regression-models/

https://www.statmethods.net/advgraphs/layout.html

https://www.investopedia.com/terms/d/durbin-watson-statistic.asp


## Introduction and Regression Applications

Regression models describe the effect that *explanatory* variables (also called the *independent* or *predictor* variables), might have on the value of a continuous outcome variable, called the *response* variable (also called a *dependent*, *criterion*, or *outcome* variable).  The explanatory variables may be continuous, discrete, or categorical.  As described shortly, regression was originally invented by Francis Galton to study the relationships between parents and children, which he described as regressing to the mean.  It has become one of the most widely used modelling techniques and has spawned other models.  

Regression analysis has numerous areas of applications.  A partial list would include economics, finance, business, law, meteorology, medicine, biology, chemistry, engineering, physics, education, sports, history, sociology, and psychology.  

While studying natural inheritance in 1886, scientist Francis Galton collected data on heights of parents and adult children.  He noticed the tendency for tall (or short) parents to have tall (or short) children, but not as tall (or short) on average as their parents.  Galton called this phenomenon the “Law of Universal Regression” for the average heights of adult children tended to “regress” to the mean of the population.  Galton modeled a son’s adult height (y) as a function of mid-parent height (x), and the term *regression model* was coined[[^]](https://www.deepdyve.com/lp/wiley/francis-galton-and-regression-to-the-mean-rkELkMmOVt). 

An exercise physiologist might use regression analysis to develop an equation for predicting the expected number of calories a person will burn while exercising on a treadmill.  The response variable is the number of calories burned (calculated from the amount of oxygen consumed), and the predictor variables might include duration of exercise (minutes), percentage of time spent at their target heart rate, average speed (mph), age (years), gender, and body mass index (BMI).

From a theoretical point of view, the analysis will help answer such questions as these:

- What’s the relationship between exercise duration and calories burned?  Is it linear or curvilinear?  For example, does exercise have less impact on the number of calories burned after a certain point?
- How does effort (the percentage of time at the target heart rate, the average walking speed) factor in?
- Are these relationships the same for young and old, male and female, heavy and slim?

From a practical point of view, the analysis will help answer such questions as the following:
- How many calories can a 30-year-old man with a BMI of 28.7 expect to burn if he walks for 45 minutes at an average speed of 4 miles per hour and stays within his target heart rate 80% of the time?
- What’s the minimum number of variables you need to collect in order to accurately predict the number of calories a person will burn when walking?
- How accurate will your prediction tend to be?

In general, regression analysis can be used to identify the explanatory variables that are related to a response variable, to describe the form of the relationships involved, and to provide an equation for predicting the response variable from the explanatory variables.

In its simplest form regression is used to determine the relationship between two variables.  That is, given one variable, it tells us what we can expect from the other variable.  This powerful tool is called simple linear regression and is the focus of this module.

## The Straight-Line Probabilistic Model

An important consideration in merchandising a product is the amount of money spent on advertising.  Suppose you want to model the monthly sales revenue y of a department store as a function of the monthly advertising expenditure x.  The first question to be answered is this:  Do you think an exact (deterministic) relationship exists between these two variables?  That is, can the exact value of sales revenue be predicted if the advertising expenditure is specified?  This is not possible for several reasons.  Sales depend on many variables other than advertising expenditure – for example, time of year, state of the general economy, inventory, and price structure.  However, even if many variables are included in the model, it is still unlikely that we can predict the monthly sales *exactly.*  There will almost certainly be some variation in sales due strictly to **random phenomena** that cannot be modeled or explained.

Consequently, we need to propose a probabilistic model for sales revenue that accounts for this random variation: $y = E(y) + ε$.  The random error component $ε$, represents all unexplained variations in sales caused by important but omitted variables or by unexplainable random phenomena.

In this module, we consider the simplest of probabilistic models – a **simple linear regression model.**  The relationship between a response variable $y$ and a predictor variable $x$ is postulated as a straight-line model:  $y= β_0 + β_1 x + ε$, where $β_0$ and $β_1$ are constants called the *model regression coefficients* or *parameters*, and $ε$ is a random disturbance or error.  It is assumed that in the range of the observations studied, the linear equation provides an acceptable approximation to the true relation between $y$ and $x$.  In other words, $y$ is approximately a linear function of $x$, and $ε$ measures the discrepancy in that approximation.  In particular $ε$ contains no systematic information for determining $y$ that is not already captured in $x$.

The value denoted by $β_0$ is called the *intercept*, and that of $β_1$ is called the *slope*.  Together, they are also referred to as the *regression coefficients* and are interpreted as follows:

- The intercept, $β_0$, is interpreted as the expected value of the response variable when the value of predictor variable $x$ is set to zero. 
- Generally, the slope, $β_1$, is the focus of interest.  This is interpreted as the change in the mean response ($y$) for each one-unit increase in the predictor ($x$).  When the slope is positive, the regression line increases from left to right (the mean response is higher when the predictor is higher); when the slope is negative, the line decreases from left to right (the mean response is lower when the predictor is higher).  When the slope is zero, this implies that the predictor has no effect on the value of the response.  The more extreme the value of $β_1$ (that is, away from zero), the steeper the increasing or decreasing line becomes.
