from models.generator import Generator
import datetime


def load_legacy_data():
    with open("./data/legacy_part1.txt", 'r', encoding="utf-8") as file:
        part_1_data = file.read()

    with open("./data/legacy_part2.txt", 'r', encoding="utf-8") as file:
        part_2_data = file.read()

    return part_1_data, part_2_data


class AllDataGenerator(Generator):

    def __init__(self, output_path, **kwargs):
        super(AllDataGenerator, self).__init__(output_path)
        self.legacy_part_1, self.legacy_part_2 = load_legacy_data()
        self.category_output = kwargs['categories']
        self.type_output = kwargs['types']
        self.user_output = kwargs['users']
        self.cultural_site_output = kwargs['sites']
        self.comment_output = kwargs['comments']
        self.news_output = kwargs['news']
        self.subscription_output = kwargs['subscriptions']
        self.rating_output = kwargs['ratings']

    def generate(self):
        output = "-- generated: {}\n".format(str(datetime.datetime.now()))
        output += self.legacy_part_1 + "\n\n"
        output += self.category_output
        output += self.type_output + "\n"
        output += self.legacy_part_2 + "\n\n"
        output += self.user_output
        output += self.cultural_site_output
        output += self.comment_output
        output += self.news_output
        output += self.subscription_output
        output += self.rating_output

        with open(self.output_path, "w", encoding="utf-8") as output_file:
            output_file.write(output)
