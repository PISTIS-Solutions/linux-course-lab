#!/bin/bash

# Define the username
username="pistis_tech"

# Check if the user already exists
while [ -n "$(getent passwd $username)" ]; do
    echo "User $username already exists. Please choose a different username:"
    read username
done

# Create the user
sudo useradd -m -s /bin/bash "$username"

# Set a password for the user (you will be prompted to enter the password)
sudo passwd "$username"

# Add the user to the sudo group to grant administrative privileges
sudo usermod -aG sudo "$username"

echo "User $username created successfully and granted sudo privileges."