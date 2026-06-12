#!/bin/bash

#1. Ask th euser for the input
read -p "Enter the naming suffix for you tracker: " user_input

#2. Create the architecture
mkdir -p "attendance_tracker_${user_input}/reports"
mkdir -p "attendance_tracker_${user_input}/Helpers"

echo "Directory structure created successfully!"
