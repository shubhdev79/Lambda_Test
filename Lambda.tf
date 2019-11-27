data "archive_file" "lambda_zip" {
    type          = "zip"
    source_file   = "StopInstance.py"
    output_path   = "lambda_function.zip"
}

resource "aws_lambda_function" "test_lambda" {
  filename         = "lambda_function.zip"
  function_name    = "StopEC2Instances"
  role             = "${aws_iam_role.test_role.arn}"
  handler          = "StopInstance.lambda_handler"
  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
  runtime          = "python3.8"
}