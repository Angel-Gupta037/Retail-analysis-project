#Data Overall
import pandas as pd
df=pd.read_csv(r"C:\Users\DELL\Documents\python_codes\retail_project\Data\cleaned_retail.csv")
print(df.shape)
print(df.head())
print(df.dtypes)
print(df.describe())
#countries with most orders?
Country_orders =df.groupby('Country')['InvoiceNo'].nunique().sort_values(ascending =False)
print(Country_orders.head(10))

#Top Selling Products
Top_products =df.groupby('Description')['Revenue'].sum().sort_values(ascending =False)
print(Top_products.head(10))

# Convert date column
df['InvoiceDate'] = pd.to_datetime(df['InvoiceDate'])

# Revenue over time
df['Month'] = df['InvoiceDate'].dt.to_period('M')
monthly_revenue = df.groupby('Month')['Revenue'].sum().sort_index()
print(monthly_revenue)