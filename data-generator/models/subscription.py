from models.model import Model


class Subscriptions(Model):

    def __init__(self, table_name, is_active, site_id, user_id):
        super(Subscriptions, self).__init__(table_name, is_active)
        self.site_id = site_id
        self.user_id = user_id

    def generate_insert(self):
        return "insert into {} (site_id, user_id) values ({}, {});".format(self.table_name, self.site_id, self.user_id)
