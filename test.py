from bson.binary import Binary

# Create a binary string of 16 bits (e.g., "0000000000000000")
binary_string = "0000000000000000"

# Convert the binary string to bytes
binary_bytes = int(binary_string, 2).to_bytes(2, 'big')

# Create a Binary object
binary_obj = Binary(binary_bytes)

# Insert the Binary object into a MongoDB document
document = {"binary_field": binary_obj}
#collection.insert_one(document)
print(document)
