from hashlib import sha1

base = "asgkajfkde"
rand_hashes = {sha1((base + str(i)).encode()). hexdigest() for i in range(10)}

base = "ksjhjakfoe"
collisionFound = False

for i in range(10000000):
    if sha1((base + str(i)).encode()).hexdigest() in rand_hashes:
        print("Collision")
        collisionFound = True

if not collisionFound:
    print("No collision found!")
