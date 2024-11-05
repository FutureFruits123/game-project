extends Area2D

var speed = 2
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#velocity = Vector2(-speed,0)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.arnebDirection == 1:
		velocity = Vector2(-speed,0)
		translate(velocity)
	elif Global.arnebDirection == 2:
		velocity = Vector2(speed,0)
		translate(velocity)
	else:
		pass

func _on_body_entered(body):
	if body.has_method("move_back"):
		body.move_back(12, 318)