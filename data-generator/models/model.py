from abc import ABC, abstractmethod


class Model(ABC):

    def __init__(self, table_name, is_active ):
        self.table_name = table_name
        self.is_active = is_active

    @abstractmethod
    def generate_insert(self):
        raise NotImplementedError
