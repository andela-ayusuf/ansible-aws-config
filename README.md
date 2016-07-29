# ANSIBLE-AWS-CONFIG
This Ansible playbook:
- Creates Server-Side encrypted S3 bucket using AWS S3 managed encryption keys
- Uploads encrypted data to the S3 bucket above
- Set up a static website using the same S3 bucket
- Creates a Virtual Private Cloud(VPC) with multiple subnets in different Availability Zones(AZ).
- Creates Network Access Control List(NACL) and Security Group. 
- Creates a Amazon Machine Image(AMI).
- Creates an Auto Scaling Group(ASG) using the Launch Config created below.
- Creates a Launch Configuration using the AMI created above.
- Sets up AWS Cloud Watch, Cloud Watch Alarm and SNS Topic.

**Requirements**

- Before running this playbook, you must have Python >= 2.6 installed on your local machine. Head over [here](http://docs.python-guide.org/en/latest/starting/install/osx/) to install Python.
- AWS Access and Secret Keys.

**Clone The Project**
```
git clone https://github.com/andela-ayusuf/ansible-aws-config.git
```

**Variables**

You will need to update the variables files i.e. **vars.yml** and **vars.rb** files with the appropriate variables. Currently there are only dummy variables in the variable files and this will not work.


**Running The Project**

From your terminal, enter into this project directory:

```
$ cd ansible-aws-config
```
Run the playbook:
```
$ ansible-playbook playbook.aws.yml
```
OR
```
$ cucumber features/config.feature
```
And with that done, we have an applications's infrastructure set up on AWS.

**Issues**

If you happen to run into any problems while using this playbook or you would like to make contributions to it, please endeavour to open an issue [here](https://github.com/andela-ayusuf/ansible-aws-config/issues).

Best regards :)