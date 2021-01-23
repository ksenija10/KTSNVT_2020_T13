import bcrypt
from models.model import Model


class User(Model):
    def __init__(self, table_name, is_active, user_type, name, surname, password, birthday=None, activated=None):
        super(User, self).__init__(table_name, is_active)
        self.user_type = user_type
        self.name = name
        self.surname = surname
        self.email = self.generate_email()
        self.password = password
        self.activated = activated
        self.birthday = birthday

    def generate_insert(self):
        query = "--email = {} password = {} \n".format(self.email, self.password)
        if self.birthday is None:
            query += "insert into {} (type, name, surname, email, password, is_active, activated) \nvalues ('{}', " \
                     "'{}', '{}', '{}', '{}', {}, '{}');".format(self.table_name, self.user_type, self.name,
                                                                 self.surname, self.email, self.encode_password(),
                                                                 self.is_active, self.activated)
        else:
            query += "insert into {} (type, name, surname, email, password, is_active, birthday) \nvalues ('{}', " \
                     "'{}', '{}', '{}', '{}', {}, '{}');".format(self.table_name, self.user_type, self.name,
                                                                 self.surname, self.email, self.encode_password(),
                                                                 self.is_active, str(self.birthday))

        return query

    def generate_email(self):
        ascii_name = ""
        for char in self.name:
            ascii_name += from_utf8_to_ascii(char)
        ascii_surname = ""
        for char in self.surname:
            ascii_surname += from_utf8_to_ascii(char)

        email = ascii_name + "." + ascii_surname + "@email.com"
        return email.lower()

    def encode_password(self):
        salt = bcrypt.gensalt()
        return bcrypt.hashpw(self.password.encode("utf-8"), salt).decode("utf-8")

    def __repr__(self):
        return "{} {} {}".format(self.user_type, self.name, self.surname)


def from_utf8_to_ascii(char):
    if char == "Ć":
        return "C"
    elif char == "ć":
        return "c"
    elif char == "Č":
        return "C"
    elif char == "č":
        return "c"
    elif char == "Š":
        return "S"
    elif char == "š":
        return "s"
    elif char == "Ž":
        return "Z"
    elif char == "ž":
        return "z"
    elif char == "Đ":
        return "Dj"
    elif char == "đ":
        return "dj"
    else:
        return char
