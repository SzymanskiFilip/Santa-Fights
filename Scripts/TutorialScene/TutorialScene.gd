extends Node2D

signal add_health

func add_health():
	emit_signal("add_health")
