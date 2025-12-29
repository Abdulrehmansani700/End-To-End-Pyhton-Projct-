# End-To-End-Pyhton-Projct-
 Projects For Cloud Data Engineering 
 # End-to-End Data Analysis Project 📊

Is project mein maine ek mukammal data pipeline banayi hai jo **Kaggle** se data leti hai, **Python & Pandas** ke zariye use clean karti hai, aur phir **SQL Server** mein load karke analysis ke liye ready karti hai.

---

## 🏗 Workflow Architecture
Project ka flow niche diye gaye steps par mushtamil hai:

1. **Kaggle:** Raw dataset extraction.
2. **Python (Pandas):** Data cleaning, handling missing values, aur data type conversion.
3. **SQL Loading:** `sqlalchemy` ka use karte hue cleaned data ko database mein shift karna.
4. **Data Analysis:** SQL queries ke zariye insights nikalna.



---

## 🛠 Tech Stack
* **Language:** Python 3.x
* **Data Manipulation:** Pandas, NumPy
* **Database Connectors:** `sqlalchemy`, `pyodbc`
* **Database:** SQL (MySQL / PostgreSQL / SQL Server)

---

## 💻 Code Implementation

### 1. Data Cleaning & Loading (Python)
Ye script data ko clean karti hai aur SQL mein load karti hai:

```python
