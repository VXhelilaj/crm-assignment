require_relative 'contact'
# crm1 = CRM.new
class CRM

  def initialize
  end

  def main_menu
    while true # repeat indefinitely
        print_main_menu
        user_selected = gets.chomp
        call_option(user_selected)
      end
  end

  def print_main_menu
      puts '[1] Add a new contact'
      puts '[2] Modify an existing contact'
      puts '[3] Delete a contact'
      puts '[4] Display all the contacts'
      puts '[5] Search by attribute'
      puts '[6] Exit'
      puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end



  def add_new_contact
      print 'Enter First Name: '
      first_name = gets.chomp

      print 'Enter Last Name: '
      last_name = gets.chomp

      print 'Enter Email Address: '
      email = gets.chomp

      print 'Enter a Note: '
      note = gets.chomp

      Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact

    print "Enter the ID of the contact you'd like to modify. "
    id_to_modify = gets.chomp

    print "Enter the attribute you'd like to modify. "
    new_value = gets.to_s

    print "What is the value of the new attribute? "
    attribute = gets.chomp

     contact_to_modify = Contact.find(id_to_modify.to_i)
     contact_to_modify.update(attribute, new_value)
  end

  def delete_contact
    print "Enter the ID of the contact you'd like to delete. "
    id_to_delete = gets.chomp

    contact_to_delete = Contact.find(id_to_delete.to_i)
    contact_to_delete.delete
  end

  # This method should accept as an argument an array of contacts
  # and display each contact in that array
  def display_contacts
    contact_array.each do |c|
    puts "First Name: #{c.first_name}"
    puts "Last Name: #{c.last_name}"
    puts "Email: #{c.email}"
    puts "Notes: #{c.notes}"
    # HINT: Make use of this method in the display_all_contacts and search_by_attribute methods to keep your code DRY
  end

  def display_all_contacts
    display_contacts(Contacts.all)
    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  def search_by_attribute

    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  # Add other methods here, if you need them.
end
