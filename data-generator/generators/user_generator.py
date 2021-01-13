from models.user import User
from models.generator import Generator
import random
import datetime


class UserGenerator(Generator):
    def __init__(self, output_path):
        super(UserGenerator, self).__init__(output_path)
        self.data_path = "./data/imena.txt"

    def generate(self):
        with open(self.data_path, 'r', encoding="utf-8") as input_file:
            people = []
            line = input_file.readline()
            while line != "":
                people.append((line.split(" ")[0], line.split(" ")[1].rstrip("\n")))
                line = input_file.readline()

        users_dictionary = {}
        output_text = ""
        for i in range(50):
            admin = User("users", "true", "Admin", people[i][0], people[i][1], str(random.randint(1000, 9999)),
                         generate_date())
            users_dictionary[i + 1 + 6] = admin
            output_text += admin.generate_insert() + "\n" + generate_authority(7 + i, 1) + "\n\n"
        for i in range(50, len(people)):
            user = User("users", "true", "AuthenticatedUser", people[i][0], people[i][1],
                        str(random.randint(1000, 9999)),
                        None, "true")
            users_dictionary[i + 1 + 6] = user
            output_text += user.generate_insert() + "\n" + generate_authority(7 + i, 2) + "\n\n"

        with open(self.output_path, "w", encoding="utf-8") as output_file:
            output_file.write(output_text)

        return users_dictionary, output_text

    def generate_test(self):
        with open(self.data_path, 'r', encoding="utf-8") as input_file:
            people = []
            line = input_file.readline()
            while line != "":
                people.append((line.split(" ")[0], line.split(" ")[1].rstrip("\n")))
                line = input_file.readline()

        users_dictionary = {}
        output_text = ""
        for i in range(5):
            admin = User("users", "true", "Admin", people[i][0], people[i][1], str(random.randint(1000, 9999)),
                         generate_date())
            users_dictionary[i + 1 + 6] = admin
            output_text += admin.generate_insert() + "\n" + generate_authority(7 + i, 1) + "\n\n"
        for i in range(5, 25):
            user = User("users", "true", "AuthenticatedUser", people[i][0], people[i][1],
                        str(random.randint(1000, 9999)),
                        None, "true")
            users_dictionary[i + 1 + 6] = user
            output_text += user.generate_insert() + "\n" + generate_authority(7 + i, 2) + "\n\n"
        # print(output_text)
        return users_dictionary, output_text


def generate_authority(user_id, authority_id):
    return "insert into user_authority (user_id, authority_id) values ({}, {});".format(user_id, authority_id)


def generate_date():
    year = random.randint(1900, 2000)
    month = random.randint(1, 12)
    day = random.randint(1, 28)
    return datetime.date(year, month, day)
