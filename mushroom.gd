extends CharacterBody2D


# получаем игрока
@onready var player:CharacterBody2D = $"../CharacterBody2D"
@onready var sprite:AnimatedSprite2D = $AnimatedSprite2D

var near_player = false
var dead_mushroom = false
var attack_mushroom = false




func _process(delta: float) -> void:
	
	# если игрок рябом двигаемся к нему
	if(player.position.x < self.position.x - 50 and near_player and not dead_mushroom and not attack_mushroom):
		self.velocity.x = -300
		sprite.flip_h = true
		sprite.play("run")
	elif(player.position.x > position.x + 50 and near_player and not dead_mushroom and not attack_mushroom):
		velocity.x = 300
		sprite.flip_h = false
		sprite.play("run")
	elif(not dead_mushroom and not attack_mushroom): 
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
		attack_mushroom=true
		sprite.play("attack")
		
		# await - ждет ответ пока ответа нет строки ниже не работают в этой функции
		# get_tree().create_timer(s).timeout - таймер на s секунд
		await get_tree().create_timer(0.1).timeout
		player.num_hp -=20
		player.velocity.y = -900
		if(player.position.x < self.position.x):
			player.velocity.x = -500
		if(player.position.x > self.position.x):
			player.velocity.x = 500
		player.hit_push = true

		# await - ждет ответ пока ответа нет строки ниже не работают в этой функции
		# .animation_finished - ждёт пока закончится анимация
		await sprite.animation_finished
		attack_mushroom=false
		



# гриб умирает если игрок его атакует 
func _on_area_2d_dead_body_entered(body: Node2D) -> void:
	if(body.name == "CharacterBody2D"):
		dead_mushroom = true
		sprite.play("death")

		# await - ждет ответ пока ответа нет строки ниже не работают в этой функции
		# .animation_finished - ждёт пока закончится анимация
		await sprite.animation_finished
		queue_free()
		
		

		# пример работы await
		#print("a1")

		# await - ждет ответ пока ответа нет строки ниже не работают в этой функции
		# get_tree().create_timer(s).timeout - таймер на s секунд
		#await get_tree().create_timer(3).timeout
		#print("b2")
		#print("c3")





		
