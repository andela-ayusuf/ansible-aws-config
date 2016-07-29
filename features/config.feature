Feature: Cloud Fromation Configuration

  Scenario: Install Boto
    When I install Boto
    Then it should be successful

  Scenario: Install AWS CLI
    When I install AWS CLI
    Then it should be successful

  Scenario: Create an AMI from the instance given
    When I create an AMI from the instance given
    Then it should be successful

  Scenario: Convert cloudformation template from j2 to json
    When I convert cloudformation template from j2 to json
    Then it should be successful

  Scenario: Configure AWS infrastructure using Cloudformation
    When I configure AWS infrastructure using Cloudformation
    Then it should be successful
    And the created bucket should exists on S3
    And the created Elastic Load Balancer should exists on AWS
    And the created Simple Notification Service should exists on AWS
    And the Launch Config should exists on AWS
    And the Private Subnet should exists on AWS
    And the Public Subnet should exists on AWS
    And the Public Subnet2 should exists on AWS

  Scenario: Upload data to the S3 bucket
    When I upload data to the S3 bucket
    Then it should be successful
    And the bucket should contain index.html
    And the bucket should contain error.html
