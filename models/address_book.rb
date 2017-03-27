require_relative 'entry'
require 'csv'

class AddressBook
    attr_reader :entries
    
    def initialize
      @entries = []
        
    end

  def add_entry(name, phone_number, email)
    
    index = 0    #create a variable to store insertion index
    entries.each do |entry|
    
      if name < entry.name   #compare name with the name of current entry
        break                #if name proceeds entry.name stop and insert it
      end
      index += 1             #of name does not proceed entry.name continue comparing
  end
    
    entries.insert(index, Entry.new(name, phone_number, email))     #insert a new entry into entries using the calculated index variable
  end
  
  def import_from_csv(file_name)
    
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)   #CSV class parses the file, the result being an object of type CSV::Table
    
    csv.each do |row|           # iterate over CSV::Table object's rows
      row_hash = row.to_hash    # create a hash for each row
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])  #convert each row_hash to an entry by using add_entry method
                                                                         #which adds the entry to the AddressBook entries
    end
  end
end 
