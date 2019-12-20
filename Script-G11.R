# Members of the Group 11

# Jose Dominguez Perez
# Drago Be Lehn Jimenez
# Jaime Jose Monjo Rodriguez
# Patricia Ortiz Zamora
# Pablo Angel Perez Soto

# Used libraries
library("tidyverse")
library("DataExplorer")
library("ggplot2")
library("grid")
library("vcd")
library("ggpubr") # Q-Q plots
library("dplyr")
library("tibble")
library("caret")
library("e1071")
library("Metrics")

# Loading the data from the Dataset
airbnbData <- read_csv(file = 'AB_NYC_2019.csv')

# ------------------------------------------------------------------------------------
# EXPLORATORY DATA ANALYSIS ----------------------------------------------------------
# ------------------------------------------------------------------------------------

summary(airbnbData)

# Looking at the missing data
plot_missing(airbnbData, geom_label_args = list("size" = 3, "label.padding" = unit(0.3, "lines")),group = list("Perfect" = 0, "Valid" = 0.06, "Not valid" = 1))+ labs(y="Number of missing data",x="Data", title ="Missing data") + theme_light()

# Histograms and density diagrams
plot_histogram(airbnbData)
plot_density(airbnbData)

# Seeing price histogram data
ggplot(data=airbnbData, aes(x=price)) + geom_histogram(aes(fill=price)) + labs(x="Price", y="Frequency", title="Price histogram") + theme_light()
# Now with logarithmic scale
ggplot(data=airbnbData, aes(x=price)) + geom_histogram(aes(fill=price)) + labs(x="Price", y="Frequency", title="Price histogram - Logarithmic scale") + theme_light() + scale_x_log10()

# Seeing the histogram data of the minimum number of nights
ggplot(data=airbnbData, aes(x=minimum_nights)) + geom_histogram(aes(fill=minimum_nights)) + labs(x="Minimum number of nights", y="Frequency", title="Histogram of the minimum number of nights") + theme_light()
# Now with logarithmic scale
ggplot(data=airbnbData, aes(x=minimum_nights)) + geom_histogram(aes(fill=minimum_nights)) + labs(x="Minimum number of nights", y="Frequency", title="Histogram of the minimum number of nights - Logarithmic scale") + theme_light() + scale_x_log10()

# Number of reservations by district
ggplot(data=airbnbData, aes(x=neighbourhood_group)) + geom_bar(aes(fill=neighbourhood_group)) + labs(y="Number of reservations",x="District",fill="District", title="Number of reservations by district") + theme_light()

# Reserve price by district
ggplot(data=airbnbData) + geom_boxplot(aes(x=neighbourhood_group, y= price, fill=neighbourhood_group)) + scale_y_log10() + labs(y="Price",x="District",fill="District", title ="Reserve price by district") + theme_light()

# Types of rooms by district
ggplot(data=airbnbData, aes(x=neighbourhood_group)) + geom_bar(aes(fill=room_type)) + labs(y="Frequency",x="District",fill="Type of room",title="Types of rooms by district") + theme_light()

# Types of rooms by district
Room <- airbnbData$room_type
District <- airbnbData$neighbourhood_group
mosaic(structable(Room ~ District), shade = TRUE, main = "Types of rooms by district", labeling = labeling_border(rot_labels = c(0,0,0,0), offset_labels = c(0,0,0,1.75)))

# Price per room type per district
ggplot(data=airbnbData) + geom_boxplot(aes(x=neighbourhood_group, y= price, fill=room_type)) + scale_y_log10() + labs(y="Price",x="District",fill="Type of room", title ="Price per room type per district") + theme_light()

# ------------------------------------------------------------------------------------
# METHODS ----------------------------------------------------------------------------
# ------------------------------------------------------------------------------------

# STRENGTH OF RELATIONSHIPS

# Formula: Price ~ GrupoBarrio + TipoVivienda + NumeroMinimoNoches

# First of all, let's crate a new dataset with the variables of interest
airbnbData <- data.frame(price = airbnbData$price, neighbourhood_group = airbnbData$neighbourhood_group,
                         room_type = airbnbData$room_type, minimum_nights = airbnbData$minimum_nights)

# Let's check whether the values of our variables make sense
range(airbnbData$price)
# There are some 0 values for price, which does not make any sense
sum(airbnbData$price == 0)
# There are 11 observations with price equals to 0
dim(airbnbData)
# Our dataset contains 48895 observations, so we are going to remove these 11 observations with
# price equals to 0 since this number is insignificant compared to the total number of observations.
airbnbData <- airbnbData[airbnbData$price != 0,]

# Let's factorize the strings columns
airbnbData$neighbourhood_group <- as.factor(airbnbData$neighbourhood_group)
airbnbData$room_type <- as.factor(airbnbData$room_type)

# Multiple lineal regression analysis
lm1 = lm(formula = price ~ neighbourhood_group + room_type + minimum_nights, data=airbnbData)
#lm1.log = lm(formula = log(price) ~ neighbourhood_group + room_type + minimum_nights, data=airbnbData)
#lm1.log2 = lm(formula = log(price) ~ neighbourhood_group + room_type + log(minimum_nights), data=airbnbData)
#lm1.sin = lm(formula = log(price) ~ neighbourhood_group + room_type, data=airbnbData)

# Coefficients
summary(lm1)
# Several coefficients due to categorical variables as response variables
# We can appreciate that Manhattan is much more expensive than the other ones
# as its coefficient is 78.79639, which means that it is 78.79639 times more expensive
# than the missing neighbourhood, Bronx, which we also know that is the cheapest due to the rest of
# neighbourhoods have a positive coefficient.
# Regarding to the room type, we can see that the entire home/apartment is the most expensive, as expected, due
# to the fact that all of the coefficients are negative. The cheapest room type is a shared room,
# which is 133.30813 times cheaper than an entire home/apartment and not much more cheaper than a private room
# (133.30813 vs 110.95257).
# Lastly, the more minimum nights a person has to rent for an apartment/room, the more they have to pay. This
# is due to the fact that the coefficient is positive (0.19507). However, this amount of money does not increase
# dramatically, but a little. We thought that the more nights, the cheaper it would be as the owner would
# rent the apartment/room for more days, meaning they would get some economic security. Nevertheless, this was
# not the case.

# Answer to relationships
anova(lm1)
# We can conclude that all of the variables are relevant to the model as p < 0.05 for all of them.
# However, the error obtained in the linear regression analysis is quite high, so we are going to
# try to reduce this by taking into account the normal distribution of the continuous variables.

# Let's check the normality of our data (continuous variables)
# As we have a lot of observations, we are going to use a grafical description of the normality (Q-Q plots)
# instead of conventional tests for normality since they are not such reliable when dealing with large samples
ggqqplot(airbnbData$price)
# This plot shows a sharp bend, which means that the price is not normally distributed
# In order to normalize the distribution of the data, we are going to calculate the logarithm of this variable
ggqqplot(log(airbnbData$price))
# We can appreciate how the normality distribution of the variable has imprived dramatically, which will help
# as obtain a more accurate regression model
airbnbData$price <- log(airbnbData$price)

# We will do the same for the minimum_nights
ggqqplot(airbnbData$minimum_nights)
ggqqplot(log(airbnbData$minimum_nights))
airbnbData$minimum_nights <- log(airbnbData$minimum_nights)

# Now we are going to remake the regression analysis using the logarithm for the continuous variables
lm1.log = lm(formula = price ~ neighbourhood_group + room_type + minimum_nights, data=airbnbData)
summary(lm1.log)
anova(lm1.log)
# We can appreciate that the R-square has increased dramatically regarding to the previous one. However, it
# is not good enough in order to make good predictions.

# PREDICTION

# Now we are going to use the machine learning process in order to predict data

# Create a set of training indices
trainIndex <- createDataPartition(airbnbData$price,
                                  p = .8,
                                  list = FALSE,
                                  times = 1
)

# Subset your data into training and testing set
training_set <- airbnbData[ trainIndex, ]
test_set <- airbnbData[ -trainIndex, ]

fitControl <- trainControl(method = "cv", number = 10)

# Train, specifying cross validation
fit_with_cv1 <- train(price ~ ., data = training_set, method = "treebag", preProcess = "range", trControl = fitControl)
# Random Forest algorithm

# In order to assess these machine learning methods, we have to use regression metrics due to the fact
# that our dependent variable (price) is continuous
basic_preds <- predict(fit_with_cv1, test_set)
rmse(test_set$price,basic_preds)
dataset <- data.frame(basic_preds, test_set$price)

tune <- expand.grid(neurons=1:4)
fit_with_cv2 <- train(price ~ ., data = training_set, method = "brnn", preProcess = "range", trControl = fitControl, tuneGrid = tune, verbose=FALSE)
# Feed Forward Neural Network algorithm

# In order to assess these machine learning methods, we have to use regression metrics due to the fact
# that our dependent variable (price) is continuous
basic_preds <- predict(fit_with_cv2, test_set)
rmse(test_set$price,basic_preds)

fit_with_cv3 <- train(price ~ ., data = training_set, method = "gbm", preProcess = "range", trControl = fitControl, verbose=FALSE)

# In order to assess these machine learning methods, we have to use regression metrics due to the fact
# that our dependent variable (price) is continuous
basic_preds <- predict(fit_with_cv3, test_set)
rmse(test_set$price,basic_preds)
