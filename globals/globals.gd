extends Node

signal stat_change

var laser_count: int = 20:
	get:
		return laser_count
	set(value):
		laser_count = value
		stat_change.emit()
	
var grenade_count: int = 5:
	get:
		return grenade_count
	set(value):
		grenade_count = value
		stat_change.emit()
		
var player_health: int = 60:
	get:
		return player_health
	set(value):
		player_health = value
		stat_change.emit()

func reduce_laser_count() -> void:
	laser_count -= 1
	
func reduce_grenade_count() -> void:
	grenade_count -= 1
	
func has_laser() -> bool:
	return laser_count > 0
	
func has_grenade() -> bool:
	return grenade_count > 0
