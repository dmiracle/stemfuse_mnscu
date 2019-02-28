## Final Assessment

1.  Create the following matrices using R

\[A = \begin{matrix}
3 & 6 & 7 \\
12 & 5 & 9 \\
 - 1 & 6 & - 7 \\
\end{matrix}\]

\[B = \begin{matrix}
2 & 12 & 15 \\
7 & 11 & 13 \\
9 & 22 & 16 \\
\end{matrix}\]

1)  find the transpose of the matrix A

2)  find the multiplication of A\*B using A%\*%B in R

<!-- end list -->

2.  Create a data frame to show the following data

| Name  | Gender | Starting Date | Salary | Age |
| ----- | ------ | ------------- | ------ | --- |
| Jack  | Male   | 2010-11-1     | 56000  | 51  |
| Peter | Male   | 2012-1-12     | 49000  | 39  |
| Julie | Female | 2013-3-2      | 32000  | 41  |
| Mary  | Female | 2014-10-8     | 30000  | 28  |

3.  Use the data frame created from question 2, export the data to a CSV
    file and save it on your desktop.

4.  Below is the data that recorded systolic blood pressure at baseline
    and follow-up visit for 9 patients. Create a function *treatment*
    and use the if-else statement to do the following:

<!-- end list -->

  - If the follow-up blood pressure is higher than the baseline, then
    make the recommendation of “more treatment”

  - If the follow-up blood pressure is lower than the baseline, then
    make the recommendation of “recovered”

  - If the follow-up blood pressure is equal to the baseline, then make
    the recommendation of “no further treatment needed”

> Return the recommendation at the end of the function. Run the function
> using the data from the table.

| Patient       | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   |
| ------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Baseline SBP  | 100 | 110 | 109 | 99  | 103 | 101 | 125 | 130 | 135 |
| Follow-up SBP | 110 | 100 | 112 | 105 | 100 | 121 | 110 | 120 | 109 |

5.  The data *airquality* is an R dataset. If you type airquality in the
    console window, you will be able to view the data. The data records
    daily readings of air quality from May 1, 1973 to September 30,
    1973. The variable Temp records the maximum daily temperature at La
    Guardia airport.

<!-- end list -->

1)  Use the function sample (data$variable, k) to take 50 sample
    temperature, where k is the sample size.

2)  Find the mean temperature of the 50 samples

3)  Use a for loop to iterate the process of a) and b) 1000 times, and
    generate a sampling distribution of the 1000 sample means.

<!-- end list -->

6.  The following are a sample of observations on incoming solar
    radiation at a greenhouse:

> 11.1 10.6 6.3 8.8 10.7 11.2 8.9 12.2

1)  Assign the data to an object called **solar.radiation**.

2)  Find the mean, median, range, and variance of the radiation
    observations.

3)  Add 10 to each observation of **solar.radiation** and assign the
    result to **sr10**. Find the mean, median, range, and variance of
    **sr10**.

4)  Multiply each observation by \(- 2\), and assign the result to
    **srm2**. Find the mean, median, range, and variance of **srm2**.

<!-- end list -->

7.  Consider the built-in **USArrests** data frame.

<!-- end list -->

1)  Find the average per capita murder rate (**Murder**) in regions
    where the percentage of the population living in urban areas
    (**UrbanPop**) exceeds 77%. Compare this with the average per capita
    murder rate where urban area population is less than 50%.

2)  Construct a new data frame consisting of a random sample of 12 of
    the records of the **USArrests** data frame, where the records have
    been sampled without replacement.

<!-- end list -->

8.  The **beaver1** and **beaver2** datasets contain body temperatures
    of two beavers. Add a column named **id** to the **beaver1**
    dataset, where the value is always 1. Similarly, add an **id**
    column to **beaver2**, with value 2. Using the **rbind( )**
    function, vertically concatenate the two data frames. Find the
    subset where either beaver is active.

9.  The function **sd** calculates the standard deviation. Calculate the
    standard deviation of the numbers from 0 to 100.

10. Create the vector **c(8,8,4,4,5,1,5,6,6,8)** as **bar**. Identify
    the elements less than or equal to 6 **AND** not equal to 4.

11. The conversion from a temperature measurement in degrees Fahrenheit
    \(F\) to Celsius \(C\) is performed using the following equation:
    \(C = \ \frac{5}{9}\left( F - 32 \right)\). Use vector-oriented
    behavior in R to convert the temperatures 45, 77, 20, 19, 101, 120,
    and 212 in degrees Fahrenheit to degrees Celsius.

12. Create and store this data frame as **dframe** in your R workspace:

| **person** | **sex** | **funny** |
| ---------- | ------- | --------- |
| Stan       | M       | High      |
| Francine   | F       | Med       |
| Steve      | M       | Low       |
| Roger      | M       | High      |
| Hayley     | F       | Med       |
| Klaus      | M       | Med       |

**person** should be a character vector, **sex** should be a factor with
levels **F** and **M**, and **funny** should be a factor with levels
**Low, Med**, and **High**.

1)  Stan and Francine are 41 years old, Steve is 15, Hayley is 21, and
    Klaus is 60. Roger is extremely old – 106 years. Append these data
    as a new numeric column variable in **dframe** called **age**.

2)  Extract from **dframe** just the names and ages of any records where
    the individual is female and has a level of funniness equal to **Med
    OR High.**

