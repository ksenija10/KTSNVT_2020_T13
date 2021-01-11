from generators.user_generator import UserGenerator
import time


if __name__ == '__main__':
    user_generator = UserGenerator("./data/names.txt", "./data/user_output.txt")
    print("Start generating users")
    start = time.time()
    user_generator.generate()
    end = time.time()
    print("Finished generating users")
    print(end - start)

