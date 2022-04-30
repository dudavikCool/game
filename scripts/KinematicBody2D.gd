extends KinematicBody2D

const SPEED = 100

func _physics_process(delta):
	var vector = Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), 
	Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")).normalized()
	move_and_slide(vector * SPEED, Vector2.UP)

func _on_Area2D_area_entered(area):
	if not $Area2D.get_overlapping_bodies():
		makePoint()
	
func _on_Area2D_area_exited(area):
	if not $Area2D.get_overlapping_bodies():
		makeMan()
	
func _on_Area2D_body_entered(body):
	$Sprite.z_index = 1
	
func _on_Area2D_body_exited(body):
	$Sprite.z_index = 0
	
func makePoint():
	$Sprite.z_index = 1
	$Sprite.position = Vector2.ZERO
	$Sprite.hframes = 1
	$Sprite.texture = load("res://point.png")
	
func makeMan():
	$Sprite.z_index = 0
	$Sprite.position = Vector2(-10, 0)
	$Sprite.hframes = 8
	$Sprite.texture = load("res://bSpearman_Idle_strip8.png")
