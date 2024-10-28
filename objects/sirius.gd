extends Area2D

var speed = 5
var velocity = Vector2()
#var moving = True

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2(-speed,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	translate(velocity)

#if moving == True
	#velocity.x = speed
	
func _on_body_entered(body):
	if body.has_method("move_back"):
		body.move_back(12, 318)
