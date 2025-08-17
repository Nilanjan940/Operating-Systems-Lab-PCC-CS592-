#Create a student file (Students.dat) containing four fields, Name, Roll, Phone and Address. The field separator is ‘|’.
#Now, write a menu driven script to do the following:
#(i) Sort the records in reverse order of Roll number and store the output in a new file (Sorted.dat).
#(ii) Replace lower case letters with the upper case letters in the file 'Sorted.dat'. Take file input using redirection.
#(iii) Write commands to find out the records with unique name in the file 'Sorted.dat'. Append the output records to 'Students.dat'.
#(iv) Display only the 2nd and 3rd lines from the above file (Students.dat).
#Hint: May use filters ->  tr, cut, grep, wc, sort, uniq, head, tail, etc. along with pipe and redirection.
#The input file name should be supplied as command line argument. Also, check for sufficient number of command line arguments passed and show appropriate error message.

# Check if an input file is provided
if [ $# -lt 1 ]
then
	echo "Error: No input file provided"
	echo "Usage: $0 <Student.dat>"
	exit 1
fi

# Assign first argument as input file
input_file="$1"

# Check if file exists
if [ ! -f "$input_file" ]
then
	echo "Error: File '$input_file' does not exist."
	exit 1
fi

# Check if file is not empty
if [ ! -s "$input_file" ]
then
	echo "Error: File '$input_file' is empty."
	exit 1
fi

# Infinite loop to display menu until user exits
while true
do
	# Display menu options
	echo -e "\nMenu:"
	echo "1. Sort in reverse order of roll number -> Sorted.dat"
	echo "2. Convert lowercase to uppercase in Sorted.dat (input redirection)"
	echo "3. Append unique name records from Sorted.dat to Students.dat"
	echo "4. Display only 2nd and 3rd lines from Students.dat"
	echo "5. Exit"

	# Take user choice
	read -p "Enter choice: " choice

	case $choice in
		1)
			# Sort file in reverse order of roll number (2nd field, numeric reverse)
			sort -t"|" -k2,2nr "$input_file" > Sorted.dat
			echo "Records sorted in reverse order of Roll and saved in Sorted.dat."
			;;

		2)
			# Convert lowercase to uppercase in Sorted.dat
			if [ ! -f "Sorted.dat" ] || [ ! -s "Sorted.dat" ]; then
				echo "Error: Sorted.dat does not exist or is empty. Run option 1 first."
			else
				# Use tr with input redirection, overwrite Sorted.dat
				tr 'a-z' 'A-Z' < Sorted.dat > temp.dat && mv temp.dat Sorted.dat
				echo "Converted lowercase to uppercase in Sorted.dat."
			fi
			;;

		3)
			# Append only unique name records from Sorted.dat to input file
			if [ ! -f "Sorted.dat" ] ||	[ ! -s "Sorted.dat" ]; then
				echo "Error: Sorted.dat does not exist or is empty. Run option 1 first."
			else
				# Extract first field (name), keep only unique entries
				cut -d"|" -f1 Sorted.dat | uniq -u > unique_names.txt
				# Match those names in Sorted.dat and append them to Students.dat (input_file)
				grep -F -f unique_names.txt Sorted.dat >> "$input_file"
				rm -f unique_names.txt
				echo "Unique records appended to $input_file"
			fi
			;;

		4)
			# Display only 2nd and 3rd lines from Students.dat (input_file)
			total_lines=$(wc -l < "$input_file")
			if [ "$total_lines" -lt 3 ]; then
				echo "Error: $input_file has less than 3 lines."
			else
				# Extract first 3 lines, then take the last 2 (2nd & 3rd)
				head -n 3 "$input_file" | tail -n 2
			fi
			;;

		5)
			# Exit program
			echo "Exiting..."
			exit 0
			;;

		*)
			# Handle invalid menu choices
			echo "Invalid choice. Please enter a number between 1 and 5."
			;;
	esac
done