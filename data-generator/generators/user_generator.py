from models.user import User
from models.generator import Generator
import random
import datetime


class UserGenerator(Generator):
    def __init__(self, output_path):
        super(UserGenerator, self).__init__(output_path)
        self.data_path = "./data/imena.txt"

    def generate(self):
        input_file = open(self.data_path, 'r', encoding="utf-8")
        people = []
        line = input_file.readline()
        while line != "":
            people.append((line.split(" ")[0], line.split(" ")[1].rstrip("\n")))
            line = input_file.readline()
        input_file.close()

        output_text = ""
        for i in range(50):
            admin = User("users", "true", "Admin", people[i][0], people[i][1], str(random.randint(1000, 9999)),
                         generate_date())
            output_text += admin.generate_insert() + "\n" + generate_authority(7 + i, 1) + "\n\n"
        for i in range(50, len(people)):
            user = User("users", "true", "AuthenticatedUser", people[i][0], people[i][1],
                        str(random.randint(1000, 9999)),
                        None, "true")
            output_text += user.generate_insert() + "\n" + generate_authority(7 + i, 2) + "\n\n"

        output_file = open(self.output_path, "w", encoding="utf-8")
        output_file.write(output_text)
        output_file.close()


def generate_authority(user_id, authority_id):
    return "insert into user_authority (user_id, authority_id) values ({}, {});".format(user_id, authority_id)


def generate_date():
    year = random.randint(1900, 2000)
    month = random.randint(1, 12)
    day = random.randint(1, 28)
    return datetime.date(year, month, day)
