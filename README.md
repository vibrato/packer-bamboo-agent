# Packer Bamboo Elastic Agent

Creates an AMI to use as a customised Bamboo Elastic Agent 

## Getting started

To create an AMI to use as a customised Bamboo Elastic Agent, run the following at the command line 

```
$ packer build \
    -var 'AWS_ACCESS_KEY_ID=foo' \
    -var 'AWS_SECRET_ACCESS_KEY=bar' \
    bamboo-elastic-agent.json
```

## AWS Credentials

You will need an IAM user account to run this locally on your computer. The script can also be run on an EC2
instance with an instance profile granting sufficient permissions. Refer to https://www.packer.io/docs/builders/amazon.html

The following policy document provides the minimal set permissions necessary for Packer to work:

```
{
  "Version": "2012-10-17",
  "Statement": [{
      "Effect": "Allow",
      "Action" : [
        "ec2:AttachVolume",
        "ec2:CreateVolume",
        "ec2:DeleteVolume",
        "ec2:CreateKeypair",
        "ec2:DeleteKeypair",
        "ec2:DescribeSubnets",
        "ec2:CreateSecurityGroup",
        "ec2:DeleteSecurityGroup",
        "ec2:DescribeSecurityGroups",
        "ec2:AuthorizeSecurityGroupIngress",
        "ec2:CreateImage",
        "ec2:CopyImage",
        "ec2:RunInstances",
        "ec2:TerminateInstances",
        "ec2:StopInstances",
        "ec2:DescribeVolumes",
        "ec2:DetachVolume",
        "ec2:DescribeInstances",
        "ec2:CreateSnapshot",
        "ec2:DeleteSnapshot",
        "ec2:DescribeSnapshots",
        "ec2:DescribeImages",
        "ec2:RegisterImage",
        "ec2:DeregisterImage",
        "ec2:CreateTags",
        "ec2:ModifyImageAttribute",
        "ec2:GetPasswordData",
        "ec2:DescribeTags",
        "ec2:DescribeImageAttribute",
        "ec2:CopyImage",
        "ec2:DescribeRegions",
        "ec2:ModifyInstanceAttribute"
      ],
      "Resource" : "*"
  }]
}
```

## Modifying the script

You can modify the bash script in the scripts directory to install what your build and deployments require. You
can also manage a fleet of AMIs by creating a separate script for each type of agent required. You will need
to also copy the packer JSON file to a new file.

## Modifying the source AMI

The source AMI used by Packer is the Atlassian stock image for elastic Bamboo agents. This AMI already has all
the required packages installed to connect to Bamboo. Each region has their own AMI so be sure to check the
region before updating the source AMI.

## Further reading

Further details can be found here https://developer.atlassian.com/blog/2015/07/bamboo-packer/ 
