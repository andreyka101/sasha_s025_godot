extends CharacterBody2D


# получаем игрока
@onready var player:CharacterBody2D = $"../CharacterBody2D"
@onready var sprite:AnimatedSprite2D = $AnimatedSprite2D

var near_player = false




func _process(delta: float) -> void:
	
	# если игрок рябом двигаемся к нему
	if(player.position.x < self.position.x - 50 and near_player):
		self.velocity.x = -300
		sprite.flip_h = true
		sprite.play("run")
	elif(player.position.x > position.x + 50 and near_player):
		velocity.x = 300
		sprite.flip_h = false
		sprite.play("run")
	else:
		sprite.play("idel")
		velocity.x = 0
		
	
	
	# is_on_ceiling() - возвращает true если сцена касается потолка
	#print(is_on_ceiling())
	# is_on_wall() - возвращает true если сцена касается стены
	#print(is_on_wall())
	# гриб прыгает если касается стены
	if(is_on_wall()):
		velocity.y = -500
	
	

	# гравитация
	if(not is_on_floor()):
		velocity.y += 1300 * delta
		
		
	
	# уменьшаем скорость толчка игрока по оси x
	if(player.hit_push):
		if(player.position.x < self.position.x):
			player.velocity.x += 200 * delta
			if(player.velocity.x >= -100):
				player.hit_push = false
		if(player.position.x > self.position.x):
			player.velocity.x -= 200 * delta
			if(player.velocity.x <= 100):
				player.hit_push = false
		
	
	
	


	move_and_slide()


	

	


func _on_area_2d_body_entered(body: Node2D) -> void:
	# проверим рядом ли игорок
	if(body.name == "CharacterBody2D"):
		near_player = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	# проверим рядом ли игорок
	if(body.name == "CharacterBody2D"):
		near_player = false
	


func _on_area_2d_attack_body_entered(body: Node2D) -> void:
	# если игрок зашёл в зону атаки тогда толкаем его
	if(body.name == "CharacterBody2D"):
		player.num_hp -=200
		player.velocity.y = -900
		if(player.position.x < self.position.x):
			player.velocity.x = -500
		if(player.position.x > self.position.x):
			player.velocity.x = 500
		player.hit_push = true



# гриб умирает если игрок его атакует 
func _on_area_2d_dead_body_entered(body: Node2D) -> void:
	if(body.name == "CharacterBody2D"):
		queue_free()





		
