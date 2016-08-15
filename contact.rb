class Contact
#  vik = Contact.new("V","V","V","V")
#  shane = Contact.new("S","S","S","S")
  @@id = 1
  @@contacts = []

  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @@contacts << self
    @id = @@id
    @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts
    return new_contact
  end


  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |c|
    return c if id == c.id
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, new_value)
    case attribute
    when "first_name" then @first_name = new_value
    when "last_name" then @last_name = new_value
    when "email" then @email = new_value
    when "note" then @note = new_value
   end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute,value)
    @@contacts.each do |c|
      return c if value == c.first_name
      return c if value == c.last_name
      return c if value == c.email
      return c if value == c.note
    end

  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.each {|c| @@contacts.clear}
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end


  # Feel free to add other methods here, if you need them.
contact1 = Contact.new("V","V","V","V")
contact2 = Contact.new("S","S","S","S")
