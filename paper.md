# Data Processes Proyect
Paper for group 11

# Members
- José Domínguez Pérez
- Drago Be Lehn Jiménez
- Jaime José Monjo Rodríguez
- Patricia Ortiz Zamora
- Pablo Ángel Pérez Soto

## Abstract
We have chosen the tourism domain because we think it is constantly growing and the order of the day.
We believe that airbnb is having a good influence on society and that it is receiving a good reception from users. Through this study we have verified that is not the future, is the present of this kind of business, and we have tried to predict the Price of an apartment in NY depending on the influence of different characteristics such as the neighborhood, the type of apartment or the minimum number of nights.

## Introduction and Related Work
We find Tourism domain  an interesting field since we think it is a growing economic sector and according to the experts, now is the best moment to research and invest on it because thanks to new technologies as mobile apps and to the webs of collaborative economy as airbnb is possible to change the way we interact with the information since now its is more specific, easy to access and finally  is better for the users.
Also we think traveling to other countries or even cities of your own country is a good way to know new cultures and traditions favoring the cultural enrichment of people.

The motivation of this project is to predict the price of an accomodation provided some others variables such as the neighbourhood group, the type of room and the minimum number of nights that the apartment/room has to be rented.

### Questions
- Are there any different patterns when renting a shared flat depending on the country? (Not only in price, but in type of room, type of apartment, time of the year, etc)
- How is the location of a flat related to the price? How does the time of the year affects the disponibility and pricing of the airbnb flat?
- Is there a relationship between age and renting shared flats?
- Is the accomodation-sharing sector growing?
- How did the appearance of accomodation-sharing affected the hotel industry?
- **What is the price of an accomodation knowing the neighbourhood group, the type of room and the minimum number of nights that the accomodation has to be rented?**

### Examples of data driven projects
* [Hospitality Analytics](http://skiftx.com/wp-content/uploads/2016/12/Skift-SnapShot-Hospitality-Analytics-1.pdf)
    * SnapShot is a hospitality tool to analyze and process data from customers to hotels. This tool explain how to analyze the data and how to interpret them. Also this tool which helps to improve and make the data  collection of guests to have better experience in hotels.
* [The hunt for housing in NYC](https://unboxed-analytics.com/data-technology/the-hunt-for-housing-in-nyc-a-data-driven-approach/)
    * Unbox analitics is a scrip developed by Erik Webb who is a data technology enthusiastic informatics. This scrip analyses data from different neighborhoods of NY helping people to find house in NY.  It makes a comparative between prices and quality of the houses and flats, the user can find this info thought postal codes.
Thanks to this study you can easily filter by number of rooms and the maximum price you want to pay.
* [Airbnb vs Berlin](http://airbnbvsberlin.com)
    * This data driven project tries to answer whether sharing economy (such as airbnb) has contributed to a shortage in affordable housing in Berlin or not.
* [Airbnb the Amsterdam story with interactive maps](https://www.kaggle.com/erikbruin/airbnb-the-amsterdam-story-with-interactive-maps)
    * This data driven project gives us an overview of the type of airbnb flats that are available in Amsterdam; as well as some advice to the municipality of Amsterdam in order to find fraudulent hosting; and also gives the tourists some features about the flats such as the neighbourhood safety, the reviews, the avg price by date, etc. so that they can decide where they want to stay.
* [Trend of Demand and Supply in Beijing](https://www.kaggle.com/merryyundi/trend-of-demand-and-supply-of-airbnb)
	* This data project tries to analyze listing supply and demand by geography and time. After that, they develop machine learning models to recommendation the listing price.


## Exploratory Data Analysis
### New York Dataset
This dataset was gathered from [Airbnb](https://www.airbnb.com) and the owner, a Drexel University’s student, [Dgomonov](https://www.kaggle.com/dgomonov) shared it publicly on [his kaggle](https://www.kaggle.com/dgomonov/new-york-city-airbnb-open-data). The dataset includes information about hosts, location and availability in New York for 2019. 
The data consists of one dataset (AB_NYC_2019.csv) which is structured in 49075 observations and 16 features. With this data set we can  study the patterns when renting an accomodation depending on the country and whether the different features (such as location, time of the year, ...) affects disponibility and price.

The features gathered in the dataset are:

| Feature | Type | Description |
| ------- | ---- | ---------- |
| id | Identifier | Listing ID |
| name | String | Name of the listing |
| host_id | Identifier | Host ID |
| host_name | String | Name of the host |
| neighbourhood_group | String | Location. Categorical variable |
| neighbourhood | String | Area. Categorical variable |
| latitude | Latitude | Latitude coordinates |
| longitude | Longitude | Longitude coordinates |
| room_type | String | Listing space type |
| price | Integer | Price in dollars |
| minimun_nights | Integer | Amount of nights minimum |
| number\_of_reviews | Integer | Number of reviews |
| last_review | Date | Latest review |
| reviews\_per_month | Integer | Number of reviews per month |
| calculated\_host\_listings_count | Integer | Amount of listing per host |
| availability_365 | Integer | Number of days when listing is available for booking |

Now, we are going to display some graphics in order to perfom the explanatory data analysis.

![](https://github.com/JMonjo/DPProyect/blob/master/imagesDP/img1.png?raw=true)

In terms of missing data, only the features referring to the reviews per month and last review that users submit after a stay contain 20.56 % of missing values. These two variables are not going to be used in our predictive algorithms, therefore the missing values do not affect significantly the analysis of the data.

![](https://github.com/JMonjo/DPProyect/blob/master/imagesDP/img2.png?raw=true)
![](https://github.com/JMonjo/DPProyect/blob/master/imagesDP/img3.png?raw=true)

The price variable is decided to be transformed to a logarithmic scale, this is done to counter the skewness towards large values where few points are larger than the bulk of the data. In this way it can be observed in the second graphic how the distribution of the histogram is more spread.

![](https://github.com/JMonjo/DPProyect/blob/master/imagesDP/img4.png?raw=true)
![](https://github.com/JMonjo/DPProyect/blob/master/imagesDP/img5.png?raw=true)

This is also done with the minimum number of nights feature, after been transformed to logarithmic scale, the distribution is more spread and more intuitively understandable.

With the goal of understanding better what influences the price of an accommodation, the different districts and type of rooms available were studied measuring the number of reservations that each variable scored.

![](https://github.com/JMonjo/DPProyect/blob/master/imagesDP/img6.png?raw=true)

Manhattan and Brooklyn clearly receive a higher number of reservations than the Bronx, Queens and Staten Island. This could infer that the price in these two district is higher than in the rest due to the high demand of rooms.

![](https://github.com/JMonjo/DPProyect/blob/master/imagesDP/img7.png?raw=true)

The previous observation is confirmed in this graph which shows that Manhattan has the highest price of rooms followed by Brooklyn.

![](https://github.com/JMonjo/DPProyect/blob/master/imagesDP/img8.png?raw=true)

Finally, the two variables are combined in this graph to observed a complete overview of the prices for the different types of rooms in districts. As it was expected, the most expensive accomodations (in order) are an entire home/apt, a private room and, finally, a shared room.

## Methods
### Strength of relationships
After the explanatory analysis, we proceed to try to assess relationships in our data. First, the relevant feature to answer our study question and the one that we are trying to predict is the price so we are going to try to fit a linear model with the price as a response variable. Considering the rest of our features we choose the neighborhood, the type of room and the minimum nights as the explanatory variables. We have chosen these variables because we think that are the ones that could influence more on our response variable. We remove variables as the name, host name; id because it doesn’t gives any additional information related with the price, and remove variables as the latitude and longitude as this information is summarize in the neighborhood group variable. This variable could be of some us if we had additional information about where the subway stations are, or tourist places in a particular neighborhood that could influence in some way in the price but we don’t have that information. Also, variables like reviews or number of reviews could be of some interest but because we don’t have any information about if that reviews are good or bad is a feature that we decided to remove.
In a first approach, we will not use the logarithm in order to normalize the distribution of the continuous variables, but as we will be able to see, more accurate results are obtained when normalizing data distribution.

### Predictions
Now we are going to try to fit machine learning methods to make predictions about the price feature. In our data set our most influential variables are categorical for this type of variables decision trees and artificial neural networks are very useful. We built 3 models (case weight, random forest, feedforward artificial neural network) in order to compared them and pick the best one. To train the algorithm first we have split the data (training and testing), then remove non-sense values (because our dataset contains 48895 observations, we remove the 11 rows with missing values) and finally transform our categorical values (`typeOfRoom` and `neighborhood`) into factors.

## Results
Next, we will show the results of the first linear regression model:

```r
Call:
lm(formula = price ~ neighbourhood_group + room_type + minimum_nights, 
    data = airbnbData)

Residuals:
   Min     1Q Median     3Q    Max 
-334.9  -63.1  -23.1   10.4 9922.3 

Coefficients:
                                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)                       160.28506    7.11536  22.527  < 2e-16 ***
neighbourhood_groupBrooklyn        21.60582    7.16567   3.015  0.00257 ** 
neighbourhood_groupManhattan       78.76531    7.16907  10.987  < 2e-16 ***
neighbourhood_groupQueens           8.90693    7.61345   1.170  0.24205    
neighbourhood_groupStaten Island   12.72054   13.80951   0.921  0.35698    
room_typePrivate room            -110.94935    2.14839 -51.643  < 2e-16 ***
room_typeShared room             -133.23035    6.92862 -19.229  < 2e-16 ***
minimum_nights                      0.19504    0.05098   3.826  0.00013 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 230.2 on 48876 degrees of freedom
Multiple R-squared:  0.08183,	Adjusted R-squared:  0.0817 
F-statistic: 622.3 on 7 and 48876 DF,  p-value: < 2.2e-16
```

Looking to this table, we conclude that all of the variables are relevant to the model as p < 0.05 for all of them. However, the error obtained in the linear regression analysis is quite high and the R-squared is very low which means that the model is just able to explain the 8% of the data so we are going to try to reduce this by normalizing the distribution of the continuous variables, but first, we are going to explain this model due to the model with logarithm scale is harder to interpretate.

We can appreciate that Manhattan is much more expensive than the other ones as its coefficient is 78.79639, which means that it is 78.79639 times more expensive than the missing neighbourhood, Bronx, which we also know that is the cheapest due to the rest of neighbourhoods have a positive coefficient. Regarding to the room type, we can see that the entire home/apartment is the most expensive, as expected, due to the fact that all of the coefficients are negative. The cheapest room type is a shared room, which is 133.30813 times cheaper than an entire home/apartment and not much more cheaper than a private room(133.30813 vs 110.95257). Lastly, the more minimum nights a person has to rent for an apartment/room, the more they have to pay. This is due to the fact that the coefficient is positive (0.19507). However, this amount of money does not increase dramatically, but a little. We thought that the more nights, the cheaper it would be as the owner would rent the apartment/room for more days, meaning they would get some economic security. Nevertheless, this was not the case.

Now we are going to show the output for the linear regression model having normalized the distribution of the continuous variables (`price` and `minimum_nights`):

```r
Call:
lm(formula = price ~ neighbourhood_group + room_type + minimum_nights, 
    data = airbnbData)

Residuals:
    Min      1Q  Median      3Q     Max 
-3.0248 -0.3239 -0.0487  0.2489  5.3023 

Coefficients:
                                  Estimate Std. Error  t value Pr(>|t|)    
(Intercept)                       4.823573   0.016024  301.018  < 2e-16 ***
neighbourhood_groupBrooklyn       0.222038   0.015992   13.885  < 2e-16 ***
neighbourhood_groupManhattan      0.556907   0.016006   34.793  < 2e-16 ***
neighbourhood_groupQueens         0.105772   0.016982    6.228 4.75e-10 ***
neighbourhood_groupStaten Island  0.020586   0.030802    0.668    0.504    
room_typePrivate room            -0.798831   0.004852 -164.638  < 2e-16 ***
room_typeShared room             -1.159722   0.015491  -74.864  < 2e-16 ***
minimum_nights                   -0.048301   0.002218  -21.772  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.5134 on 48876 degrees of freedom
Multiple R-squared:  0.4595,	Adjusted R-squared:  0.4594 
F-statistic:  5936 on 7 and 48876 DF,  p-value: < 2.2e-16
```

The R-squared has improved from 0.08 (in the first model) to 0.45. But it is not still as high as we would like in order to make our predictions. This could be because our linear model is missing some key variable that is not included in our dataset and that has a big influence in the price like how the apartment actually is (old or new, big or small) or what extras does it have (with wifi or without, with breakfast or with out) which would be key aspects that may influence in our response variable. We can also appreaciate that the dummy variable `neighbourhood_groupQueens` is now relevant to the model due to the fact that its p-value is very close to 0.

We can see in the following anova table that all the variables taken are relevant to the model as their p-value is less than 0.05 for all of them.

```r
Analysis of Variance Table

Response: price
                       Df  Sum Sq Mean Sq  F value    Pr(>F)    
neighbourhood_group     4  3144.1   786.0  2982.67 < 2.2e-16 ***
room_type               2  7681.9  3840.9 14574.75 < 2.2e-16 ***
minimum_nights          1   124.9   124.9   474.02 < 2.2e-16 ***
Residuals           48876 12880.4     0.3                       
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```

### Prediction
Next, we will compare the accuracy of the different machine learning methods we have used in order to predict our outcome variable. We have calculated the RMSE using the predictions with the test set, although the output for every method has its own RMSE (this does not take into account the test values and this is the reason why we are not going to use it)
#### Bagged CART
This is a case weight method. In this case, there was no tune parameter, and the results were the following:

```r
Bagged CART 

39108 samples
    3 predictor

Pre-processing: re-scaling to [0, 1] (7) 
Resampling: Cross-Validated (10 fold) 
Summary of sample sizes: 35197, 35197, 35196, 35199, 35197, 35197, ... 
Resampling results:

  RMSE       Rsquared   MAE      
  0.5185106  0.4494314  0.3782467
```
The RMSE, using the test data is 0.520289.
#### Bayesian Regularized Neural Networks
This is a feedforward artificial neural network method. The only tune parameter is the number of neurons of the model and we have used 4 neurons for the grid search. The results were the following:

```r
Bayesian Regularized Neural Networks 

39108 samples
    3 predictor

Pre-processing: re-scaling to [0, 1] (7) 
Resampling: Cross-Validated (10 fold) 
Summary of sample sizes: 35197, 35198, 35197, 35197, 35197, 35197, ... 
Resampling results across tuning parameters:

  neurons  RMSE       Rsquared   MAE      
  1        0.5131601  0.4608042  0.3723687
  2        0.5123448  0.4625398  0.3709962
  3        0.5115105  0.4643038  0.3703667
  4        0.5111102  0.4651419  0.3698992

RMSE was used to select the optimal model using the smallest value.
The final value used for the model was neurons = 4.
```
As we can appreciate, the most accurate is for the 4 neurons model, so we are going to calculate the RMSE, using the test data set, which is 0.5135646.
#### Stochastic Gradient Boosting
This is a random forest method. In this method, there were several parameters, and the results having changed some of them were the following:

```r
Stochastic Gradient Boosting 

39108 samples
    3 predictor

Pre-processing: re-scaling to [0, 1] (7) 
Resampling: Cross-Validated (10 fold) 
Summary of sample sizes: 35197, 35197, 35196, 35196, 35199, 35197, ... 
Resampling results across tuning parameters:

  interaction.depth  n.trees  RMSE       Rsquared   MAE      
  1                   50      0.5215656  0.4517225  0.3807068
  1                  100      0.5142744  0.4596507  0.3736379
  1                  150      0.5133171  0.4607449  0.3726797
  2                   50      0.5136010  0.4614927  0.3724565
  2                  100      0.5117663  0.4639050  0.3707224
  2                  150      0.5116544  0.4640285  0.3704110
  3                   50      0.5119785  0.4639348  0.3708928
  3                  100      0.5113004  0.4648303  0.3701210
  3                  150      0.5110834  0.4652161  0.3697940

Tuning parameter 'shrinkage' was held constant at a value of 0.1
Tuning parameter 'n.minobsinnode' was
 held constant at a value of 10
RMSE was used to select the optimal model using the smallest value.
The final values used for the model were n.trees = 150, interaction.depth = 3, shrinkage = 0.1
 and n.minobsinnode = 10.
```
As a result, we obtain that the best parameters are n.trees = 150 and interaction.depth = 3. So we are going to choose these parameteres in order to calculate the RMSE, using the test data, which is 0.511543.
#### Conclusion
Based on the RMSE for the different ML methods, the best ML method is the Stochastic Gradient Boosting due to the fact that it has the lowest error (0.511543).

## Discussion and Future Work
Analyzing the results, it is impossible to predict with accuracy the variable price due to data are not fair enough. However, it could be a great beginning to improve and implement it to others dataset with better data.

As future work we can look for more datasets with more variables so that we can make a more specific analysis and with more specific results. We can expand the number of cities or countries in which to look at flats so that we can make a comparison with the different prices to the place of rental and to the monetary acquisition of that location.
