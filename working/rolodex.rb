require_relative 'contact'

class Rolodex
  
  attr_accessor :id, :first_name
#didn't need contact attr accessor or reader or writer as you didn't need it outside the class

  def initialize(id)
    @id = id
  end


  @contacts = [] # class level instance variable - within the class, not available at every method but at the class level 
  @id = 1000 #starts the id at 1000
  @index = 0
  # @@attr = @contacts.first_name

  def self.contacts #reader for class level instance variable 
    #.self = defines as class method (only work within the class)
    @contacts 
  end

  def self.add_contact(contact)
    contact.id = @id
    @contacts << contact
    system 'clear'
    puts "---------------------------"
    puts "CONTACT #{contact.id-999} ADDED"
    puts "---------------------------\n"
    @id += 1 
  end

  def self.display_all_contacts
      puts "--------------------------------"
      puts "CONTACTS"
      puts "--------------------------------"
    @contacts.each do |contact|
      puts "-----------------------------"     
      puts "#{contact.id} - #{contact.first_name.upcase} #{contact.last_name.upcase}"
      puts "-----------------------------"
      puts "Email: #{contact.email}"
      puts "Notes: #{contact.note}"
      puts "\n"
    end
  end

  def self.display_id_contacts
    puts "----------------"
    puts "CONTACTS"
    puts "----------------"
    @contacts.each do |contact|
      puts "#{contact.id} - #{contact.first_name} #{contact.last_name}"
    end
    puts "\n"
  end

  def self.indexer(id)
    @contacts.each do |contact| 

      if contact.id == id
        break
      else
        @index +=1 
      end
    end 
  end

  def self.delete(id)
    indexer(id)

    @contacts.delete_at(@index)
      system 'clear'
      puts"----------"
      puts "DELETED"
      puts"----------"
  end

  def self.display_contact_all_attribute(id)
    indexer(id)
    puts @contacts[@index].print_specific_contact
  end

  def self.modify(attribute, id)
    Rolodex.indexer(id)

    case attribute
    when "1" || "first name"
      attribute = @contacts[@index].first_name
      puts "-------------------------------------------"
      puts "Current FIRST NAME is: #{attribute}"
      puts "-------------------------------------------"
      puts "Please enter new FIRST NAME"
      new_attr = gets.chomp
      @contacts[@index].first_name.replace(new_attr)
      puts "-------------------------------------------"
      puts "New FIRST NAME is now #{@contacts[@index].first_name}"
      puts "-------------------------------------------"
    when "2" || "last name"
      attribute = @contacts[@index].last_name
      puts "-------------------------------------------"
      puts "Current Last Name is: #{attribute}"
      puts "-------------------------------------------"
      puts "Please enter new LAST NAME"
      new_attr = gets.chomp
      @contacts[@index].last_name.replace(new_attr)
      puts "-------------------------------------------"
      puts "New LAST NAME is now #{@contacts[@index].last_name}"
      puts "-------------------------------------------"
    when "3" || "email"
      attribute = @contacts[@index].email
      puts "-------------------------------------------"
      puts "Current EMAIL is: #{attribute}"
      puts "-------------------------------------------"
      puts "Please enter new EMAIL"
      new_attr = gets.chomp
      @contacts[@index].email.replace(new_attr)
      puts "-------------------------------------------"
      puts "New EMAIL is now #{@contacts[@index].email}"
      puts "-------------------------------------------"
    when "4" || "note"
      attribute = @contacts[@index].note
      puts "-------------------------------------------"
      puts "Current NOTE is: #{attribute}"
      puts "-------------------------------------------"
      puts "Please enter new NOTE"
      new_attr = gets.chomp
      @contacts[@index].note.replace(new_attr)
      puts "-------------------------------------------"
      puts "New NOTE is now #{@contacts[@index].note}"
      puts "-------------------------------------------"
    else
      puts "Attribute not found"
    end
  end

  def self.print_all_attr(attribute)
    case attribute
    when "1" || "first name"
      puts "-----------------------------" 
      puts "PRINTING ALL FIRST NAMES"    
      puts "-----------------------------"     
        @contacts.each do |contact|
        puts "#{contact.id} - #{contact.first_name.upcase}"
        end
      puts "\n"
    when "2" || "last name"
      puts "-----------------------------" 
      puts "PRINTING ALL LAST NAMES"    
      puts "-----------------------------"     
        @contacts.each do |contact|
        puts "#{contact.id} - #{contact.last_name.upcase}"
        end
      puts "\n"
    when "3" || "email"
      puts "-----------------------------" 
      puts "PRINTING ALL EMAILS"    
      puts "-----------------------------"     
        @contacts.each do |contact|
        puts "#{contact.id} - #{contact.email}"
        end
      puts "\n"
    when "4" || "note"
      puts "-----------------------------" 
      puts "PRINTING ALL NOTES"    
      puts "-----------------------------"     
        @contacts.each do |contact|
        puts "#{contact.id} - #{contact.note}"
        end
      puts "\n"
    else
      puts "Attribute not found"
    end
  end

end

#test = Rolodex.new
#puts Rolodex.contacts.inspect


#puts test.display_all_contacts

# contact = Contact.new("John", "Doe", "email@test.com", "test")
# Rolodex.add_contact(contact)
# puts Rolodex.display_all_contacts

# contact = Contact.new("Jane", "Doe", "email@test.com", "test")
# Rolodex.add_contact(contact)
# puts Rolodex.display_all_contacts