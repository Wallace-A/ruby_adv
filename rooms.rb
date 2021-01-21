$rooms = {
 "test_room" => {
    "name" => "test room",
    "look" => "You are in a room.",
    "objects" => {
      "table" => {
        "description" => "The table is made from rotting wood."
      },
    },
    "exits" => {"north" => "north_room", "west" => "west_room"}
  },

  "north_room" => {
    "name" => "north room",
    "look" => "You are in north room.",
    "objects" => {
      "table" => {
        "description" => "The table is made from rotting wood."
      },
    },
    "exits" => {"south" => "test_room", "west" => "west_room"}
  }
}
$test_thing = "what?"