import argparse
import pandas as pd

# Control de argumentos y recogida de excels de la ruta dada de entrada
parser = argparse.ArgumentParser()
parser.add_argument('excel_path', type=str)
args = parser.parse_args()

# Cargar el excel resumen como DataFrame
df = pd.read_excel(args.excel_path, skiprows=1)

# Limpiamos datos y renombramos
columns_to_csv = ['Ticker', 'Incept. Date', 'Net Assets (USD)', 'Sub Asset Class', 'Region', 'Market']  # Columnas que deseas conservar
df = df[columns_to_csv]  # Selecciona solo las columnas que deseas conservar
df = df.rename(columns={'Ticker': 'ticker', 'Incept. Date': 'inception_date', 
                        'Net Assets (USD)': 'net_assets', 'Sub Asset Class': 'equity_class',
                        'Region': 'region', 'Market': 'market'})
df['inception_date'] = pd.to_datetime(df['inception_date'])

# Exportar el DataFrame a un archivo CSV
df.to_csv("Data/PreProcessed/resume.csv", index=False, sep=',', header=True)

print(f'Se ha exportado el archivo CSV como \'Data/pre-processed/resume.csv\'')

