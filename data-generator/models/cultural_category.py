from models.model import Model


class CulturalCategory(Model):

    def __init__(self, table_name, is_active, name):
        super(CulturalCategory, self).__init__(table_name, is_active)
        self.name = name

    def generate_insert(self):
        return "insert into {} (name, is_active)\nvalues ('{}', {});".format(self.table_name, self.name,
                                                                             self.is_active)
