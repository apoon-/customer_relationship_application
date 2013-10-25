require_relative 'contact'

class Rolodex
  
  attr_accessor :id
#didn't need contact attr accessor or reader or writer as you didn't need it outside the class

  def initialize(id)
    @id = id
  end


  @contacts = [] # class level instance variable - within the class, not available at every method but at the class level 
  @id = 1000 #starts the id at 1000

  def self.contacts #reader for class level instance variable 
    #.self = defines as class method (only work within the class)
    @contacts 
  end

  def self.add_contact(contact)
    contact.id = @id
    @contacts << contact
    puts "Contact #{contact.id} Added"
    @id += 1 
  end

  def self.display_all_contacts
    @contacts.each do |contact|
      puts "#{contact.id} - #{contact.first_name} #{contact.last_name}"
      puts "Email #{contact.email}"
      puts "Notes #{contact.note}"
    end
  end

  def self.display_id_contacts
    @contacts.each do |contact|
      puts "#{contact.id} - #{contact.first_name} #{contact.last_name}"
    end
  end

  def self.delete(id)
    
    @contact.each do |x| 
      index = 0

      if x = id
        return index
      else
        index +=1 
      end
    end 

    @contacts.delete_at(index)
      puts "Contact has been deleted"
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