from models.model import Model


class Rating(Model):

    def __init__(self, table_name, is_active, value, user_id, site_id):
        super(Rating, self).__init__(table_name, is_active)
        self.value = value
        self.user_id = user_id
        self.site_id = site_id

    def generate_insert(self):
        return "insert into {} (value, user_id, site_id, is_active) values ({}, {}, {}, {});" \
            .format(self.table_name, self.value, self.user_id, self.site_id, self.is_active)

    def __repr__(self):
        return "Site: {} rated with {} by {}".format(self.site_id, self.value, self.user_id)
