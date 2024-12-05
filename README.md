# Aws_manager-script
This project automates the management of AWS Identity and Access Management (IAM) resources using a shell script.

## Project Overview
This project automates the management of AWS Identity and Access Management (IAM) resources using a shell script. The script simplifies the creation of IAM users, groups, and the assignment of administrative permissions, making it ideal for managing DevOps team members in a growing organization.

---

## Features
- Creates a list of IAM users from a predefined array.
- Creates an IAM group named `admin`.
- Attaches the `AdministratorAccess` policy to the `admin` group.
- Assigns all users to the `admin` group.

---

## Prerequisites
Before running the script, ensure the following:

1. **AWS CLI** is installed on your system. [Download AWS CLI](https://aws.amazon.com/cli/).
2. **AWS Credentials** are configured with sufficient permissions:
   - `iam:CreateUser`
   - `iam:CreateGroup`
   - `iam:AttachGroupPolicy`
   - `iam:AddUserToGroup`
3. **Policy**:
   - The `AdministratorAccess` AWS-managed policy is available in your account.

---

## Usage Instructions

### Step 1: Clone the Repository
```bash
git clone <github.com/azayyad48/aws_manager-script>
cd <aws_manager-script> 
```

### Step 2: Make the Script Executable
```
chmod +x aws_cloud_manager.sh
```
### Step 3: Run the Script
```
./aws_cloud_manager.sh
```

## Script Details

The script performs the following tasks:

  Define IAM Users: Stores IAM user names in an array for iteration.
  Create IAM Users: Uses the AWS CLI create-user command to add new users.
  Create IAM Group: Creates a group named admin with the create-group command.
  Attach Policy to Group: Attaches the AdministratorAccess policy to the group with the attach-group-policy command.
  Assign Users to Group: Assigns all users to the admin group using the add-user-to-group command.


## Example Output

When executed, the script will display progress updates:
```
Starting AWS IAM Management...
Creating IAM users...
User DevOpsUser1 created successfully.
User DevOpsUser2 created successfully.
...
Creating IAM group admin...
Group admin created successfully.
Attaching policy arn:aws:iam::aws:policy/AdministratorAccess to group admin...
Policy attached successfully.
Assigning users to group admin...
User DevOpsUser1 assigned to group admin.
User DevOpsUser2 assigned to group admin.
...
AWS IAM Management tasks completed.

```

## Troubleshooting

    Error: User Already Exists
    Ensure the IAM user doesn’t already exist in AWS.

    Error: Group Already Exists
    If the group exists, the script will skip group creation but proceed with the other tasks.

    Error: Policy Not Attached
    Verify the policy ARN and ensure the AWS CLI credentials have the iam:AttachGroupPolicy permission.

## License

This project is licensed under the MIT License.
