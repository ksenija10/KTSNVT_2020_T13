from models.generator import Generator
from models.rating import Rating
import random

NUMBER_OF_RATINGS_PER_USER = 5


class RatingGenerator(Generator):

    def __init__(self, output_path, users, sites):
        super(RatingGenerator, self).__init__(output_path)
        self.users = users
        self.sites = sites

    def generate(self):
        rating_dictionary = {}
        output_text = ""
        counter = 1
        for user_id in self.users.keys():
            random_sites = random.sample(list(self.sites.keys()), NUMBER_OF_RATINGS_PER_USER)
            for site in random_sites:
                if self.users[user_id].user_type == "AuthenticatedUser":
                    rating = Rating("rating", "true", random.randint(3, 5), user_id, site)
                    rating_dictionary[counter + 1] = rating
                    counter += 1
                    output_text += rating.generate_insert() + "\n\n"

        with open(self.output_path, "w", encoding="utf-8") as output_file:
            output_file.write(output_text)

        return rating_dictionary, output_text
