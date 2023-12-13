extends Node

const LEVEL_1_INIT_POS = Vector2(-275, 200)
const PLAYER_SCALE = Vector2(2.5, 2.5)

const PLAYER = preload("res://player/player.tscn")

var player

func init_player():
	player = PLAYER.instantiate()
	player.global_position = LEVEL_1_INIT_POS
	player.scale = PLAYER_SCALE
	self.add_child(player)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	init_player()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var map = get_child(0)
	if map != null:
		var tilemap = map.get_child(1)
		if tilemap != null && player != null:
			var cell = tilemap.local_to_map(player.global_position)
			var id = tilemap.get_cell_source_id(0, cell)
