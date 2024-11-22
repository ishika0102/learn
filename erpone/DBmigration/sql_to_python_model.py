import re

# Mapping MySQL types to Python types
type_mapping = {
    'int': 'int',
    'bigint': 'int',
    'varchar': 'str',
    'text': 'str',
    'longtext': 'str',
    'char': 'str',
    'tinyint': 'bool',
    'smallint': 'int',
    'mediumint': 'int',
    'datetime': 'datetime',
    'timestamp': 'datetime',
    'date': 'date',
    'decimal': 'float',
    'float': 'float',
    'double': 'float',
    'blob': 'bytes',
    'bool': 'bool',
    'boolean': 'bool'
}


def clean_column_type(column_type):
    """
    Clean the column type by removing COLLATE, UNSIGNED, and size declarations like (250).
    """
    # Remove size declarations (e.g., varchar(250) -> varchar)
    column_type = re.sub(r'\(\d+\)', '', column_type)
    # Remove COLLATE if present
    column_type = re.sub(r'COLLATE \w+', '', column_type).strip()
    # Remove UNSIGNED keyword
    column_type = column_type.replace('UNSIGNED', '').strip()
    return column_type


def convert_mysql_to_python(sql_file_path, output_file_path):
    with open(sql_file_path, 'r') as f:
        sql_content = f.read()

    # Regex to find all table definitions
    tables = re.findall(r'CREATE TABLE `(\w+)` \((.*?)\) ENGINE', sql_content,
                        re.S)

    models = []

    for table_name, columns in tables:
        # Start defining a class for each table
        class_def = f"class {table_name.capitalize()}(BaseModel):\n"
        class_def += f"    __tablename__ = '{table_name}'\n"

        # Split the columns by lines
        column_lines = columns.splitlines()

        for column in column_lines:
            column = column.strip().rstrip(',')
            # Extract column name and type
            match = re.match(
                r'`(\w+)` ([\w\(\)]+(?: UNSIGNED)?(?: COLLATE \w+)?)', column)
            if match:
                col_name = match.group(1)
                col_type = match.group(2)

                # Clean up the column type (remove COLLATE, UNSIGNED, and size declarations)
                col_type_clean = clean_column_type(col_type)

                # Find the Python equivalent type
                python_type = type_mapping.get(col_type_clean, 'str')

                # Add the column as an attribute to the class
                class_def += f"    {col_name}: {python_type}\n"

        # Add class definition to models list
        models.append(class_def)

    # Write each class as a new class in models.txt
    with open(output_file_path, 'w') as f:
        for model in models:
            f.write(f"{model}\n\n")


# File paths
input_sql_file = '/home/ishika/Projects/erpone/output_schema 1.sql'
output_txt_file = 'models.txt'

# Convert SQL file to Python classes and save in text file
convert_mysql_to_python(input_sql_file, output_txt_file)
