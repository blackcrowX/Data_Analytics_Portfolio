<h1 align="center">Pokemon Generation 1-8</h1>

<p align="center">
  <img width="200px" src="https://github.com/blackcrowX/blackcrowX.github.io/blob/main/images/icons/python.png?raw=true"/>
</p>

## Introduction

This project embarks on a quest to unlock the secrets of Pokemon across Generation 1 to 8, harnessing the power of Python and embracing the processes of data loading, data cleaning, data analysis and data visualisation. With the aim of delving into a vast and comprehensive dataset comprising 1072 Pokemon and their alternate forms, we embark on an immersive journey to explore their unique attributes, unravel hidden patterns, and identify intriguing trends. By harnessing the capabilities of Python and leveraging a variety of libraries, we will deftly manipulate the data, create captivating visualizations, and conduct insightful statistical analyses, unearthing valuable insights about the enchanting Pokemon universe.

For more detailed information, please refer to the `Pokemon_Gen_1-8.ipynb` code.

**Code:** [`Pokemon_Gen_1-8.ipynb`](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_III/Pokemon_Gen_1-8.ipynb)

**Data:** [`pokemon_gen_1-8.csv`](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_III/pokemon_gen_1-8.csv)

**Skills:**  NumPy, Pandas, MatlotLib and Seaborn

**Technology:** Jupyter Notebook (Python)

## Table of Contents

- [Objective](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_III/README.md#Objective)
- [Dataset](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_III/README.md#Dataset)
- [Setup](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_III/README.md#Setup)
- [Cleaning](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_III/README.md#Cleaning)
- [Analysis](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_III/README.md#Analysis)
- [Conclusion](https://github.com/blackcrowX/Data_Analytics_Portfolio/blob/main/Project_III/README.md#Conclusion)

## Objective

Our objective is to find the strongest pokemon, strongest type and explore the datatset for insights and correlations.

## Dataset

This dataset encompasses an astounding collection of all 898 Pokemon species, including 1072 variations, as of the year 2021. Delving deep into the fascinating realm of these mythical creatures, this dataset reveals a treasure trove of information, offering a holistic view of each Pokemon's unique attributes, origins, and legendary status. 

**Data:** [`pokemon_gen_1-8.csv`](https://github.com/owid/covid-19-data/blob/master/public/data/owid-covid-data.csv)

**Source:** [Data World](https://data.world/data-society/pokemon-with-stats)

## Setup

### Step 1: Import Libraries
In this initial step, we import and configure the necessary libraries for our data analysis in Jupyter Notebook. Libraries such as Pandas, NumPy, Matplotlib, and Seaborn are essential for data manipulation, numerical computations, and data visualisation.

```
import numpy as np
import pandas as pd
pd.plotting.register_matplotlib_converters()
import matplotlib.pyplot as plt
%matplotlib inline
import seaborn as sns
sns.set(style = "darkgrid")
sns.set_context('notebook', font_scale=1.1)
```

### Step 2: Import Dataset
Load the dataset into Python using Pandas as df for further analysis and exploration.

```
url = "https://raw.githubusercontent.com/blackcrowX/Data_Analytics_Portfolio/main/Project_III/pokemon_gen_1-8.csv"
df = pd.read_csv(url)
```

## Cleaning

### Step 3: Review Dataframe
Observe the first and last five rows of the dataframe to gain a quick overview of the data.

```
df.head()
```

## Analysis

## Conclusion
