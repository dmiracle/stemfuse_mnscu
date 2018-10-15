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

## Fitting the Model: The Method of Least Squares

The goal is to use our sample data to estimate the regression parameters, yielding the estimates β ̂_0 and β ̂_1; this is referred to as fitting the linear model.  This is equivalent to finding the straight line that gives the best fit of the points in the scatterplot of the response versus the predictor variable.  In this case, the data comprise n pairs of observations for each individual.  The fitted model of interest concerns the mean response value, denoted y ̂, for a specific value of the predictor, x, and is written as follows:  y ̂  = β ̂_0 + β ̂_1 x.
We estimate the parameters using the least squares method, which gives the line that minimizes the sum of squares of the vertical differences from each point to the line.  The vertical distances represent the errors in the response variable.  These errors can be obtained as ε_i = y_i- β ̂_0- β ̂_1 x_i, i=1,2,⋯,n.  The sum of squares of these distances (often referred to as residuals) can then be written as SSR = ∑_(i=1)^(i=n)▒ε_i^2 = ∑_(i=1)^(i=n)▒(y_i- β ̂_0- β ̂_1 x_i )^2 .
The values of β ̂_0 and β ̂_1 that minimize SSR are given by
β ̂_1 = (∑▒(y_i- y ̅ )  (x_i- x ̅ ))/(∑▒(x_i- x ̅ )^2 )
and
β ̂_0 = y ̅- β ̂_1 x ̅.
Note that we give the formula for β ̂_1 before the formula for β ̂_0 because β ̂_0 uses β ̂_1.  The estimates β ̂_0 and β ̂_1 are called the least squares estimates of β_0 and β_1 because they are the solution to the least squares method, the intercept and the slope of the line that has the smallest possible sum of squares of the vertical distances from each point to the line.  For this reason, the line is called the least squares regression line.  The least squares regression line is given by y ̂ = β ̂_0 + β ̂_1 x.  Note that a least squares line always exists because we can always find a line that gives the minimum sum of squares of the vertical distances.  In some cases a least squares line may not be unique.  These cases are not common in practice.
For each observation in our data we can compute
y ̂_i = β ̂_0 + β ̂_1 x_i, i=1,2,⋯,n.
These are called the fitted values.  Thus, the ith fitted value, y ̂_i, is the point on the least squares regression line corresponding to x_i.  The vertical distance corresponding to the ith observation is
e_i = y_i- y ̂_i, i=1,2,⋯, n.
These vertical distances are called the ordinary least squares residuals.  One property of the residuals above is that their sum is zero.  This means that the sum of the distances above the line is equal to the sum of the distances below the line.
Fitting Regression Models with lm( )
In R, the basic function for fitting a linear model is lm( ).  (https://www.r-bloggers.com/r-tutorial-series-simple-linear-regression/)  The format is
myfit <- lm(formula, data)
where formula describes the model to be fit and data is the data frame containing the data to be used in fitting the model.  The resulting object (myfit, in this case) is a list that contains extensive information about the fitted model.  The formula is typically written as
Y~X
where the ~ separates the response variable on the left from the predictor on the right. 
Fitting Simple Regression Models with lm( )
The dataset women in the base installation of R provides the height (in inch) and weight (in lb.) for a set of 15 women ages 30 to 39 (figure 1). (https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/women.html)
 
Figure 1.  Dataset of 15 women (ages 30 to 39) in the base installation of R.
Suppose you want to predict weight from height.  Having an equation for predicting weight from height can help you to identify overweight or underweight individuals.  The analysis is provided in the listing in figure 2.  The summary( ) function applied to the object returned by lm( ) displays detailed results for the fitted model.  (http://www.learnbymarketing.com/tutorials/explaining-the-lm-summary-in-r/ )
 
Figure 2.  Simple linear regression model for predicting weight from height.
From the output, we see that the prediction equation is (Weight) ̂ = -87.52+3.45 ×Height.  Because a height of 0 is impossible, we wouldn’t try to give a physical interpretation to the intercept.  It merely becomes an adjustment constant. The estimate of the slope (3.45) indicates that there’s an expected increase of 3.45 pounds of weight for every 1 inch increase in height.
We’ve printed out the actual, predicted, and residual values (figure 3).  The fitted( ) and residuals( ) functions applied to the object returned by lm( ) list the predicted and residual values, respectively, in a fitted model.

 
Figure 3.  Actual, predicted, and residual values of weight.
The largest residuals occur for low and high heights.  This can also be seen in the scatterplot (figure 4).  plot( ) is a generic function that plots objects in R (its output varies according to the type of object being plotted).  In figure 4, plot(women$height,women$weight) places height on the horizontal axis and weight on the vertical axis and plots the 15 (height, weight) data points.  Axis labels are added with xlab and ylab.  (https://www.datamentor.io/r-programming/plot-function )
The abline( ) function is used to add the fitted least squares regression line.  (http://www.r-tutor.com/elementary-statistics/quantitative-data/scatter-plot)

Figure 4.  Scatterplot with least squares line for predicting weight from height.
The plot suggests that you might be able to improve on the prediction by using a line with one bend.
Activity 1:  cars is a standard built-in dataset in R.  You can access this dataset simply by typing in cars in your R console.  You will find that it consists of 50 observations (rows) and 2 variables (columns) – dist and speed.  The first six observations are shown below.
 
The aim of this activity is to build a simple regression model that we can use to predict distance (dist) by establishing a linear relationship with speed.
	Construct a scatter plot to visualize the linear relationship between the predictor and response.
	Find the least squares linear regression equation for predicting the distance to stop from speed.  Note that the data were recorded in the 1920’s.
	Apply the summary( ) function to the object returned by lm( ) in (b).
	Find the actual, predicted, and residual values of distance.
	Plot the regression line on the scatter plot created in (a).
Illustrating Residuals
When the parameters are estimated, the fitted line is referred to as an implementation of least squares regression because it’s the line that minimizes the average squared difference between the observed data and itself.  This concept is easier to understand by drawing the distances between the observations and the fitted line, formally called residuals.
To create a plot where residuals are displayed by connecting observations to corresponding points on the fitted line, you can use the code shown in figure 5.

 
Figure 5.  R code for displaying residuals.
The function segments( ) draws line segments; its arguments are the endpoint coordinates in the order (x_1, y_1,x_2,y_2).  (https://www.math.ucla.edu/~anderson/rw1001/library/base/html/segments.html)  The plot is shown in figure 6.

 
Figure 6.  Plot of line segments representing residuals.
Now, imagine a collection of alternative regression lines drawn through the data (achieved by altering the value of the intercept and slope).  Then, for each of the alternative regression lines, imagine you calculate the residuals (vertical differences) between the response value of every observation and the fitted value of that line.  The simple linear regression line estimated in figure 2 is the line that lies “closest to all observations.”  By this, it is meant that the fitted regression model is represented by the estimated line that yields the smallest overall measure of the squared residual distances.  For this reason, another name for a least squares estimated regression equation like this is the line of best fit.
Activity 2:  For the model fit in Activity 1, create a plot connecting the actual observations to the corresponding points on the fitted line.
Model Assumptions

The validity of the conclusions you can draw based on the model y= β_0+ β_1 x+ ε is critically dependent on the assumptions made about ε, which are defined as follows:
	The value of ε is assumed to be normally distributed such that ε ~ N(0,σ).
	That ε is centered (that is, has a mean of) zero.
	The variance of ε, σ^2, is constant.
	The errors associated with any two different observations are independent.  That is, the error associated with one value of y has no effect on the errors associated with other y values.
The ε term represents random error.  In other words, you assume that any raw value of the response is owed to a linear change in a given value of x, plus or minus some random, residual variation or normally distributed noise.
The implications of the first three assumptions can be seen in figure 7, which shows distributions of errors for three particular values of x, namely x_1,x_2, and x_3.  Note that the relative frequency distributions of the errors are normal, with a mean of 0, and a constant variance σ^2 (all the distributions shown have the same amount of spread or variability). (https://saylordotorg.github.io/text_introductory-statistics/s14-correlation-and-regression.html )
 
Figure 7.  The probability distribution of ε.
Let’s return to the basic extractor function summary( ) as shown in figure 2 and repeated in figure 8 for our example of predicting weight from height for a sample of 15 adult females.  
 
Figure 8.  Summary of the linear regression fit for predicting weight from height.
The following portion of the output gives a superficial view of the distribution of the residuals that may be used as a quick check of the distributional assumptions.
 
The mean of the residuals is zero by definition, so the median should not be far from zero, and the minimum and maximum should be roughly equal in absolute value.  In this example, the absolute value of the maximum is considerably greater than that of the minimum.  However, in view of the small number of observations (15), this is not really something to worry about.
Following is the residual variation, an expression of the variation of the observations around the regression line, estimating the model parameter σ.
 
Since the residual standard error measures the spread of the distribution of y-values about the least squares line and these errors are assumed to be normally distributed, we should not be surprised to find that most (about 95%) of the observations lie within 2(1.525) = 3.05 of the least squares line.  For this example, 14 of the 15 data points fall within 3.05 of the least squares line.
The value of the residual standard error will be utilized in tests of model adequacy, in evaluating model parameters, and in providing measures of reliability for future predictions.
