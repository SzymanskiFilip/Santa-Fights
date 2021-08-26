extends Button

onready var button = $"."

func _process(_delta):
	if button.is_hovered():
		print("HOVERED")
	else:
		button.add_color_override("font_color", Color(255,255,255,1))
		print("UNHOVER")
