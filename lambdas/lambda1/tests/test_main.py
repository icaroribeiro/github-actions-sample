from services.greetings import say_hello


def test_say_hello() -> None:
    expected_result: str = "Hello, Github Actions 2"

    result = say_hello()

    assert result == expected_result
