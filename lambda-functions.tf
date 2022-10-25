data "archive_file" "note-creation-archive" {
  source_file = "lambdas/note-creation.js"
  output_path = "lambdas/note-creation.zip"
  type        = "zip"
}

resource "aws_lambda_function" "note-creation" {
  environment {
    variables = {
      NOTES_TABLE = aws_dynamodb_table.tf_notes_table.name
    }
  }
  memory_size   = "128"
  timeout       = 10
  runtime       = "nodejs14.x"
  architectures = ["arm64"]
  handler       = "lambdas/note-creation.handler"
  function_name = "note-creation"
  role          = aws_iam_role.iam_for_lambda.arn
  filename      = "lambdas/note-creation.zip"
}

data "archive_file" "note-deletion-archive" {
  source_file = "lambdas/note-deletion.js"
  output_path = "lambdas/note-deletion.zip"
  type        = "zip"
}

resource "aws_lambda_function" "note-deletion" {
  environment {
    variables = {
      NOTES_TABLE = aws_dynamodb_table.tf_notes_table.name
    }
  }
  memory_size   = "128"
  timeout       = 10
  runtime       = "nodejs14.x"
  architectures = ["arm64"]
  handler       = "lambdas/note-deletion.handler"
  function_name = "note-deletion"
  role          = aws_iam_role.iam_for_lambda.arn
  filename      = "lambdas/note-deletion.zip"
}

data "archive_file" "note-getting-all-archive" {
  source_file = "lambdas/note-getting-all.js"
  output_path = "lambdas/note-getting-all.zip"
  type        = "zip"
}


resource "aws_lambda_function" "note-getting-all" {
  environment {
    variables = {
      NOTES_TABLE = aws_dynamodb_table.tf_notes_table.name
    }
  }
  memory_size   = "128"
  timeout       = 10
  runtime       = "nodejs14.x"
  architectures = ["arm64"]
  handler       = "lambdas/note-getting-all.handler"
  function_name = "note-getting-all"
  role          = aws_iam_role.iam_for_lambda.arn
  filename      = "lambdas/note-getting-all.zip"
}
