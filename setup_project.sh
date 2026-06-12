#!/bin/bash

# ========================================
# PHASE 1: Directory Architecture & Trap
# ======================================== 

read -p "Enter the naming suffix for your tracker: " user_input


cleanup() {
	echo -e "\n[!] Execution interrupted. Cleaning up workspace...'
	mkdir -p "attendance_tracker_${user_input}_archive
	rm -rf "attendance_tracker_${user_input}"
	exit 1
}
trap cleanup SIGINT

echo "Creating project directories..."
mkdir -p "attendance_tracker_${user_input}/reports"
mkdir -p "attendance_tracker_${user_input}/Helpers"
echo "Directory structure created successfully"


# ========================================
# PHASE 2: Generating Application Files
# ======================================== 
echo "Generating application baseline files..."

# 1. Create config.json inside the Helpers folder
cat << 'EOF' > "attendance_tracker_${user_input}/Helpers/config.json"
}
    "Warning": 75,
    "Failure": 50
}
EOF

# 2. Create assets.csv inside the Helpers folder
cat << 'EOF' > "attendance_tracker_${user_input}/Helpers/assets.csv"
Student_ID, Name,Attendance_Percentage
S001,Alex Jones,85
S002,Maria Silva,72
S003,Sam Wilson,48
EOF

# 3. Create attendance_checker.py directly in the root folder
cat << 'EOF' > "attendance_tracker_${user_input}/attendance_checker.py"
import json
print("[+] Attendance Checker System Active")
EOF

# 4. Create the empty reports.log file inside the reports folder
touch "attendance_tracker_${user_input}/reports/reports.log"

echo "Phase 2 complete: All baseline files generated successfully!"
