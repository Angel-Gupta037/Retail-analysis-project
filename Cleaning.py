import pandas as pd

# Load data
df = pd.read_csv(r'C:\Users\DELL\Desktop\online_retail.csv'

)

print(df.shape)
print(df.head())
print(df.isnull().sum())

# Drop missing values
df = df.dropna(subset=['CustomerID', 'Description'])

# Remove returns and bad data
df = df[df['Quantity'] > 0]
df = df[df['UnitPrice'] > 0]

# Fix date column
df['InvoiceDate'] = pd.to_datetime(df['InvoiceDate'])

# Create Revenue column
df['Revenue'] = df['Quantity'] * df['UnitPrice']

# Check result after cleaning
print(df.shape)
print(df.isnull().sum())

# Export cleaned data
df.to_csv(r'C:\Users\DELL\Documents\python_codes\retail_project\data\cleaned_retail.csv', index=False)
print("Cleaned file saved!")