from models.generator import Generator
from models.comment import Comment
import random

NUMBER_OF_COMMENTS_PER_USER = 5


class CommentGenerator(Generator):

    def __init__(self, output_path, users, sites):
        super(CommentGenerator, self).__init__(output_path)
        self.users = users
        self.sites = sites

    def generate(self):
        comments_dictionary = {}
        output_text = ""
        counter = 3
        for user_id in self.users.keys():
            random_sites = random.sample(list(self.sites.keys()), NUMBER_OF_COMMENTS_PER_USER)
            for site in random_sites:
                if self.users[user_id].user_type == "AuthenticatedUser":
                    comment = Comment("comment", "true", "random comment", "true", user_id, site)
                    comments_dictionary[counter + 1] = comment
                    counter += 1
                    output_text += comment.generate_insert() + "\n\n"

        with open(self.output_path, "w", encoding="utf-8") as output_file:
            output_file.write(output_text)

        # print(output_text)
        return comments_dictionary, output_text
