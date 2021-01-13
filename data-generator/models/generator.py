from abc import ABC, abstractmethod


class Generator(ABC):

    def __init__(self, output_path):
        self.output_path = output_path

    @abstractmethod
    def generate(self):
        raise NotImplementedError
