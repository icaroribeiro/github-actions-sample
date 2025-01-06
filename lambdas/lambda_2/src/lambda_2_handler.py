from config.config import Config


class Lambda2Handler:
    def __init__(self, config: Config) -> None:
        self.__config = config

    def say_hello(self) -> str:
        return "Hello World 2!"
