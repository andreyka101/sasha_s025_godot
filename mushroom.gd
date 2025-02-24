extends CharacterBody2D


# получаем игрока
@onready var player:CharacterBody2D = $"../CharacterBody2D"

var near_player = false




func _process(delta: float) -> void:
	
	# если игрок рябом двигаемся к нему
	if(player.position.x < self.position.x and near_player):
		self.velocity.x = -300
	if(player.position.x > position.x and near_player):
		velocity.x = 300
	
	
	
	# гравитация
	if(not is_on_floor()):
		velocity.y += 1300 * delta
	
	
	move_and_slide()





	


func _on_area_2d_body_entered(body: Node2D) -> void:


func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body.name == "CharacterBody2D"):
		near_player = true
	pass # Replace with function body.
