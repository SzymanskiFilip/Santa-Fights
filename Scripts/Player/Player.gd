extends KinematicBody2D

const speed = 200
const jump = -350
const gravity = 20
const UP = Vector2(0,-1)
var isAttacking = false;

var motion = Vector2()

var projectiles = 0
var bullet = preload("res://Scenes/Objects/Bullet.tscn")

func santa_attack():
		projectiles += 1
		$AnimatedSprite.play("santa_attack")
		var b = bullet.instance()
		b.position = $Position2D.global_position
		get_parent().add_child(b)
		

func _physics_process(_delta):
	motion.y += gravity
	if Input.is_action_pressed("ui_right") && isAttacking == false:
		motion.x = speed
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("santa_run")
	elif Input.is_action_pressed("ui_left") && isAttacking == false:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("santa_run")
		motion.x = -speed
	else:
		motion.x = 0
		if isAttacking == false:
			$AnimatedSprite.play("santa_idle")
		
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = jump
			
	if Input.is_action_just_pressed("attack"):
		isAttacking = true;
		if projectiles <= 2:
			santa_attack()
		else:
			isAttacking = false;
	
	motion = move_and_slide(motion, UP)


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "santa_attack":
		isAttacking = false;
