extends RigidBody2D

var can_combine := false

func _on_area_2d_body_entered(body):
	if body.is_in_group("tree3") and can_combine:
		var tree4 = preload("res://Scenes/Game/Trees/tree_4.tscn").instantiate()
		tree4.call_deferred("set_position", position)
		tree4.add_to_group("tree6")
		get_parent().get_parent().tree = tree4
		get_parent().get_parent().collision = true
		body.queue_free()
		queue_free()

func _on_area_2d_area_entered(area):
	if area.name == "combine_area":
		can_combine = true