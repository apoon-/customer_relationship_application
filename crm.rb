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

  def print_main_menu
    puts "Weclome to #{@name} CRM"
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
      #puts "Error, not an option" #shuld raise and rescue error
      raise
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
    contact
    puts "What is the ID of the contact you wish to edit?"
    @id = gets.chomp

    if @id

  end

  def delete_contact
    #ADD LATER
  end

  def display_all
    #ADD LATER
  end

  def display_attribute
    #ADD LATER
  end 

  def main_menu
    print_main_menu
    user_selected = gets.to_i
    begin
    call_option(user_selected)
    rescue
        puts "Wrong Option!"
    end
  end

end

#cut out contact class into contact.rb

#cut out rolodex class into rolodex.rb

my_crm = CRM.new("My CRM") #checks for initialize method and starts a new instance of the class CRM
my_crm.main_menu #call main menu output case sate 

# puts my_crm.name

# my_crm.name = "Your mom's CRM"
# puts my_crm.name

# my_contact = Contact.new("Adrian", "Carton de Wiart", "adianwiart@gmail.com", "Even cooler.")
# puts my_contact.first_name
# puts my_contact.last_name
# puts my_contact.email
# puts my_contact.note

