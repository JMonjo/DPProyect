# DPProyect
Paper for group 11

# Members
- José Domínguez Pérez
- Drago Be Lehn Jiménez
- Jaime José Monjo Rodríguez
- Patricia Ortiz Zamora
- Pablo Ángel Pérez Soto

# Abstract
# Introduction and Related Work
We find Tourism domain  an interesting field since we think it’s a growing economic sector and according to the experts, now is the best moment to research and invest on it because thanks to new technologies as mobile apps and to the webs of collaborative economy as airbnb is possible to change the way we interact with the information since now its is more specific, easy to access and finally  is better for the users.
Also we think traveling to other countries or even cities of your own country is a good way to know new cultures and traditions favoring the cultural enrichment of people.

for answering a _specific_ data driven question of interest?????????????????????????????????

## Questions
- Are there any different patterns when renting a shared flat depending on the country? (Not only in price, but in type of room, type of apartment, time of the year, etc)
- How is the location of a flat related to the price? How does the time of the year affects the disponibility and pricing of the airbnb flat?
- Is there a relationship between age and renting shared flats?
- Is the accomodation-sharing sector growing?
- How did the appearance of accomodation-sharing affected the hotel industry?

## Examples of data driven projects
* [Hospitality Analytics](http://skiftx.com/wp-content/uploads/2016/12/Skift-SnapShot-Hospitality-Analytics-1.pdf)
    * SnapShot is a hospitality tool to analyze and process data from customers to hotels. This tool explain how to analyze the data and how to interpret them. Also this tool which helps to improve and make the data  collection of guests to have better experience in hotels.
* [The hunt for housing in NYC](https://unboxed-analytics.com/data-technology/the-hunt-for-housing-in-nyc-a-data-driven-approach/)
    * Unbox analíticas is a scrip developed by Erik Webb who is a data technology enthusiastic informatics. This scrip analyses data from different neighborhoods of NY helping people to find house in NY.  It makes a comparative between prices and quality of the houses and flats, the user can find this info thought postal codes.
Thanks to this study you can easily filter by number of rooms and the maximum price you want to pay.
* [Airbnb vs Berlin](http://airbnbvsberlin.com)
    * This data driven project tries to answer whether sharing economy (such as airbnb) has contributed to a shortage in affordable housing in Berlin or not.
* [Airbnb the Amsterdam story with interactive maps](https://www.kaggle.com/erikbruin/airbnb-the-amsterdam-story-with-interactive-maps)
    * This data driven project gives us an overview of the type of airbnb flats that are available in Amsterdam; as well as some advice to the municipality of Amsterdam in order to find fraudulent hosting; and also gives the tourists some features about the flats such as the neighbourhood safety, the reviews, the avg price by date, etc. so that they can decide where they want to stay.


# Exploratory Data Analysis
## New York Dataset
This dataset was gathered from [Airbnb](https://www.airbnb.com) and the owner, a Drexel University’s student, [Dgomonov](https://www.kaggle.com/dgomonov) shared it publicly on [his kaggle](https://www.kaggle.com/dgomonov/new-york-city-airbnb-open-data). The dataset includes information about hosts, location and availability in New York for 2019. 
The data consists of one dataset (AB_NYC_2019.csv) which is structured in 49075 observations and 16 features. With this data set we can  study the patterns when renting a shared flat depending on the country and whether the different features (such as location, time of the year, ...) affects disponibility and price.

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
| number_of_reviews | Integer | Number of reviews |
| last_review | Date | Latest review |
| reviews_per_month | Integer | Number of reviews per month |
| calculated_host_listings_count | Integer | Amount of listing per host |
| availability_365 | Integer | Number of days when listing is available for booking |

Written interpretation of graphic is provided???????????????????????????????????????

# Methods
# Results
# Discussion and Future Work
# Code Quality