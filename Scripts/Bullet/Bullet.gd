extends Area2D

var speed = 200
signal bullet_crashed

func _ready():
	$AnimatedSprite.play("bullet")

func _physics_process(delta):
	position += transform.x * speed * delta
	


func _on_Bullet_body_entered(body):
	queue_free()
	emit_signal("bullet_crashed")
	print("DELETED")
