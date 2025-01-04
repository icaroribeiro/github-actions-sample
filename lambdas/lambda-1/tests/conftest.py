import os

import pytest


@pytest.fixture(scope="session")
def setup_aws_credentials() -> None:
    os.environ["AWS_ACCESS_KEY_ID"] = "testing"
    os.environ["AWS_SECRET_ACCESS_KEY"] = "testing"
    os.environ["AWS_SECURITY_TOKEN"] = "testing"
    os.environ["AWS_SESSION_TOKEN"] = "testing"


@pytest.fixture(scope="session", autouse=True)
def setup_env_vars() -> None:
    os.environ["REGION"] = "sa-east-1"
