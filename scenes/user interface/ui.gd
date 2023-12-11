extends CanvasLayer

# colors
var green: Color = Color("6bbfa3")
var red: Color = Color(0.9, 0, 0, 1)

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/Label
@onready var laser_icon: TextureRect = $LaserCounter/VBoxContainer/TextureRect
@onready var grenade_icon: TextureRect = $GrenadeCounter/VBoxContainer/TextureRect
@onready var health_bar: TextureProgressBar = $MarginContainer/TextureProgressBar

func _ready():
	Globals.connect("stat_change", update_health_bar)
	Globals.connect("stat_change", update_laser_text)
	Globals.connect("stat_change", update_grenade_text)
	
	update_laser_text()
	update_grenade_text()
	update_health_bar()

func update_laser_text() -> void:
	laser_label.text = str(Globals.laser_count)
	update_color(Globals.has_laser(), laser_label, laser_icon)

func update_grenade_text() -> void:
	grenade_label.text = str(Globals.grenade_count)
	update_color(Globals.has_grenade(), grenade_label, grenade_icon)

func update_health_bar() -> void:
	health_bar.value = Globals.player_health

func update_color(not_nil: bool, label: Label, icon: TextureRect) -> void:
	label.modulate = green if not_nil else red
	icon.modulate = green if not_nil else red
	
