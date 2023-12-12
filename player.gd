extends CharacterBody2D

var speed = 300
var bonus=0
var is_right = false
var can_damage = true
var can_run = false
var health = 100
var healthbar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):	
	velocity = Vector2(
		(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * (speed+bonus),
		(Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")) * (speed+bonus))

	if can_run == true:
		if Input.is_action_pressed("shift"):
			bonus = 1000
		else:
			bonus = 0
			
	move_and_slide()
