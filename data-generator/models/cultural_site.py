from models.model import Model


class CulturalSite(Model):

    def __init__(self, table_name, is_active, name, lat, lng, address, city, description, rating, type_id, category_id):
        super(CulturalSite, self).__init__(table_name, is_active)
        self.name = name
        self.lat = lat
        self.lng = lng
        self.address = address
        self.city = city
        self.description = description
        self.rating = rating
        self.type_id = type_id
        self.category_id = category_id

    def generate_insert(self):
        return "insert into {} (name, lat, lng, address, city, description, rating, type_id, category_id, is_active)" \
               "\nvalues ('{}', {}, {}, '{}', '{}', \n'{}', {}, {}, {}, {});".format(self.table_name,
                                                                                     self.name,
                                                                                     self.lat,
                                                                                     self.lng,
                                                                                     self.address,
                                                                                     self.city,
                                                                                     self.description,
                                                                                     self.rating,
                                                                                     self.type_id,
                                                                                     self.category_id,
                                                                                     self.is_active)
