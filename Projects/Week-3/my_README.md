<img src="https://bit.ly/2VnXWr2" alt="Ironhack Logo" width="100"/>

# API and Web Data Scraping
*[Mahshid AMIR MOAZAMI]*

*[Ironhack, Paris, 30 November 2020]*

## Content
- [Project Description](#project-description)
- [Workflow](#workflow)
- [Organization](#organization)
- [Links](#links)

## Project Description
The goal of this project was to collect information about recipes from french cooking website(cuisineAZ).


## Workflow

Analyse SiteWeb : First step was parsing html code of each recipe and find usefull information. 

Collect Data : Using css selector to detect exact information from html tags. 

Create DataFrame: Load urls and imports information to the dataframe using python libraries. 

Clean DataFrame : Find missed, incorrect data, clean dataframe.

Export Data : Export dataframe to .csv file and create an sqlschema export recipe dataframe.



## Organization
In repositoy of project you find:

- output(recipe.csv, recipe.sql)
- my_README.md
- recipe_scraping.ipynb.ipynb (project main)
- scraper.py
- functions.py
  

## Links 

[Repository](https://github.com/mahshidAM/data-ft-par-labs/tree/main/Projects/Week-3)  
[Slides]()  
