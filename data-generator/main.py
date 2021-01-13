from generators.user_generator import UserGenerator
from generators.cultural_category_generator import CulturalCategoryGenerator
from generators.category_type_generator import CategoryTypeGenerator
from generators.cultural_site_generator import CulturalSiteGenerator
from generators.comment_generator import CommentGenerator
from generators.news_generator import NewsGenerator
from generators.subscription_generator import SubscriptionGenerator
from generators.rating_generator import RatingGenerator
from generators.all_data_generator import AllDataGenerator
import time


def generate_users():
    user_generator = UserGenerator("./data/output/user_output.txt")
    print("Start generating users")
    start = time.time()
    users, output_text = user_generator.generate()
    end = time.time()
    print("Finished generating users")
    print("Finished in ", end - start, "s\n")
    return users, output_text


def generate_users_test():
    user_generator = UserGenerator("./data/output/user_output.txt")
    print("Start generating users")
    start = time.time()
    users, output_text = user_generator.generate_test()
    end = time.time()
    print("Finished generating users")
    print("Finished in ", end - start, "s\n")
    return users, output_text


def generate_categories():
    category_generator = CulturalCategoryGenerator("./data/output/category_output.txt")
    print("Start generating categories")
    start = time.time()
    categories, output_text = category_generator.generate()
    end = time.time()
    print("Finished generating categories")
    print("Finished in ", end - start, "s\n")
    return categories, output_text


def generate_types(categories):
    category_type_generator = CategoryTypeGenerator("./data/output/category_type_output.txt", categories)
    print("Start generating category types")
    start = time.time()
    types, output_text = category_type_generator.generate()
    end = time.time()
    print("Finished generating category types")
    print("Finished in ", end - start, "s\n")
    return types, output_text


def generate_cultural_sites(types):
    cultural_sites_generator = CulturalSiteGenerator("./data/output/cultural_site_output.txt", types)
    print("Start generating cultural sites")
    start = time.time()
    sites, output_text = cultural_sites_generator.generate()
    end = time.time()
    print("Finished generating cultural sites")
    print("Finished in ", end - start, "s\n")
    return sites, output_text


def generate_comments(users, sites):
    comment_generator = CommentGenerator("./data/output/comment_output.txt", users, sites)
    print("Start generating comments")
    start = time.time()
    comments, output_text = comment_generator.generate()
    end = time.time()
    print("Finished generating comments")
    print("Finished in ", end - start, "s\n")
    return comments, output_text


def generate_news(sites):
    news_generator = NewsGenerator("./data/output/news_output.txt", sites)
    print("Start generating news")
    start = time.time()
    news, output_text = news_generator.generate()
    end = time.time()
    print("Finished generating news")
    print("Finished in ", end - start, "s\n")
    return news, output_text


def generate_subscriptions(sites, users):
    subscription_generator = SubscriptionGenerator("./data/output/subscription_output.txt", sites, users)
    print("Start generating subscriptions")
    start = time.time()
    output_text = subscription_generator.generate()
    end = time.time()
    print("Finished generating subscriptions")
    print("Finished in ", end - start, "s\n")
    return output_text


def generate_ratings(users, sites):
    rating_generator = RatingGenerator("./data/output/rating_output.txt", users, sites)
    print("Start generating ratings")
    start = time.time()
    ratings, output_text = rating_generator.generate()
    end = time.time()
    print("Finished generating ratings")
    print("Finished in ", end - start, "s\n")
    return ratings, output_text


if __name__ == '__main__':
    print("***** Starting *****")
    start = time.time()
    category_dictionary, category_output_text = generate_categories()
    category_type_dictionary, category_type_output_text = generate_types(category_dictionary)
    cultural_site_dictionary, cultural_site_output_text = generate_cultural_sites(category_type_dictionary)
    user_dictionary, user_output_text = generate_users()
    comment_dictionary, comment_output_text = generate_comments(user_dictionary, cultural_site_dictionary)
    news_dictionary, news_output_text = generate_news(cultural_site_dictionary)
    subscription_output_text = generate_subscriptions(cultural_site_dictionary, user_dictionary)
    rating_dictionary, rating_output_text = generate_ratings(user_dictionary, cultural_site_dictionary)

    all_data_generator = AllDataGenerator("./data/output/ALL_DATA_OUTPUT.txt",
                                          categories=category_output_text,
                                          types=category_type_output_text,
                                          users=user_output_text,
                                          sites=cultural_site_output_text,
                                          comments=comment_output_text,
                                          news=news_output_text,
                                          subscriptions=subscription_output_text,
                                          ratings=rating_output_text)
    all_data_generator.generate()
    end = time.time()
    print("***** Finished in {}s *****".format(end - start))

