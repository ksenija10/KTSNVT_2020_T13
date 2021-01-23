from models.model import Model


class News(Model):

    def __init__(self, table_name, is_active, information, date_time, site_id):
        super(News, self).__init__(table_name, is_active)
        self.information = information
        self.date_time = date_time
        self.site_id = site_id

    def generate_insert(self):
        return "insert into {} (information, date_time, site_id, is_active)\nvalues('{}', '{}', {}, {});"\
            .format(self.table_name, self.information, str(self.date_time), self.site_id, self.is_active)

    def __repr__(self):
        return "News about site: {}\n{}\n at {}".format(self.site_id, self.information, self.date_time)
