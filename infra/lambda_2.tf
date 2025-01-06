data "archive_file" "aws_lambda_2_zip" {
  type        = "zip"
  source_dir  = "${path.module}/../lambdas/artifacts/lambda_2_code_distribution_artifact"
  output_path = "${path.module}/../lambdas/artifacts/lambda_2_code_distribution_artifact.zip"
}

resource "aws_lambda_function" "aws_lambda_2" {
  function_name    = "aws_lambda_2"
  source_code_hash = data.archive_file.aws_lambda_2_zip.output_base64sha256
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
