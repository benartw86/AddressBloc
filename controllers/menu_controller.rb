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
    puts "4 - View entry number"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
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
        search_by_number
        main_menu
      when 5 
        system "clear"
        read_csv
        main_menu
      when 6
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
  end
  
  def search_by_number
    print "Which entry number would you like to view? "
    selection = gets.chomp.to_i
      if selection < address_book.entries.count
        puts "You selected #{selection}"
        puts address_book.entries[selection]
        puts "To exit type any letter!"
        gets.chomp
        system "clear"
      else  
        puts "Please enter a valid number!"
        search_by_number
      end
  end
  
  def read_csv
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
        
      when "e"
        
      when "m"      #return to main menu
        system "clear"
        main_menu
      else  
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end
end 