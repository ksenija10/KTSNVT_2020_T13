from models.generator import Generator
from models.cultural_site import CulturalSite
from models.city import City
import json
import random


def load_cities():
    cities = {}
    with open("./data/gradovi.json", encoding="utf-8") as file:
        data = json.load(file)

        for item in data:
            city = City(item['city'], item['lat'], item['lng'])
            cities[item['city']] = city

    return cities


def load_names():
    people = []
    with open("./data/imena_znamenitih.txt", encoding="utf-8") as file:
        line = file.readline()
        while line != "":
            people.append(line.rstrip("\n"))
            line = file.readline()
    return people


def load_saints():
    saints = []
    with open("./data/imena_svetaca.txt", encoding="utf-8") as file:
        line = file.readline()
        while line != "":
            saints.append(line.rstrip("\n"))
            line = file.readline()
    return saints


def load_archaeological_sites():
    sites = []
    with open("./data/arheoloska_nalazista.txt", encoding="utf-8") as file:
        line = file.readline()
        while line != "":
            sites.append((line.split(",")[0], line.rstrip("\n").split(",")[1]))
            line = file.readline()
    return sites


NUMBER_OF_MANIFESTATIONS = 40
NUMBER_OF_INSTITUTIONS = 100
NUMBER_OF_HERITAGES = 60


class CulturalSiteGenerator(Generator):

    def __init__(self, output_path, types):
        super(CulturalSiteGenerator, self).__init__(output_path)
        self.category_type_dictionary = types
        self.cities = load_cities()
        self.names = load_names()
        self.saints = load_saints()
        self.archaeological_sites = load_archaeological_sites()
        self.name_generator = NameGenerator(self.cities.keys(), self.names, self.saints)

    def generate(self):
        sites_dictionary = {}
        output_text = ""
        counter = 7
        for category_id in self.category_type_dictionary.keys():
            for type_id in self.category_type_dictionary[category_id].keys():
                if category_id == 1:
                    for i in range(NUMBER_OF_INSTITUTIONS):
                        city = random.choice(list(self.cities.values()))
                        institution = CulturalSite("cultural_site", "true",
                                                   "{} {}".format(self.category_type_dictionary[category_id][type_id],
                                                                  self.name_generator.generate_any(city.name)),
                                                   city.lat, city.lng, self.name_generator.generate_street(), city.name,
                                                   "", random.randint(2, 4) + random.randint(0, 9) / 10, type_id,
                                                   category_id)
                        sites_dictionary[counter + 1] = institution
                        counter += 1
                        output_text += institution.generate_insert() + "\n\n"

                elif category_id == 2:
                    if type_id == 2 or type_id == 4 or type_id == 5:
                        for i in range(NUMBER_OF_MANIFESTATIONS):
                            city = random.choice(list(self.cities.values()))
                            manifestation = CulturalSite("cultural_site", "true",
                                                         "{} {}".format(self.category_type_dictionary[category_id][type_id],
                                                                        city.name),
                                                         city.lat, city.lng, self.name_generator.generate_street(),
                                                         city.name,
                                                         "", random.randint(2, 4) + random.randint(0, 9) / 10, type_id,
                                                         category_id)
                            sites_dictionary[counter + 1] = manifestation
                            counter += 1
                            output_text += manifestation.generate_insert() + "\n\n"
                    elif type_id == 3:
                        for i in range(NUMBER_OF_MANIFESTATIONS):
                            city = random.choice(list(self.cities.values()))
                            manifestation = CulturalSite("cultural_site", "true",
                                                         "{} {}".format(self.category_type_dictionary[category_id][type_id],
                                                                        self.name_generator.generate_only_person()),
                                                         city.lat, city.lng, self.name_generator.generate_street(),
                                                         city.name,
                                                         "", random.randint(2, 4) + random.randint(0, 9) / 10, type_id,
                                                         category_id)
                            sites_dictionary[counter + 1] = manifestation
                            counter += 1
                            output_text += manifestation.generate_insert() + "\n\n"
                    else:
                        for i in range(NUMBER_OF_MANIFESTATIONS):
                            city = random.choice(list(self.cities.values()))
                            manifestation = CulturalSite("cultural_site", "true",
                                                         "{} {}".format(self.category_type_dictionary[category_id][type_id],
                                                                        self.name_generator.generate_any(city)),
                                                         city.lat, city.lng, self.name_generator.generate_street(),
                                                         city.name,
                                                         "", random.randint(2, 4) + random.randint(0, 9) / 10, type_id,
                                                         category_id)
                            sites_dictionary[counter + 1] = manifestation
                            counter += 1
                            output_text += manifestation.generate_insert() + "\n\n"

                elif category_id == 3:
                    if type_id == 1:
                        for i in range(NUMBER_OF_HERITAGES):
                            city = random.choice(list(self.cities.values()))
                            heritage = CulturalSite("cultural_site", "true",
                                                    "{} {}".format(self.category_type_dictionary[category_id][type_id],
                                                                   city.name),
                                                    city.lat, city.lng, self.name_generator.generate_street(),
                                                    city.name,
                                                    "", random.randint(2, 4) + random.randint(0, 9) / 10, type_id,
                                                    category_id)
                            sites_dictionary[counter + 1] = heritage
                            counter += 1
                            output_text += heritage.generate_insert() + "\n\n"

                    elif type_id == 2:
                        for i in range(NUMBER_OF_HERITAGES):
                            city = random.choice(list(self.cities.values()))
                            heritage = CulturalSite("cultural_site", "true",
                                                    "{} {}".format(self.category_type_dictionary[category_id][type_id],
                                                                   self.name_generator.generate_only_person()),
                                                    city.lat, city.lng, self.name_generator.generate_street(),
                                                    city.name,
                                                    "", random.randint(2, 4) + random.randint(0, 9) / 10, type_id,
                                                    category_id)
                            sites_dictionary[counter + 1] = heritage
                            counter += 1
                            output_text += heritage.generate_insert() + "\n\n"

                    elif type_id == 3:
                        for i in range(NUMBER_OF_HERITAGES):
                            city = random.choice(list(self.cities.values()))
                            heritage = CulturalSite("cultural_site", "true",
                                                    "{} {}".format(self.category_type_dictionary[category_id][type_id],
                                                                   self.name_generator.generate_saint()),
                                                    city.lat, city.lng, self.name_generator.generate_street(),
                                                    city.name,
                                                    "", random.randint(2, 4) + random.randint(0, 9) / 10, type_id,
                                                    category_id)
                            sites_dictionary[counter + 1] = heritage
                            counter += 1
                            output_text += heritage.generate_insert() + "\n\n"

                    elif type_id == 4:
                        for item in self.archaeological_sites:
                            city = self.cities[item[1]]
                            site = CulturalSite("cultural_site", "true", item[0], city.lat, city.lng,
                                                self.name_generator.generate_street(), city.name,
                                                "", random.randint(2, 4) + random.randint(0, 9) / 10,
                                                type_id, category_id)
                            sites_dictionary[counter + 1] = site
                            counter += 1
                            output_text += site.generate_insert() + "\n\n"

        output_file = open(self.output_path, "w", encoding="utf-8")
        output_file.write(output_text)
        output_file.close()

        return sites_dictionary, output_text


class NameGenerator:
    def __init__(self, cities, names, saints):
        self.cities = cities
        self.names = names
        self.saints = saints
        self.all = []
        self.all.extend(self.cities)
        self.all.extend(self.names)
        random.shuffle(self.all)

    def generate_only_city(self):
        return random.choice(self.cities)

    def generate_only_person(self):
        return random.choice(self.names)

    def generate_saint(self):
        return "Sv. {}".format(random.choice(self.saints))

    def generate_any(self, city):
        if random.randint(0, 100) > 50:
            return random.choice(self.names)
        else:
            return city

    def generate_street(self):
        return "Ulica {} {}".format(random.choice(self.names), random.randint(1, 120))
