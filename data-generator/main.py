from generators.user_generator import UserGenerator
from generators.cultural_category_generator import CulturalCategoryGenerator
from generators.category_type_generator import CategoryTypeGenerator
from generators.cultural_site_generator import CulturalSiteGenerator
from generators.comment_generator import CommentGenerator
import time


def generate_users():
    user_generator = UserGenerator("./data/output/user_output.txt")
    print("Start generating users")
    start = time.time()
    users = user_generator.generate()
    end = time.time()
    print("Finished generating users")
    print(end - start, "\n")
    return users


def generate_users_test():
    user_generator = UserGenerator("./data/output/user_output.txt")
    print("Start generating users")
    start = time.time()
    users = user_generator.generate_test()
    end = time.time()
    print("Finished generating users")
    print(end - start, "\n")
    return users


def generate_categories():
    category_generator = CulturalCategoryGenerator("./data/output/category_output.txt")
    print("Start generating categories")
    start = time.time()
    categories = category_generator.generate()
    end = time.time()
    print("Finished generating categories")
    print(end - start, "\n")
    return categories


def generate_types(categories):
    category_type_generator = CategoryTypeGenerator("./data/output/category_type_output.txt", categories)
    print("Start generating category types")
    start = time.time()
    types = category_type_generator.generate()
    end = time.time()
    print("Finished generating category types")
    print(end - start, "\n")
    return types


def generate_cultural_sites(types):
    cultural_sites_generator = CulturalSiteGenerator("./data/output/cultural_site_output.txt", types)
    print("Start generating cultural sites")
    start = time.time()
    sites = cultural_sites_generator.generate()
    end = time.time()
    print("Finished generating cultural sites")
    print(end - start, "\n")
    return sites


def generate_comments(users, sites):
    comment_generator = CommentGenerator("./data/output/comment_output.txt", users, sites)
    print("Start generating comments")
    start = time.time()
    comments = comment_generator.generate()
    end = time.time()
    print("Finished generating comments")
    print(end - start, "\n")
    return comments


if __name__ == '__main__':
    category_dictionary = generate_categories()
    category_types_dictionary = generate_types(category_dictionary)
    cultural_sites_dictionary = generate_cultural_sites(category_types_dictionary)

    users_dictionary = generate_users_test()

    comment_dictionary = generate_comments(users_dictionary, cultural_sites_dictionary)
    print(len(comment_dictionary))
    print(comment_dictionary)
