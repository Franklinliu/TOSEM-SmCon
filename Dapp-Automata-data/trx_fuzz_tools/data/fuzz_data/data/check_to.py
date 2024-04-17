import os
import pandas as pd


to_values_dict = {}


folder_path = '.'

# 遍历文件夹中的每个CSV文件
for filename in os.listdir(folder_path):
    if filename.endswith('.csv'):
        file_path = os.path.join(folder_path, filename)
        df = pd.read_csv(file_path)
        
        # 获取当前CSV文件的"To"列，并将其作为字典的键
        to_column = df['To']
        
        # 遍历"To"列中的每个值
        for to_value in to_column:
            if to_value in to_values_dict:
                to_values_dict[to_value].append(filename)
            else:
                to_values_dict[to_value] = [filename]

# 打印具有相同"To"值的文件名
for to_value, filenames in to_values_dict.items():
    if len(filenames) > 1:
        print(f"To value '{to_value}' found in files: {', '.join(filenames)}")
