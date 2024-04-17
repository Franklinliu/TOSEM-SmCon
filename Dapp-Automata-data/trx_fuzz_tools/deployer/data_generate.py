import random
import string

def generate_random_string(length):
    characters = string.ascii_letters + string.digits  # 包括字母和数字
    random_string = ''.join(random.choice(characters) for _ in range(length))
    return random_string

# generate number (n,m)
def generate_random_number(n,m):
    random_number = random.randint(n, m)
    return random_number


def generate_random_bit():
    return random.choice([0, 1])


def generate_random_vector():
    a = [0] * 12
    a[0] = generate_random_number(1,100)
    a[1] = generate_random_number(1,100)
    a[2] = generate_random_number(1,100)
    a[3] = generate_random_number(1,100)
    a[4] = generate_random_number(1,100)
    a[5] = generate_random_number(1,100)
    a[6] = generate_random_number(1,100)
    a[7] = generate_random_number(1,100)
    a[8] = generate_random_number(1,100)
    a[9] = generate_random_number(1,100)
    a[10] = generate_random_number(1,100)
    a[11] = generate_random_number(1,100)
    return a