def print_main_menu
  puts "[1] Add a new contact"
  puts "[2] Modify an existing contact"
  puts "[3] Delete a contact"
  puts "[4] Display all the contacts"
  puts "[5] Display an attribute" 
  puts "[6] Exit"
  puts "Enter a number: "
end

def call_option(user_selected)
  
case user_selected
  when 1
    add_new_contact
  when 2
    modify_existing_contact
  when 3
    delete_contact
  when 4
    display_all
  when 5
    display_attribute
  when 6
    exit
  else
    puts "Error, not an option"
  
when condition
  
end

end

def main_menu
  print_main_menu
  user_selected = gets.to_i
  call_option(user_selected)
end

main_menu

