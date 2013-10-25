class Rolodex
  
#didn't need contact attr accessor or reader or writer as you didn't need it outside the class

  @contacts = [] # class level instance variable - within the class, not available at every method but at the class level 
  @id = 1000 #starts the id at 1000

  def self.contacts #reader for class level instance variable 
    #.self = defines as class method (only work within the class)
    @contacts 
  end

  def self.add_contact(contact)
    contact.id = @id
    @contacts << contact
    puts contact.id
    @id +=1
  end

end