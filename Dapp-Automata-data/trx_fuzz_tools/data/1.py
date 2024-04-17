import pandas as pd

# 读取原始CSV文件
df = pd.read_csv('3_BasicProvenance.csv')

# 根据"To"列进行分组
grouped = df.groupby('To')

# 遍历分组并将每个分组保存为单独的CSV文件
for name, group in grouped:
    group.to_csv(f'{name}.csv', index=False)
