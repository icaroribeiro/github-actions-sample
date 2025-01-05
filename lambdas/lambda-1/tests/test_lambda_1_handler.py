import pytest

from config.config import Config
from lambda_1_handler import Lambda1Handler


class TestLambda1Handler:
    @pytest.fixture(scope="class")
    def config(self) -> Config:
        return Config()

    @pytest.fixture(scope="class")
    def lambda_handler(self, config: Config) -> Lambda1Handler:
        return Lambda1Handler(config)


class TestSayHello(TestLambda1Handler):
    def test_say_hello(self, lambda_handler: Lambda1Handler) -> None:
        expected_result: str = "Hello World 2!"

        result = lambda_handler.say_hello()

        assert result == expected_result
