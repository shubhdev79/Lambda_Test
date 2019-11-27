data "archive_file" "lambda_zip_1" {
    type          = "zip"
    source_file   = "StartInstance.py"
    output_path   = "lambda_function_1.zip"
}

resource "aws_lambda_function" "test_lambda_1" {
  filename         = "lambda_function_1.zip"
  function_name    = "StartInstances"
  role             = "${aws_iam_role.test_role.arn}"
  handler          = "StartInstance.lambda_handler"
  source_code_hash = "${data.archive_file.lambda_zip_1.output_base64sha256}"
  runtime          = "python3.8"
}