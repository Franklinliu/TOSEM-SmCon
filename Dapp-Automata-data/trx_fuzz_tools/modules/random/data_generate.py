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