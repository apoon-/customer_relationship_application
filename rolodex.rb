require_relative 'contact'

class Rolodex
  
  attr_accessor :id, :first_name
#didn't need contact attr accessor or reader or writer as you didn't need it outside the class

  def initialize(id)
    @id = id
  end


  @contacts = [] # class level instance variable - within the class, not available at every method but at the class level 
  @id = 1000 #starts the id at 1000
  @@index = 0
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
        @@index +=1 
      end
    end 
  end

  def self.delete(id)
    indexer(id)

    @contacts.delete_at(@@index)
      system 'clear'
      puts"----------"
      puts "DELETED"
      puts"----------"
  end

  def self.display_contact_attribute(id)
    indexer(id)
    puts @contacts[@@index].print_contact_specific_info
  end

  def self.modify(attribute)
  end

  def specific_attr_display(attribute)
    indexer(id)

    attribute = attribute.downcase

    case attribute
    when "1" || "first name"
      @@attr = @contacts[@@index].contact.first_name
    when "2" || "last name"
      @@attr = @contacts[@@index].contact.last_name
    when "3" || "email"
      @@attr = @contacts[@@index].contact.email
    when "4" || "note"
      @@attr = @contacts[@@index].contact.note
    else
      puts "Attribute not found"
    end
  end

  def self.display_attr(id, attribute)
    indexer(id)

    attr_finder(attribute)

    puts @@attr
  end

#backup
  # def attr_finder(attribute)

  #   attribute = attribute.downcase

  #   case attribute
  #   when "1" || "first name"
  #     @@attr = @contacts.first_name
  #   when "2" || "last name"
  #     @@attr = @contacts.last_name
  #   when "3" || "email"
  #     @@attr = @contacts.email
  #   when "4" || "note"
  #     @@attr = @contacts.note
  #   else
  #     puts "Attribute not found"
  #   end
  # end

  # def self.display_attr(id, attribute)
  #   indexer(id)

  #   attr_finder(attribute)

  #   puts @contacts[@@index].contact.@@attr
  # end

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