#Write a shell script to determine whether a given year is a leap year or not.
# Prompt user for input
echo "Enter a year:"
read year

# Validate input: must be a positive integer greater than 0
if ! [[ "$year" =~ ^[0-9]+$ ]] || [ $year -le 0 ]; then
  echo "Invalid input."
  exit 1
fi

# Leap year rules:
# 1. If divisible by 400 -> Leap year
# 2. Else if divisible by 4 but not by 100 -> Leap year
# 3. Otherwise -> Not a leap year
if (( year % 400 == 0 )) || (( year % 4 == 0 && year % 100 != 0 )); then
  echo "$year is a leap year"
else
  echo "$year is not a leap year"
fi