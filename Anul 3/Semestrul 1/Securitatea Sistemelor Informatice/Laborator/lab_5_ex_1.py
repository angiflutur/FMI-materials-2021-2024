import hashlib

# Given hash values
given_hashes = [
    "602a4a8fff652291fdc0e049e3900dae608af64e5e4d2c5d4332603c9938171d",
    "f40e838809ddaa770428a4b2adc1fff0c38a84abe496940d534af1232c2467d5",
    "aa105295e25e11c8c42e4393c008428d965d42c6cb1b906e30be99f94f473bb5",
    "70f87d0b880efcdbe159011126db397a1231966991ae9252b278623aeb9c0450",
    "77a39d581d3d469084686c90ba08a5fb6ce621a552155730019f6c02cb4c0cb6",
    "456ae6a020aa2d54c0c00a71d63033f6c7ca6cbc1424507668cf54b80325dc01",
    "bd0fd461d87fba0d5e61bed6a399acdfc92b12769f9b3178f9752e30f1aeb81d",
    "372df01b994c2b14969592fd2e78d27e7ee472a07c7ac3dfdf41d345b2f8e305"
]

# Function to generate hash for a given header
def calculate_hash(header):
    concatenated_header = ' '.join(header)
    hashed_value = hashlib.sha256(concatenated_header.encode()).hexdigest()
    return hashed_value

# Given header information
header_lines = ["P6", "X Y", "255"]

# Possible values for X and Y (adjust the ranges based on your requirements)
possible_X_values = range(350, 700)
possible_Y_values = range(350, 700)

# Iterate through possible headers, calculate hash, and check for a match
for X in possible_X_values:
    for Y in possible_Y_values:
        header = [header_lines[0], f"{X} {Y}", header_lines[2]]
        calculated_hash = calculate_hash(header)

        if calculated_hash in given_hashes:
            print(f"Match found for hash {calculated_hash} with header {header}")
