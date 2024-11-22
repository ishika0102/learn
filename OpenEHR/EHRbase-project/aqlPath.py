import json

def extract_id_aql_paths(data):
    id_aql_map = {}
    stack = [data]
    count_id = 0
    count_aql_path = 0
    
    while stack:
        current = stack.pop()
        
        if isinstance(current, dict):
            if 'id' in current:
                key = current['id']
                print(str(count_id) + ":" + key)
                count_id += 1
                if 'aqlPath' in current:
                    if key not in id_aql_map:
                        id_aql_map[key] = []
                    id_aql_map[key].append(current['aqlPath'])
                    count_aql_path += 1
                    print(str(count_aql_path) + ":" + current['aqlPath'])
                    print(len(id_aql_map))
            
            for value in current.values():
                stack.append(value)
        
        elif isinstance(current, list):
            for item in current:
                stack.append(item)
    
    return id_aql_map, count_id, count_aql_path

input_file = '/home/ishika/Projects/OpenEHR/EHRbase-project/web_template.json'
output_file = 'output.json'  # Output file path
with open(input_file, 'r') as f:
    data = json.load(f)

# Extract 'id' -> 'aqlPath' mappings iteratively
id_aql_map, count_id, count_aql_path = extract_id_aql_paths(data)

print(f"Count of 'id': {count_id}")
print(f"Count of 'aqlPath': {count_aql_path}")

# Write 'id' -> 'aqlPath' mappings to a JSON file
with open(output_file, 'w', encoding='utf-8') as out_file:
    json.dump(id_aql_map, out_file, indent=2)

print(f'Extracted {len(id_aql_map)} id -> aqlPath mappings to {output_file}')



# duplicate values are getting overwritten
# import json

# def extract_id_aql_paths(data):
#     id_aql_map = {}
#     stack = [data]
#     count_id = 0
#     count_aql_path = 0
    
#     while stack:
#         current = stack.pop()
        
        
#         if isinstance(current, dict):
#             if 'id' in current:
#                 key = current['id']
#                 print(str(count_id)+":" + key)
#                 count_id += 1
#                 if 'aqlPath' in current:
#                     id_aql_map[key] = current['aqlPath']
#                     count_aql_path += 1
#                     print(str(count_aql_path) + ":" + current['aqlPath'])
#                     print(len(id_aql_map))
            
#             for value in current.values():
#                 stack.append(value)
        
#         elif isinstance(current, list):
#             for item in current:
#                 stack.append(item)
    
#     return id_aql_map, count_id, count_aql_path

# input_file = '/home/ishika/Projects/OpenEHR/EHRbase-project/web_template.json'
# output_file = 'output.json'  # Output file path
# with open(input_file, 'r') as f:
#     data = json.load(f)

# # Extract 'id' -> 'aqlPath' mappings iteratively
# id_aql_map, count_id, count_aql_path = extract_id_aql_paths(data)

# print(f"Count of 'id': {count_id}")
# print(f"Count of 'aqlPath': {count_aql_path}")

# # Write 'id' -> 'aqlPath' mappings to a JSON file
# with open(output_file, 'w', encoding='utf-8') as out_file:
#     json.dump(id_aql_map, out_file, indent=2)

# print(f'Extracted {len(id_aql_map)} id -> aqlPath mappings to {output_file}')




# import json

# def extract_id_aql_paths(data, id_aql_map):
# #     count = 0
#     count_id = 0
#     count_aql_path = 0
    
#     if isinstance(data, dict):
#         if 'id' in data:
#         #     count += 1
#             key = data['id']
#             count_id += 1
#         if 'aqlPath' in data:
#             id_aql_map[key] = data['aqlPath']
#             count_aql_path += 1
            
#         for value in data.values():
#             print(value)
#             print("\n")
#             count_id_rec, count_aql_path_rec = extract_id_aql_paths(value,id_aql_map)
#             count_id += count_id_rec
#             count_aql_path += count_aql_path_rec
#         #     if 'id' in value:
#         # #     count += 1
#         #         key = value['id']
#         #     if 'aqlPath' in value:
#                 # id_aql_map[key] = value['aqlPath']
                
#     elif isinstance(data, list):
#         for item in data:
#             if 'id' in item:
#         #     count += 1
#                 key = item['id']
#                 if 'aqlPath' in item:
#                         id_aql_map[key] = item['aqlPath']
        
#             count_id_rec, count_aql_path_rec =extract_id_aql_paths(item, id_aql_map)
#             count_id += count_id_rec
#             count_aql_path += count_aql_path_rec
#     return count_id, count_aql_path 


# input_file = '/home/ishika/Projects/OpenEHR/EHRbase-project/web_template.json'
# output_file = 'output.json'  # Output file path
# with open(input_file, 'r') as f:
#         data = json.load(f)
    
   
# # Initialize dictionary to store 'id' -> 'aqlPath' mappings
# id_aql_map = {}

# # Extract 'id' -> 'aqlPath' mappings recursively
# count_id, count_aql_path = extract_id_aql_paths(data, id_aql_map)
# print(f"Count of 'id': {count_id}")
# print(f"Count of 'aqlPath': {count_aql_path}")
# # Write 'id' -> 'aqlPath' mappings to a JSON file
# with open(output_file, 'w', encoding='utf-8') as out_file:
#     json.dump(id_aql_map, out_file, indent=2)

# print(f'Extracted {len(id_aql_map)} id -> aqlPath mappings to {output_file}')





# only giving 153 where actually its 654
# import json

# # Function to recursively find all 'id' and 'aqlPath' values
# def extract_id_aql_paths(obj, id_aql_map):
#     if isinstance(obj, dict):
#         if 'id' in obj and 'aqlPath' in obj:
#             id_aql_map[obj['id']] = obj['aqlPath']
#         for key, value in obj.items():
#             extract_id_aql_paths(value, id_aql_map)
#     elif isinstance(obj, list):
#         for item in obj:
#             extract_id_aql_paths(item, id_aql_map)

# # Read JSON file
# file_path = '/home/ishika/Projects/OpenEHR/EHRbase-project/web_template.json' # Replace with your actual file path
# output_file = 'id_aql_paths.json'  # Output file path

# with open(file_path, 'r', encoding='utf-8') as f:
#     data = json.load(f)

# # Initialize dictionary to store 'id' -> 'aqlPath' mappings
# id_aql_map = {}

# # Extract 'id' -> 'aqlPath' mappings recursively
# extract_id_aql_paths(data, id_aql_map)

# # Write 'id' -> 'aqlPath' mappings to a JSON file
# with open(output_file, 'w', encoding='utf-8') as out_file:
#     json.dump(id_aql_map, out_file, indent=2)

# print(f'Extracted {len(id_aql_map)} id -> aqlPath mappings to {output_file}')





# import json

# # Function to recursively find all 'aqlPath' values
# def find_aql_paths(obj, paths):
#     if isinstance(obj, dict):
#         if 'aqlPath' in obj:
#             paths.append(obj['aqlPath'])
#         for key, value in obj.items():
#             find_aql_paths(value, paths)
#     elif isinstance(obj, list):
#         for item in obj:
#             find_aql_paths(item, paths)

# # Read JSON file
# file_path = '/home/ishika/Projects/OpenEHR/EHRbase-project/web_template.json'  # Replace with your actual file path
# output_file = 'aql_paths.txt'  
# with open(file_path, 'r', encoding='utf-8') as f:
#     data = json.load(f)

# # Initialize list to store 'aqlPath' values
# aql_paths = []

# # Extract 'aqlPath' values recursively
# find_aql_paths(data, aql_paths)

# # Print all found 'aqlPath' values
# # for path in aql_paths:
# #     print(path)
# # Write 'aqlPath' values to a file
# with open(output_file, 'w', encoding='utf-8') as out_file:
#     for path in aql_paths:
#         out_file.write(path + '\n')

# print(f'Extracted {len(aql_paths)} aqlPath values to {output_file}')