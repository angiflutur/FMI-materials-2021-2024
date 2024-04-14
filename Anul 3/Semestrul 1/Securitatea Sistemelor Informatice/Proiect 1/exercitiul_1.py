import hashlib

def generare_headere(hash_values):
    headere = {}
    for x in range(400, 1000):
        for y in range(400, 1000):
            header = f"P6 {x} {y} 255"
            hash_header = hashlib.sha256(header.encode()).hexdigest()
            if hash_header in hash_values:
                headere[hash_header] = header

    for hash, header in headere.items():
        print(hash," : ", header)

hash_values = [
    "602a4a8fff652291fdc0e049e3900dae608af64e5e4d2c5d4332603c9938171d",
    "f40e838809ddaa770428a4b2adc1fff0c38a84abe496940d534af1232c2467d5",
    "aa105295e25e11c8c42e4393c008428d965d42c6cb1b906e30be99f94f473bb5",
    "70f87d0b880efcdbe159011126db397a1231966991ae9252b278623aeb9c0450",
    "77a39d581d3d469084686c90ba08a5fb6ce621a552155730019f6c02cb4c0cb6",
    "456ae6a020aa2d54c0c00a71d63033f6c7ca6cbc1424507668cf54b80325dc01",
    "bd0fd461d87fba0d5e61bed6a399acdfc92b12769f9b3178f9752e30f1aeb81d",
    "372df01b994c2b14969592fd2e78d27e7ee472a07c7ac3dfdf41d345b2f8e305"]

generare_headere(hash_values)