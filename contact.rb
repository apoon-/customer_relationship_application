class Contact

attr_accessor :id, :first_name, :last_name, :email, :note

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  def print_specific_contact
    puts "----------------------------"
    puts "Name: #{@first_name.upcase} #{last_name.upcase}"
    puts "----------------------------"
    puts "E-mail: #{@email}"
    puts "Note: #{@note}"
  end

end


