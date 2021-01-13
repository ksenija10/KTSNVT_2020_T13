from models.cultural_category import CulturalCategory
from models.generator import Generator


class CulturalCategoryGenerator(Generator):

    def __init__(self, output_path):
        super(CulturalCategoryGenerator, self).__init__(output_path)
        self.data_path = "./data/kategorije.txt"

    def generate(self):
        input_file = open(self.data_path, 'r', encoding="utf-8")
        categories = []
        category_dictionary = {}
        line = input_file.readline()
        while line != "":
            categories.append((line.rstrip("\n")))
            line = input_file.readline()
        input_file.close()

        output_text = ""
        for i in range(len(categories)):
            cultural_category = CulturalCategory("cultural_category", "true", categories[i])
            category_dictionary[i+1] = categories[i]
            output_text += cultural_category.generate_insert() + "\n\n"

        output_file = open(self.output_path, "w", encoding="utf-8")
        output_file.write(output_text)
        output_file.close()
        return category_dictionary, output_text
