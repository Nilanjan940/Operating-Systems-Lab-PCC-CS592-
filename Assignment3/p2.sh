#Write a menu driven shell script with three options: 
#i) Accept your personal details along with a password and store them in a data file (e.g. personal.dat); 
#ii) Display the personal details stored in the data file after successfully matching the password stored in the file; 
#iii) Exit from menu.

# File to store personal details
DATAFILE="personal.dat"

# Infinite loop to keep showing the menu until user exits
while true
do
  # Display menu options
  echo "Menu:"
  echo "1) Enter personal details and password"
  echo "2) Display personal details (password protected)"
  echo "3) Exit"

  # Read user choice
  echo -n "Enter your choice: "
  read choice

  # Handle choices using case statement
  case $choice in
    1)
      # Option 1: Enter details and save them

      # Get name
      echo -n "Enter your name: "
      read name
      if [ -z "$name" ]; then     # Check if empty
        echo "Name cannot be empty."
        continue
      fi

      # Get age
      echo -n "Enter your age: "
      read age
      if ! [[ "$age" =~ ^[0-9]+$ ]]; then   # Validate age as number
        echo "Age must be a number."
        continue
      fi

      # Get email
      echo -n "Enter your email: "
      read email
      if [ -z "$email" ]; then   # Email must not be empty
        echo "Email cannot be empty."
        continue
      fi

      # Get password (silent input)
      echo -n "Set your password: "
      read -s pass
      echo ""
      if [ -z "$pass" ]; then    # Password must not be empty
        echo "Password cannot be empty."
        continue
      fi

      # Save all details in file (pipe-separated format)
      echo "$name|$age|$email|$pass" > $DATAFILE
      echo "Details saved successfully."
      ;;
    
    2)
      # Option 2: Display details (password protected)

      # Check if details file exists
      if [ ! -f "$DATAFILE" ]; then
        echo "No details found. Please enter your details first."
        continue
      fi

      # Prompt for password
      echo -n "Enter password to view details: "
      read -s inputpass
      echo ""

      # Extract saved password (4th field)
      savedpass=$(cut -d'|' -f4 "$DATAFILE")

      # Compare entered password with saved password
      if [ "$inputpass" = "$savedpass" ]; then
        echo "Your stored details:"
        name=$(cut -d'|' -f1 "$DATAFILE")
        age=$(cut -d'|' -f2 "$DATAFILE")
        email=$(cut -d'|' -f3 "$DATAFILE")
        echo "Name: $name"
        echo "Age: $age"
        echo "Email: $email"
      else
        echo "Incorrect password!"
      fi
      ;;
    
    3)
      # Option 3: Exit program
      echo "Exiting..."
      break
      ;;
    
    *)
      # Handle invalid menu choices
      echo "Invalid choice. Please enter 1, 2, or 3."
      ;;
  esac

  # Print a blank line for better readability before showing menu again
  echo ""
done