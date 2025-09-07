# 📊 E-Retail Analytics with SQL & Python

## 📖 About

**E-Retail Analytics** is an end-to-end analytics project for Indian e-retail sales, featuring SQL scripts, Jupyter notebooks, and supporting datasets.

This project explores:

* Sales trends and seasonality
* Discount impact
* Competitor price comparison
* Customer segmentation
* Actionable business recommendations

---

## 🔎 **Overview**

This repository hosts a comprehensive analytics project analyzing Indian e-retail data through:

SQL scripts for querying and preprocessing data

Jupyter notebooks for exploratory data analysis (EDA), visualization, and insights

Dataset files to recreate the workflow end to end

---

## 📂 Repository Structure

```plaintext
E-Retail-Analytics-with-SQL-Python/
│
├── dataset/                        # Raw and/or preprocessed data files (e.g., CSV, Excel)
├── E_Retail_Analytics_SQL_Project.sql  # Core SQL script(s) for data prep and analysis
├── eda_and_visualization.ipynb     # Notebook for exploratory analysis and charts
├── xlsx_to_csv.ipynb               # Utility notebook to convert Excel data to CSV
└── README.md                       # (This document)
```

---


## 🛠️  Tech Stack

* **SQL** — Data extraction & analytics (PostgreSQL)
* **Python**:

  * `pandas` (data wrangling)
  * `sqlalchemy` (database connection)
  * `matplotlib` & `seaborn` (visualization)
  * `psycopg2` (PostgreSQL integration)
* **Jupyter Notebook** — Interactive analysis & visualization

---


## 📑  Data Source

This project uses public retail transactions data from Kaggle:

* **[Etailers Data India](https://www.kaggle.com/datasets/datasetsup/etailers-data-india)**
  A comprehensive dataset covering Indian e-retail transactions, product details, customer information, and sales history.
  Source: Kaggle, shared by datasetsup.

Data was downloaded and processed for exploratory analysis and business insights.

---

 

## 🔬 Key Insights 

* **Seasonal Revenue Analysis:**
  Reveals sales peaks for targeted campaigns and inventory planning.
* **Discount Effectiveness:**
  Measures how discounts affect units sold and profit margins.
* **Top Products:**
  Identifies top-selling items for focused marketing and stocking.
* **Competitor Price Comparison:**
  Analyzes pricing against market rivals for strategic price setting.
* **Customer Segmentation:**
  Groups customers for loyalty programs and targeted offers.
* **ROI & Business Recommendations:**
  Provides data-driven actions for operations and growth.

---

## How to Run

1. **Clone this repo**:

```bash
git clone https://github.com/prakrutiparmar/E-Retail-Analytics-with-SQL-Python.git
```

2. **Install dependencies**:

```bash
pip install pandas sqlalchemy matplotlib seaborn psycopg2-binary
```

3. **Set up the database**
   Configure and import data using provided SQL scripts (PostgreSQL recommended).
4. **Open notebooks**
   Use Jupyter Notebook or VS Code to open `eda_and_visualization.ipynb` and run cells step by step.

---

## 🌟 Features and Highlights

* **🗄️ Data wrangling using SQL:**
  Ideal for structuring and summarizing retail transactions efficiently.

* **📊 Exploratory analysis with Python:**
  Leverages Jupyter notebooks for interactive, visual storytelling and data exploration.

* **🔄 Excel-to-SQL/Python data pipeline:**
  Bridges raw Excel inputs with a seamless analytics workflow, ensuring end-to-end transparency.

* **🔧 Reusable and customizable:**
  Easily adaptable for other e-retail datasets, markets, or business scenarios.

---

## 📜 License

👩‍💻 Author: **Prakruti Parmar**

---

## 📬 Contact

Maintainer: [prakrutiparmar](https://github.com/prakrutiparmar)
💡 Feel free to open issues, contribute, or fork!
