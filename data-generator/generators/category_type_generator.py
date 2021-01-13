from models.category_type import CategoryType
from models.generator import Generator


class CategoryTypeGenerator(Generator):

    def __init__(self, output_path, categories):
        super(CategoryTypeGenerator, self).__init__(output_path)
        self.institutions_path = "./data/institucije.txt"
        self.manifestations_path = "./data/manifestacije.txt"
        self.cultural_heritage_path = "./data/kulturna_nasledja.txt"
        self.category_dictionary = categories

    def generate(self):
        types_dictionary = {}
        output_text = ""
        for key in self.category_dictionary.keys():
            if key == 1:
                institutions, output_text = self.generate_institutions(key, output_text)
                types_dictionary[key] = institutions

            elif key == 2:
                manifestations, output_text = self.generate_manifestations(key, output_text)
                types_dictionary[key] = manifestations

            elif key == 3:
                heritage_sites, output_text = self.generate_cultural_heritage_sites(key, output_text)
                types_dictionary[key] = heritage_sites

        output_file = open(self.output_path, "w", encoding="utf-8")
        output_file.write(output_text)
        output_file.close()

        return types_dictionary

    def generate_institutions(self, category_id, output_text):
        input_file = open(self.institutions_path, 'r', encoding="utf-8")
        types = []
        institution_dictionary = {}
        line = input_file.readline()
        while line != "":
            types.append((line.rstrip("\n")))
            line = input_file.readline()
        input_file.close()

        for i in range(len(types)):
            category_type = CategoryType("category_type", "true", types[i], category_id)
            institution_dictionary[i + 1] = types[i]
            output_text += category_type.generate_insert() + "\n\n"

        return institution_dictionary, output_text

    def generate_manifestations(self, category_id, output_text):
        input_file = open(self.manifestations_path, 'r', encoding="utf-8")
        types = []
        manifestation_dictionary = {}
        line = input_file.readline()
        while line != "":
            types.append((line.rstrip("\n")))
            line = input_file.readline()
        input_file.close()

        for i in range(len(types)):
            category_type = CategoryType("category_type", "true", types[i], category_id)
            manifestation_dictionary[i + 1] = types[i]
            output_text += category_type.generate_insert() + "\n\n"

        return manifestation_dictionary, output_text

    def generate_cultural_heritage_sites(self, category_id, output_text):
        input_file = open(self.cultural_heritage_path, 'r', encoding="utf-8")
        types = []
        sites_dictionary = {}
        line = input_file.readline()
        while line != "":
            types.append((line.rstrip("\n")))
            line = input_file.readline()
        input_file.close()

        for i in range(len(types)):
            category_type = CategoryType("category_type", "true", types[i], category_id)
            sites_dictionary[i + 1] = types[i]
            output_text += category_type.generate_insert() + "\n\n"

        return sites_dictionary, output_text
