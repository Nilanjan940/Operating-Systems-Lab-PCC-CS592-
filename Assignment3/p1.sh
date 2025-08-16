#Write a menu driven shell script to do the following:
#i) Show the permissions of a file or directory; 
#ii) Show the number of files and directories under current directory separately; 
#iii) Show the last modification date and time of a file in current directory; 
#iv) Exit from menu.

# Infinite loop to keep showing the menu until the user chooses to exit
while true
do
  # Display the menu options
  echo "Menu:"
  echo "1) Show permissions of a file or directory"
  echo "2) Show number of files and directories under current directory separately"
  echo "3) Show last modification date and time of a file in current directory"
  echo "4) Exit"

  # Prompt user to enter their choice
  echo -n "Enter your choice: "
  read choice

  # Use case to handle different options
  case $choice in
    1)
      # Option 1: Show permissions of a file or directory
      echo -n "Enter file or directory name: "
      read name

      # If no input is given
      if [ -z "$name" ]; then
        echo "You did not enter anything."

      # If file or directory exists → show its permissions
      elif [ -e "$name" ]; then
        perm=$(ls -ld "$name" | awk '{print $1}')
        echo "Permissions: $perm"

      # If file/directory does not exist
      else
        echo "Error: File or directory does not exist."
      fi
      ;;
    
    2)
      # Option 2: Count files and directories separately
      files=0
      for item in *; do
        if [ -f "$item" ]; then   # Check if it's a regular file
          files=$((files + 1))
        fi
      done

      dirs=0
      for item in *; do
        if [ -d "$item" ]; then   # Check if it's a directory
          dirs=$((dirs + 1))
        fi
      done

      echo "Number of files: $files"
      echo "Number of directories: $dirs"
      ;;
    
    3)
      # Option 3: Show last modification time of a file
      echo -n "Enter filename: "
      read fname

      if [ -z "$fname" ]; then
        echo "You did not enter anything."

      elif [ -f "$fname" ]; then
        # Try using Linux 'stat' format
        modtime=$(stat -c %y "$fname" 2>/dev/null)

        # If Linux 'stat' is not available, try BSD/macOS 'stat'
        if [ -z "$modtime" ]; then
          modtime=$(stat -f "%Sm" "$fname" 2>/dev/null)
        fi

        echo "Last modification date and time: $modtime"
      else
        echo "Error: File does not exist."
      fi
      ;;
    
    4)
      # Option 4: Exit the program
      echo "Exiting..."
      break
      ;;
    
    *)
      # If user enters an invalid choice
      echo "Invalid choice. Please enter 1, 2, 3, or 4."
      ;;
  esac

  # Print a blank line for better readability before showing the menu again
  echo ""
done