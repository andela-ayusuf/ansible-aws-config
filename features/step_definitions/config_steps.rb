require 'open3'
require_relative 'vars'

# Scenario: Install Boto
When(/^I install Boto$/) do
  cmd = "ansible-playbook playbook.aws.yml --tags 'boto'"
  output, error, @status = Open3.capture3 "#{cmd}"
end

Then(/^it should be successful$/) do
  expect(@status.success?).to eq(true)
end

# Scenario: Install AWS CLI
When(/^I install AWS CLI$/) do
  cmd = "ansible-playbook playbook.aws.yml --tags 'awscli'"
  output, error, @status = Open3.capture3 "#{cmd}"
end

# Scenario: Create an AMI from the instance given
When(/^I create an AMI from the instance given$/) do
  cmd = "ansible-playbook playbook.aws.yml --tags 'create_ami'"
  output, error, @status = Open3.capture3 "#{cmd}"
end

# Scenario: Convert cloudformation template from j2 to json
When(/^I convert cloudformation template from j2 to json$/) do
  cmd = "ansible-playbook playbook.aws.yml --tags 'j2_json'"
  output, error, @status = Open3.capture3 "#{cmd}"
end

# Scenario: Copy ami ID to the json file
When(/^I copy ami ID to the json file$/) do
  cmd = "ansible-playbook playbook.aws.yml --tags 'ami_json'"
  output, error, @status = Open3.capture3 "#{cmd}"
end

# Scenario: Configure AWS infrastructure using Cloudformation
When(/^I configure AWS infrastructure using Cloudformation$/) do
  cmd = "ansible-playbook playbook.aws.yml --tags 'cloudformation'"
  output, error, @status = Open3.capture3 "#{cmd}"
end

And(/^the created bucket should exists on S3$/) do
  cmd = "aws s3 ls | grep #{BUCKETNAME}"
  output, error, status = Open3.capture3 "#{cmd}"
  expect(status.success?).to eq(true)
  expect(output).to match("#{BUCKETNAME}")
end

And(/^the created Elastic Load Balancer should exists on AWS$/) do
  cmd = "aws elb describe-load-balancers | grep #{LBNAME}"
  output, error, status = Open3.capture3 "#{cmd}"
  expect(status.success?).to eq(true)
  expect(output).to match("#{LBNAME}")
end

And(/^the created Simple Notification Service should exists on AWS$/) do
  cmd = "aws sns list-topics | grep #{SNSTOPICNAME}"
  output, error, status = Open3.capture3 "#{cmd}"
  expect(status.success?).to eq(true)
  expect(output).to match("#{SNSTOPICNAME}")
end

# Scenario: Upload data to the S3 bucket
When(/^I upload data to the S3 bucket$/) do
  cmd = "ansible-playbook playbook.aws.yml --tags 's3_upload'"
  output, error, @status = Open3.capture3 "#{cmd}"
end

And(/^the bucket should contain ([^"]*)$/) do |data|
  case data
  when 'index.html', 'error.html'
    cmd = "aws s3 ls s3://#{BUCKETNAME} | grep #{data}"
    output, error, status = Open3.capture3 "#{cmd}"
    expect(status.success?).to eq(true)
    expect(output).to match("#{data}")
  else
    raise 'Not Implemented'
  end
end

