data "archive_file" "lambda_1_zip" {
  type        = "zip"
  source_dir  = "${path.module}/../lambdas/artifacts/lambda-1-artifact"
  output_path = "${path.module}/../lambdas/artifacts/lambda-1-artifact.zip"
}

resource "aws_lambda_function" "lambda_1" {
  function_name    = "lambda-1"
  source_code_hash = data.archive_file.lambda_1_zip.output_base64sha256
  handler          = "index.lambda_handler"
  runtime          = "python3.12"

  environment {
    variables = {
      REGION = var.region
    }
  }

  logging_config {
    log_format            = "JSON"
    application_log_level = "INFO"
    system_log_level      = "INFO"
  }
}
