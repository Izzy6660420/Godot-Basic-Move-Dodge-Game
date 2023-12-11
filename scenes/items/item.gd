extends Area2D

@export var rotation_speed: int = 3

@export_group("item_colors")
@export var laser_color: Color = Color(0,0,1)
@export var grenade_color: Color = Color(1,0,0)
@export var health_color: Color = Color(0,1,0)

@export_group("dev_force_item")
@export var only_laser: bool = false
@export var only_grenade: bool = false
@export var only_health: bool = false

var direction: Vector2
var distance: int = randi_range(150, 250)

var options = ['laser', 'laser', 'laser', 'laser', 'grenade', 'health']
var type = options[randi()%len(options)]

func _ready():
	type = 'laser' if only_laser else 'grenade' if only_grenade else 'health' if only_health else type
	$Sprite2D.modulate = laser_color if type == 'laser' else grenade_color if type == 'grenade' else health_color
	
	#tween
	var target_pos = position + direction * distance
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", target_pos, 0.5)
	tween.tween_property(self, "scale", Vector2(1,1), 0.3).from(Vector2(0,0))

func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(_body):
	if type == 'laser':
		Globals.laser_count += 5
	elif type == 'grenade':
		Globals.grenade_count += 1
	elif type == 'health': 
		Globals.player_health += 10
	else: pass
	
	queue_free()
