# Write a shell script to check whether an input string is a valid user-name or not (i.e. whether there is any user exists in the system with the given user-name or not).
#Hint: the user database file in Unix/Linux system is  "/etc/passwd"

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
  echo "Error: Please provide exactly one username."
  echo "Usage: $0 <username>"
  exit 1
fi

# Store the provided username
username="$1"

# Search for the username in /etc/passwd
# ^ ensures match starts at the beginning of the line
# ":" ensures exact match with username field
user=$(grep "^$username:" /etc/passwd)

# If user entry is found, variable is non-empty
if [ -n "$user" ]; then
  echo "Valid: User '$username' exists in the system."
else
  echo "Invalid: User '$username' does not exist."
fi