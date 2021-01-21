require "./rooms"
VERB_LIST = ["look at", "move"]
DIRECTIONS = ["north", "south", "east", "west"]
$current_room = nil
# need enter room function?
def display_message(message)
  puts message
end
#TODO: REQUEST VERB/OBJECT ARE SEPARATE FUNCTIONS THAT RETURN A VALUE TO SEND
def request_input()
 display_message("What would you like to do? [LOOK AT|MOVE|PICK UP|USE]")
 player_verb = gets.chomp.downcase
 #check if input is in list of verbs
 if(VERB_LIST.include?(player_verb))
  #ask for object to verb
  puts "What would you like to #{player_verb}?"
  player_object = gets.chomp.downcase
  joined_player_verb = player_verb.split.join("_")
  send(joined_player_verb, player_object)
  request_input
 else
  display_message("Sorry, I don't understand '#{player_verb}'")
  request_input
 end

end


def enter_room(room)
  $current_room = $rooms[room]
  "Entering #{$current_room["name"]}."
  puts $current_room["look"]
end

def look_at(object_name)
  # TODO: resuable method for finding object to use
  object = $current_room["objects"][object_name]
  if object
    puts object["description"]
  else
    puts "There is no #{object_name} to look at."
  end
end

def move(direction)
  #accepts directions of exits
  if DIRECTIONS.include?(direction)
    new_room = room = $current_room["exits"][direction]
    if new_room
      enter_room(room)
    else
      puts "Sorry, I can't go #{direction}"
    end
  else
    p "Can't move #{direction}"
  end
end
enter_room("test_room")
p $current_room["name"]
#p $current_room["objects"]["table"]["description"]
request_input()