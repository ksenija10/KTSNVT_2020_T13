from models.model import Model


class CategoryType(Model):

    def __init__(self, table_name, is_active, name, category_id):
        super(CategoryType, self).__init__(table_name, is_active)
        self.name = name
        self.category_id = category_id

    def generate_insert(self):
        return "insert into {} (name, category_id, is_active)\nvalues ('{}', {}, {});".format(self.table_name,
                                                                                              self.name,
                                                                                              self.category_id,
                                                                                              self.is_active)
