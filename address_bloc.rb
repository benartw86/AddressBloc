require_relative 'controllers/menu_controller'


menu = MenuController.new  #create a new controller when AddressBloc starts

system "clear"  #used to clear the command line

puts "Welcome to Address Bloc!"


menu.main_menu #calls main_menu to display the menu