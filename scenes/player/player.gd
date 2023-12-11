extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true
var player_direction: Vector2 = Vector2.ZERO

@export var max_speed: int = 500
var player_speed: int = max_speed

signal player_laser(pos, direction)
signal player_grenade(pos, direction)

func _process(_delta):
	
	# input
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * player_speed
	move_and_slide()
	
	# player rotation
	look_at(get_global_mouse_position())
	player_direction = (get_global_mouse_position() - position).normalized()
	
	# laser shooting input
	if(Globals.has_laser() and Input.is_action_pressed("Primary Action") and can_laser):
		Globals.reduce_laser_count()
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$LaserTimer.start()
		var pos = selected_laser.global_position
		player_laser.emit(pos, player_direction)
		$GPUParticles2D.emitting = true

	if(Globals.has_grenade() and Input.is_action_pressed("Secondary Action") and can_grenade):
		Globals.reduce_grenade_count()
		var grenade_marker = $GrenadeStartPosition
		can_grenade = false
		$GrenadeTimer.start()
		var pos = grenade_marker.global_position
		player_grenade.emit(pos, player_direction)


func _on_laser_timer_timeout():
	can_laser = true
	
func _on_grenade_timer_timeout():
	can_grenade = true
