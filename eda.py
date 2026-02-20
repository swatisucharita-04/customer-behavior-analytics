import pandas as pd

# 1. Load dataset
df = pd.read_csv("customer_shopping_behavior.csv")

# 2. Clean column names
df.columns = df.columns.str.lower()
df.columns = df.columns.str.replace(' ', '_')
df = df.rename(columns={'purchase_amount_(usd)': 'purchase_amount'})

print(df.columns)

# 3. Handle missing review_rating by category median
df['review_rating'] = df.groupby('category')['review_rating'] \
                         .transform(lambda x: x.fillna(x.median()))

print(df.isnull().sum())

# 4. Create age_group column
labels = ['Young Adult', 'Adult', 'Middle-aged', 'Senior']
df['age_group'] = pd.qcut(df['age'], q=4, labels=labels)

# 5. Map frequency_of_purchases to days
frequency_mapping = {
    'Fortnightly': 14,
    'Weekly': 7,
    'Monthly': 30,
    'Quarterly': 90,
    'Bi-Weekly': 14,
    'Annually': 365,
    'Every 3 Months': 90
}

df['purchase_frequency_days'] = df['frequency_of_purchases'].map(frequency_mapping)

# 6. Check discount vs promo code
print((df['discount_applied'] == df['promo_code_used']).all())

# 7. Drop duplicate column
df = df.drop('promo_code_used', axis=1)

# 8. Final preview
print(df[['age', 'age_group', 'frequency_of_purchases', 'purchase_frequency_days']].head(10))

# 9. Save cleaned dataset
df.to_csv("customer_behavior_cleaned.csv", index=False)

print("EDA complete. Cleaned file saved.")