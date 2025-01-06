import logging

from aws_lambda_typing import context as context_
from aws_lambda_typing import events

from config.config import Config
from lambda_2_handler import Lambda2Handler

logger = logging.getLogger()


def lambda_handler(event: events.SQSEvent, context: context_.Context) -> None:
    try:
        config = Config()
        lambda_2_handler = Lambda2Handler(config)
        lambda_2_handler.say_hello()
    except Exception:
        raise
