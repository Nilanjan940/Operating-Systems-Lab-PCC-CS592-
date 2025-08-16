#Write a shell script to take a positive integer as user input and do the following,
#i) Compute the square root of the number and print.
#ii) Convert the number from decimal to Hexadecimal and print.

# Check if no argument is provided
if [ $# -eq 0 ]; then
	echo "Error: No input provided."
	echo "Usage: $0 <positive_integer>"
	exit 1
fi

# Check if more than one argument is provided
if [ $# -gt 1 ]; then
	echo "Error: Multiple arguments provided. Only one expected."
	echo "Usage: $0 <positive_integer>"
	exit 1
fi

# Store the argument in a variable
num="$1"

# Check if the input is a valid number (only digits allowed)
if ! [[ "$num" =~ ^[0-9]+$ ]]; then
	echo "Error: '$num' is not a valid number."
	exit 1
fi

# Check if the number is zero (not positive)
if [ "$num" -eq 0 ]; then
	echo "Error: Zero is not a positive integer."
	exit 1
fi

# Calculate square root (with 4 decimal precision)
sqrt=$(echo "scale=4; sqrt($num)" | bc -l)

# Convert decimal number to hexadecimal
hex=$(printf "%X\n" "$num")

# Display results
echo "Square root of $num is: $sqrt"
echo "Hexadecimal of $num is: $hex"