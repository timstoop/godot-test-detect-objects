extends Node2D

var detector = preload("res://Detector.tscn")

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.is_pressed():
		detect_at_position(get_global_mouse_position())


func detect_at_position(loc: Vector2):
	var detect = detector.instance()
	detect.position = loc
	add_child(detect)
	var colliding_objects: Array = detect.get_overlapping_bodies()
	detect.free()
	$Label.text = "Found: "+str(colliding_objects.size())
