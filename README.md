# Lambda_Automation Through Terraform
Project to Demo Automation for Starting &amp; Stopping the Instances through Lambda, CloudWatch &amp; IAM

# For this setup, do the following:

1. Create a custom AWS Identity and Access Management (IAM) policy and execution role for your Lambda function.
* Refer IAM.tf file
* Create a Policy with Actions (aws_iam_policy):
  "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents" ]

  "Action": [
        "ec2:Start*",
        "ec2:Stop*"  ]
        
* Role Creation (aws_iam_role):
"Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
        
* Policy Attachment with Role (aws_iam_role_policy_attachment):

======================================================================================================================================

2.  Create Lambda functions that stop and start your EC2 instances.
*  Refer Lambda.tf
* aws_lambda_function for both StopEC2Instances & StartEC2Instances

* data "archive_file"

======================================================================================================================================

3.    #Create CloudWatch Events rules that trigger your function on a schedule. For example, you could create a rule to stop your EC2 instances at night, and another to start them again in the morning.
*  Refer CloudWatch.tf
* aws_cloudwatch_event_rule
* aws_cloudwatch_event_target
* aws_lambda_permission

======================================================================================================================================
