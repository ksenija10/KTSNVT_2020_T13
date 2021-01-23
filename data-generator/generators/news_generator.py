from models.generator import Generator
from models.news import News
import random
import datetime

NUMBER_OF_NEWS_PER_SITE = 10


class NewsGenerator(Generator):

    def __init__(self, output_path, sites):
        super(NewsGenerator, self).__init__(output_path)
        self.sites = sites

    def generate(self):
        news_dictionary = {}
        output_text = ""
        counter = 3
        for site_id in self.sites.keys():
            for i in range(NUMBER_OF_NEWS_PER_SITE):
                news = News("news", "true", "random information", generate_date_time(), site_id)
                news_dictionary[counter + 1] = news
                counter += 1
                output_text += news.generate_insert() + "\n\n"

        with open(self.output_path, "w", encoding="utf-8") as output_file:
            output_file.write(output_text)

        return news_dictionary, output_text


def generate_date_time():
    year = random.randint(2018, 2020)
    month = random.randint(1, 12)
    day = random.randint(1, 28)
    hour = random.randint(8, 22)
    minute = random.choice([0, 30])
    return datetime.datetime(year, month, day, hour, minute, 0, 0)
