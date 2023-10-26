
resource "aws_iam_policy" "iam_pol" {
  description = "EC2 IAM policy"
  name        = "ssm-pol"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "ec2:*",
        "Effect" : "Allow",
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "elasticloadbalancing:*",
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "cloudwatch:*",
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "autoscaling:*",
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "iam:CreateServiceLinkedRole",
        "Resource" : "*",
        "Condition" : {
          "StringEquals" : {
            "iam:AWSServiceName" : [
              "autoscaling.amazonaws.com",
              "ec2scheduled.amazonaws.com",
              "elasticloadbalancing.amazonaws.com",
              "spot.amazonaws.com",
              "spotfleet.amazonaws.com",
              "transitgateway.amazonaws.com"
            ]
          }
        }
      }
    ]
  })
}



/*
resource "aws_iam_policy" "iam_pol" {
  name        = "ssm-pol"
  description = "EC2 IAM policy"
  
  # Define the policy document
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::example-bucket"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": "arn:aws:s3:::example-bucket/*"
    }
    # Add more permissions as needed
  ]
}
EOF
} 

/* data "aws_iam_policy_document" "ec2" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
*/



# Create an IAM role
resource "aws_iam_role" "ec2_role" {
  name = "ec2-assume-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ]
}
EOF
}

# Create an IAM instance profile
resource "aws_iam_instance_profile" "session_manager" {
  name = "ec2-session-manager"
  role = aws_iam_role.ec2_role.name
}

# Attach the IAM policy to the IAM role
resource "aws_iam_policy_attachment" "ec2_pol_att" {
  name = "ec2-iam-pol-attach"
  policy_arn = aws_iam_policy.iam_pol.arn
  roles      = [aws_iam_role.ec2_role.name]
}
