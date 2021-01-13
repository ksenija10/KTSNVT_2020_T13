from generators.user_generator import UserGenerator
from generators.cultural_category_generator import CulturalCategoryGenerator
from models.cultural_site import CulturalSite
from models.category_type import CategoryType

import time


def generate_users():
    user_generator = UserGenerator("./data/output/user_output.txt")
    print("Start generating users")
    start = time.time()
    user_generator.generate()
    end = time.time()
    print("Finished generating users")
    print(end - start)


def generate_categories():
    category_generator = CulturalCategoryGenerator("./data/output/category_output.txt")
    print("Start generating categories")
    start = time.time()
    category_dictionary = category_generator.generate()
    end = time.time()
    print("Finished generating categories")
    print(end - start)


if __name__ == '__main__':

    generate_categories()
