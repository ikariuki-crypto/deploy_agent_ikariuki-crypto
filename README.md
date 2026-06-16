 Student Attendance Project Setup Guide

This project contains an automated tool (setup_project.sh) that builds a workspace folder for tracking student attendance, configures custom, scoring rules, and automatically checks for failing students.

Follow these simple steps to run it on your machine.



Step 1: Open the Terminal Environment

To run this file, you need to use a Linux-style terminal. 
 If you are on **Windows**, open the application named **Git Bash**.
 If you are on **Mac**, open the application named **Terminal**.



Step 2: Give the File Permission to Run

Before your computer can run the script, you have to tell it that the file is safe to execute. 

Copy and paste this exact command into your terminal window, then press **Enter**:

bash
chmod u+x setup_project.sh
(Nothing obvious will happen when you run this, but it unlocks the file behind the scenes!)

 Step 3: Run the Script
Now you are ready to start the automated setup! Type this command into your terminal and press Enter:

Bash
./setup_project.sh

What to do when the script asks you questions:

Enter a suffix name: Type a short word or version number (like final or v3) and press Enter. This names your new folder.

Enter Warning threshold: Type a number (like 80) and press Enter. This sets the warning percentage for attendance.

Enter Failure threshold: Type a number (like 50) and press Enter. This sets the critical failing percentage.

 How to Stop or Emergency-Reset the Script
If you make a mistake while typing or want to stop the setup while it is running, you can trigger the built-in safety archive feature.

While the script is running, press Ctrl + C on your keyboard.

Instead of crashing, the script will catch this signal, stop gracefully, and clean up your workspace files automatically.

\ How to View Your Results Report
Once the script finishes completely, it will automatically create an audit report for you. To read the report and see which students dropped below your chosen thresholds, run this command:

Bash

cat attendance_tracker_final/reports/reports.log

You can watch the deployment pipeline presentation through here: https://drive.google.com/file/d/1gm8mTgDVVzx0lwTpyOSG48UKP7FrydlD/view?usp=sharing
