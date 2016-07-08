# ANSIBLE-AWS-CONFIG
This Ansible playbook allows you to:
- Create a Server-Side encrypted S3 bucket on Amazon AWS and upload data to it
- Host a static website on Amazon AWS using Amazon S3
- Create a Virtual Private Cloud(VPC) with a private & public subnet on Amazon AWS using AWS Cloudformation
- Create an Amazone Machine Image
- Launch EC2 instances with the machine image created previously in an Autoscaling group

**Requirements**

Before running this playbook, you must have Python >= 2.6 installed on your local machine. Head over [here](http://docs.python-guide.org/en/latest/starting/install/osx/) to install Python.

Running the playbook wil install the other requirements -Boto and AWS CLI- if you don't have them installed.

**Clone The Project**
```
git clone https://github.com/andela-ayusuf/ansible-aws-config.git
```

**S3 Bucket Policy**

In order to create a Server-Side Encryption with Amazon S3-Managed Encryption Keys (SSE-S3) on our Amazon S3 bucket, we will need a bucket policy. An example can be found [here](http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingServerSideEncryption.html).


The policy will be placed in the root of the project in a file named **policy.json**


**Variables and AWS Access and Secret Keys**

In the variables files i.e. the **vars.yml** file in the root directory of this project, we will need to enter our Access and Secret Keys which can be obtained from AWS [here](https://console.aws.amazon.com/iam/home?region=us-west-1#home). It is also required that we fill in other variables which will be used in creating our AWS resources.

**Running The Project**

Well, this is the part we've been waiting for, right? :)

From your terminal, enter:

```
$ cd ansible-aws-config
$ ansible-playbook playbook.aws.yml
```