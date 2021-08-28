extends Button

onready var button: Button = $"."

func _ready():
	button.connect("pressed", self, "button_pressed")

func button_pressed():
	get_tree().change_scene("res://Scenes/TutorialScene.tscn")
	pass


