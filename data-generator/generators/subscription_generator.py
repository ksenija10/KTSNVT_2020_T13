from models.generator import Generator
from models.subscription import Subscriptions
import random

NUMBER_OF_SUBSCRIPTIONS_PER_USER = 10


class SubscriptionGenerator(Generator):

    def __init__(self, output_path, sites, users):
        super(SubscriptionGenerator, self).__init__(output_path)
        self.sites = sites
        self.users = users

    def generate(self):
        output_text = ""
        for user_id in self.users.keys():
            random_sites = random.sample(list(self.sites.keys()), NUMBER_OF_SUBSCRIPTIONS_PER_USER)
            for site in random_sites:
                subscription = Subscriptions("sites_users", "true", site, user_id)
                output_text += subscription.generate_insert() + "\n\n"

        with open(self.output_path, "w", encoding="utf-8") as output_file:
            output_file.write(output_text)
