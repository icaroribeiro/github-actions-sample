import pytest

from config.config import Config
from lambda_2_handler import Lambda2Handler


class TestLambda2Handler:
    @pytest.fixture(scope="class")
    def config(self) -> Config:
        return Config()

    @pytest.fixture(scope="class")
    def lambda_handler(self, config: Config) -> Lambda2Handler:
        return Lambda2Handler(config)


class TestSayHello(TestLambda2Handler):
    def test_say_hello(self, lambda_handler: Lambda2Handler) -> None:
        expected_result: str = "Hello World 2!"

        result = lambda_handler.say_hello()

        assert result == expected_result
