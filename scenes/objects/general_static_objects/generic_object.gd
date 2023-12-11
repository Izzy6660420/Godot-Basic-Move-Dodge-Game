extends StaticBody2D
class_name StaticGenericObject

@export var item_count_in_container: int = 5
var opened: bool = false

signal open(pos, direction)

@onready var curr_direction: Vector2 = Vector2.DOWN.rotated(rotation)
