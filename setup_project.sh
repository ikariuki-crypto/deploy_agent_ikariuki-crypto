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

# ==========================================
# PHASE 3: Dynamic Configuration (sed)
# ==========================================
echo "Configuring system thresholds..."

# 1. Ask for Warning threshold with a fallback default of 75
read -p "Enter Warning threshold (default 75%): " warn_input 
warn_input=${warn_input:-75}

# 2. Ask for failure threshold with a fallback default of 50
read -p "Enter Failure threshold (default 50%): " fail_input 
fail_input=${fail_input:-50}

# 3. Use sed to replace the placeholder numbers inside config.json
sed -i "s/\"Warning\": [0-9]*/\"Warning\": ${warn_input}/" "attendance_tracker_${user_input}/Helpers/config.json"
sed -i "s/\"Failure\": [0-9]*/\"Failure\": ${fail_input}/" "attendance_tracker_${user_input}/Helpers/config.json"
echo "Phase 3 complete: Configuration thresholds updated successfully!"

# ===========================================
# PHASE 4: Data validation (awk)
# ===========================================
echo "Executing data validation suite..."

# Define paths to our source data and target log file
CSV_FILE="attendance_tracker_${user_input}/Helpers/assets.csv"
LOG_FILE="attendance_tracker_${user_input}/reports/reports.log"

# Run awk to process the student data columns
awk -F',' -v warn="$warn_input" -v fail="$fail_input" '
    NR > 1 {
        id = $1
        name = $2
        pct = $3
        
        if (pct < fail) {
            print "[CRITICAL] Student " name " (" id ") dropped to " pct "% (Below Failure Limit of " fail "%)"
        } else if (pct < warn) {
            print "[WARNING] Student " name " (" id ") dropped to " pct "% (Below Warning Limit of " warn "%)"
        }
    }
' "$CSV_FILE" > "$LOG_FILE"

echo "Phase 4 complete: Alerts compiled into reports/reports.log successfully!"
