require_relative 'entry'

class AddressBook
    attr_reader :entries
    
    def initialize
      @entries = []
        
    end
    
  def remove_entry(name, phone, email)
    delete_entry = nil  #variable to hold entry to be deleted
    
    entries.each do |entry|  #iterate over each entry and check to see if entry matches the info
      if name == entry.name && phone == entry.phone_number && email = entry.email
        delete_entry = entry #assign the matching value to delete_entry, then delete
      end 
    end
  
  entries.delete(delete_entry)
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
  
##  def remove_entry(name, phone_number, email)
    
#    entries.each_with_index do |entry, index|
#      if name == entry.name
#        entries.delete_at(index)    
#      end
#    end
#  end
end
