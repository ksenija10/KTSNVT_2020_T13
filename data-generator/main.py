from generators.user_generator import UserGenerator
from generators.cultural_category_generator import CulturalCategoryGenerator
from generators.category_type_generator import CategoryTypeGenerator
from generators.cultural_site_generator import CulturalSiteGenerator
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
    categories = category_generator.generate()
    end = time.time()
    print("Finished generating categories")
    print(end - start)
    return categories


def generate_types(categories):
    category_type_generator = CategoryTypeGenerator("./data/output/category_type_output.txt", categories)
    print("Start generating category types")
    start = time.time()
    types = category_type_generator.generate()
    end = time.time()
    print("Finished generating category types")
    print(end - start)
    return types


def generate_cultural_sites(types):
    cultural_sites_generator = CulturalSiteGenerator("./data/output/cultural_site_output.txt", types)
    print("Start generating category types")
    start = time.time()
    sites = cultural_sites_generator.generate()
    end = time.time()
    print("Finished generating category types")
    print(end - start)
    return sites


if __name__ == '__main__':
    category_dictionary = generate_categories()
    category_types_dictionary = generate_types(category_dictionary)
    cultural_sites_dictionary = generate_cultural_sites(category_types_dictionary)
