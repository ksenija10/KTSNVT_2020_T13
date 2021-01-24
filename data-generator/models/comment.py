from models.model import Model


class Comment(Model):

    def __init__(self, table_name, is_active, text, approved, user_id, site_id):
        super(Comment, self).__init__(table_name, is_active)
        self.text = text
        self.approved = approved
        self.user_id = user_id
        self.site_id = site_id

    def generate_insert(self):
        return "insert into {} (text, approved, user_id, site_id, is_active)\nvalues ('{}', {}, {}, {}, {});"\
            .format(self.table_name, self.text, self.approved, self.user_id, self.site_id, self.is_active)

    def __repr__(self):
        return "User {} comments {} on {}".format(self.user_id, self.text, self.site_id)
