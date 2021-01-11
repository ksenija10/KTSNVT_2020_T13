from models.user import User
import bcrypt
import random
import datetime


class UserGenerator:
    def __init__(self, data_path, output_path):
        self.data_path = data_path
        self.output_path = output_path

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
            admin = User("users", "Admin", people[i][0], people[i][1], str(random.randint(1000, 9999)),
                         "true", generate_date())
            output_text += admin.generate_insert()+"\n\n"
        for i in range(50, len(people)):
            user = User("users", "AuthenticatedUser", people[i][0], people[i][1], str(random.randint(1000, 9999)),
                        "true", None, "true")
            output_text += user.generate_insert()+"\n\n"

        output_file = open(self.output_path, "w", encoding="utf-8")
        output_file.write(output_text)
        output_file.close()


def generate_date():
    year = random.randint(1900, 2000)
    month = random.randint(1, 12)
    day = random.randint(1, 28)
    return datetime.date(year, month, day)