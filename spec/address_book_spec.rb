require_relative '../models/address_book'

RSpec.describe AddressBook do
    describe "attributes" do
      it "respond to entries" do
        book = AddressBook.new
        expect(book).to respond_to(:entries)
    end
    
    it "initializes entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_an(Array)
    end
    
    it "initializes entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq(0)
    end
  end
  
  describe "#add_entry" do
     it "adds only one entry to the address book" do
       book = AddressBook.new
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
 
       expect(book.entries.size).to eq(1)
     end
 
     it "adds the correct information to entries" do
       book = AddressBook.new
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       new_entry = book.entries[0]
 
       expect(new_entry.name).to eq('Ada Lovelace')
       expect(new_entry.phone_number).to eq('010.012.1815')
       expect(new_entry.email).to eq('augusta.king@lovelace.com')
     end
   end
   
##  describe "#remove_entry" do
#    it "removes only one entry from the address book" do
#      book = AddressBook.new
#      book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
    
#     expect(book.entries.size).to eq(0)
#    end
#   end 
 
  it "removes an entry using name, phone number and email address" do
    book = AddressBook.new
    book.add_entry("Ben", "123.456.789", "bendo@yahoo.com")
    
    #create second entry to have one to delete
    name = 'Ada Lovelace'
    phone_number = '010.012.1815'
    email_address = 'augusta.king@lovelace.com'
    book.add_entry(name, phone_number, email_address) #add in second entry
    
    expect(book.entries.size).to eq(2)  #confirm that there are two addresses in entries array
    book.remove_entry(name, phone_number, email_address)  #remove the requested address
    expect(book.entries.size).to eq(1)  #confirm that there is now one entry
    expect(book.entries.first.name).to eq("Ben")  #confirm that entry matches the one that should still be in the array 
  end
 end