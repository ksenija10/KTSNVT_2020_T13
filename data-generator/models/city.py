class City:
    def __init__(self, name, lat, lng):
        self.name = name
        self.lat = lat
        self.lng = lng

    def __repr__(self):
        return "{} lat: {}, lng: {}".format(self.name, self.lat, self.lng)
