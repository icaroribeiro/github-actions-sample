import logging

from aws_lambda_typing import context as context_
from aws_lambda_typing import events

from config.config import Config
from lambda_1_handler import Lambda1Handler

logger = logging.getLogger()


def lambda_handler(event: events.SQSEvent, context: context_.Context) -> None:
    try:
        config = Config()
        lambda_1_handler = Lambda1Handler(config)
        lambda_1_handler.say_hello()
    except Exception:
        raise
