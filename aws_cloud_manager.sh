#!/bin/bash

# Script Name: aws_cloud_manager.sh

# Define an array of IAM user names
IAM_USERS=("DevOpsUser1" "DevOpsUser2" "DevOpsUser3" "DevOpsUser4" "DevOpsUser5")

# Function to create IAM users
create_iam_users() {
    echo "Creating IAM users..."
    for user in "${IAM_USERS[@]}"; do
        aws iam create-user --user-name "$user" &>/dev/null
        if [ $? -eq 0 ]; then
            echo "User $user created successfully."
        else
            echo "Error creating user $user."
        fi
    done
}

# Function to create an IAM group
create_iam_group() {
    GROUP_NAME="admin"
    echo "Creating IAM group $GROUP_NAME..."
    aws iam create-group --group-name "$GROUP_NAME" &>/dev/null
    if [ $? -eq 0 ]; then
        echo "Group $GROUP_NAME created successfully."
    else
        echo "Error creating group $GROUP_NAME. It may already exist."
    fi
}

# Function to attach administrative policy to the group
attach_policy_to_group() {
    GROUP_NAME="admin"
    POLICY_ARN="arn:aws:iam::aws:policy/AdministratorAccess"
    echo "Attaching policy $POLICY_ARN to group $GROUP_NAME..."
    aws iam attach-group-policy --group-name "$GROUP_NAME" --policy-arn "$POLICY_ARN" &>/dev/null
    if [ $? -eq 0 ]; then
        echo "Policy attached successfully."
    else
        echo "Error attaching policy."
    fi
}

# Function to assign users to the group
assign_users_to_group() {
    GROUP_NAME="admin"
    echo "Assigning users to group $GROUP_NAME..."
    for user in "${IAM_USERS[@]}"; do
        aws iam add-user-to-group --group-name "$GROUP_NAME" --user-name "$user" &>/dev/null
        if [ $? -eq 0 ]; then
            echo "User $user assigned to group $GROUP_NAME."
        else
            echo "Error assigning user $user to group."
        fi
    done
}

# Main script execution
main() {
    echo "Starting AWS IAM Management..."
    create_iam_users
    create_iam_group
    attach_policy_to_group
    assign_users_to_group
    echo "AWS IAM Management tasks completed."
}

# Execute the main function
main
