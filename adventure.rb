require "./rooms"
VERB_LIST = ["look", "move"]
$current_room = nil
# need enter room function?
def display_message(message)
  puts message
end

def request_input()
 display_message("What would you like to do? (Use look at + OBJECT)")
 player_input = gets.chomp
 #downcase and split input into array of words
 split_input = player_input.downcase.split
 #verb is first value in array
 verb = split_input.first
 object = split_input.last
 #check if input is in list of verbs
 if(VERB_LIST.include?(verb))
  #call verb method
  send(verb, object)
  request_input
 else
  display_message("Sorry, I don't understand '#{player_input}'")
  request_input
 end
end

def enter_room(room)
  $current_room = room
  p "Entering #{$current_room["name"]}."
end

def look(object)
  if object == "look"
    p "No object to look at."
  else
    #p "looking at " + object
    # get description
    p $current_room["objects"][object]["description"]
  end
end

def move(direction)
  if direction == "move"
    p "No object to move to."
  else
    p "moving to " + direction
  end
end
enter_room($test_room)
p $current_room["name"]
#p $current_room["objects"]["table"]["description"]
request_input()