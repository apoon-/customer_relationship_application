require_relative "contact"
require_relative "rolodex"

class CRM

# attr_reader :name
# attr_writer :name
attr_accessor :name

  def initialize(name)
    @name = name
    #@ or .self
    #.self method to set the variable 
  end

  #getter method to read the variable
  # def name
  #   @name
  # end

  #setter method to write the variable
  # def name=(name) 
  #   @name = name
  # end

  def menu_loop
    @user_selected = 0
    while @user_selected != 6
      main_menu
    end
  end

  def print_main_menu
    puts"-----------------------------------"
    puts "Welcome to your CRM, #{@name}"
    puts"-----------------------------------"
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute" 
    puts "[6] Exit"
    puts "\n"
    puts "Enter a number:"
  end

  def call_option(user_selected)

  case user_selected
    when 1
      system 'clear'
      add_new_contact
    when 2
      system 'clear'
      modify_existing_contact
    when 3
      delete_contact
    when 4
      display_all
    when 5
      display_attribute
    when 6
      puts "\n"
      puts "Goodbye!"
      exit
    else
      puts "Error, not an option" #shuld raise and rescue error
      #raise
    end
  end

def add_new_contact
  print "Enter First Name: "
  first_name = gets.chomp
  print "Enter Last Name: "
  last_name = gets.chomp
  print "Enter Email Address: "
  email = gets.chomp
  print "Enter a Note: "
  note = gets.chomp
  contact = Contact.new(first_name, last_name, email, note)
  Rolodex.add_contact(contact)
end

  def modify_existing_contact
    Rolodex.display_id_contacts
    puts "Which contact would you like to edit?"
    puts "Enter in their ID:"
    @id = gets.chomp.to_i
    Rolodex.display_contact_attribute(@id)
    puts "Which attribute would you like to edit?"
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] E-Mail"
    puts "[4] Note" 
    attribute = gets.chomp
  end

  def delete_contact
    system 'clear'
    Rolodex.display_id_contacts
    puts "Which contact would you like to delete?"
    puts "Enter in their ID:"
    @id = gets.chomp.to_i
    Rolodex.delete(@id)
  end

  def display_all
    Rolodex.display_all_contacts
    #main_menu
  end

  def display_attribute
    #ADD LATER
  end 

  def main_menu
    print_main_menu
    user_selected = gets.to_i
    # begin
    call_option(user_selected)
    # rescue
    #     puts "Wrong Option!"
    # end
  end

  def test_contacts
    Rolodex.add_contact(Contact.new("Anson", "Poon", "apoon@gmail.com", "Hi"))
    Rolodex.add_contact(Contact.new("Test", "Tester", "test@gmail.com", "Test"))
    Rolodex.add_contact(Contact.new("Test1", "Tester1", "test2@gmail.com", "test"))
    Rolodex.add_contact(Contact.new("Test2", "Tester2", "test3@gmail.com", "test"))
    Rolodex.add_contact(Contact.new("Test3", "Tester3", "test4@gmail.com", "test"))
  end

end

#cut out contact class into contact.rb

#cut out rolodex class into rolodex.rb

my_crm = CRM.new("Anson") #checks for initialize method and starts a new instance of the class CRM
my_crm.test_contacts
my_crm.menu_loop #call main menu output case sate 
# puts my_crm.name

# my_crm.name = "Your mom's CRM"
# puts my_crm.name

# my_contact = Contact.new("Adrian", "Carton de Wiart", "adianwiart@gmail.com", "Even cooler.")
# puts my_contact.first_name
# puts my_contact.last_name
# puts my_contact.email
# puts my_contact.note

