#menu controller will connect to address book

require_relative '../models/address_book'

class MenuController        #needs methods to display main menu and process user input
  attr_reader :address_book
  
  def initialize
    @address_book = AddressBook.new
  end

  def main_menu  #display menu options in command line
      
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    print "Enter your selection: "
    
    selection = gets.to_i       #retrieve user input from the command line using gets
    
    case selection  #case statement operator to determine response to the input
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4 
        system "clear"
        read_csv
        main_menu
      when 5
        puts "Goodbye"
        
        exit(0)  #terminates the program, 0 signals exit without errors
      
      else              #use else to catch invalid inputs
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
    end
  end  
       
  def view_all_entries
    
    address_book.entries.each do |entry|    #iterate through entries using each
      system "clear"
      puts entry.to_s
      
      entry_submenu(entry)  #display a submenu for each entry
    end
    
    system "clear"
    puts "End of entries"
  end
  
  def create_entry
    
    system "clear"    #clear screen before displying create entry prompts
    puts "New AddressBloc Entry"
    
    print "Name: "
    name = gets.chomp
    print "Phone Number: "
    phone = gets.chomp
    print "Email Address: "
    email = gets.chomp
    
    address_book.add_entry(name, phone, email)  #add new entry with method to ensure it is inserted in the proper order (new_entry is alphabetized)
    
    system "clear"
    puts "New entry created"
  end
  
  def search_entries
    print "Search by name: "    #get the name the user is searching for
    name = gets.chomp
    
    match = address_book.binary_search(name)    #call search on address book class/array,returns match or nil
    system "clear"
    
    if match          #if search returns nil, this evaluates to false and puts the no match found
      puts match.to_s  #if there is a match the helper method is called that displays a sub menu of operations that can be performed on an Entry
      search_submenu(match)
    else
      puts "No match found for #{name}"
    end 
  end 
  
  def read_csv
  
    print "Enter CSV file to import: "
    file_name = gets.chomp              # prompt user get the filename from standard input
    
    if file_name.empty?  # check to see if filename is empty
      system "clear"
      puts "No CSV file read"
      main_menu
    end
    
    begin       # protects program from crash if exception thrown
      entry_count = address_book.import_from_csv(file_name).count
      system "clear"
      puts "#{entry_count} new entries added from #{file_name}"
    rescue      # rescue catches the exception and runs the code below instead of crashing program, calls import_from_csv again on new file
      puts "#{file_name} is not a valid CSV file, please enter the name of valid CSV file"
    end
  end
  
  def delete_entry(entry)       #delete entry from address_book
    address_book.entries.delete(entry)
    puts "#{entry.name} has been deleted"
  end
  
  def entry_submenu(entry)
    
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    
    selection = gets.chomp  #chomp removes any trailing whitespace
    
    case selection
    
      when "n"
        
      when "d"
        
        delete_entry(entry)
        
      when "e"
        
        edit_entry(entry)   #call edit_entry when a user presses "e", then display a sub-menu with entry_submenu
        entry_submenu(entry)
        
      when "m"      #return to main menu
        system "clear"
        main_menu
      else  
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end
  
  def edit_entry(entry)
    
    print "Updated name: "
    name = gets.chomp
    print "Updated phone number: "
    phone_number = gets.chomp
    print "Updated email: "
    email = gets.chomp
              
    entry.name = name if !name.empty?                           #use !attribute.empty? to set attributes on entry only if a valid attribute was read from user input 
    entry.phone_number = phone_number if !phone_number.empty?     
    entry.email = email if !email.empty?
    system "clear"
    
    puts "Updated entry:"
    puts entry
  end
  
  def search_submenu(entry)
    
    puts "\nd - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    
    selection = gets.chomp
    
    case selection    #take specific action based on user input
      when "d"
        system "clear"
        delete_entry(entry)
        main_menu
      when "e"
        edit_entry(entry)
        system "clear"
        main_menu
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        puts entry.to_s
        search_submenu(entry)
    end
  end
end
