extends CharacterBody2D


@onready var sprite:AnimatedSprite2D = get_node("AnimatedSprite2D")

var num_jump = 0


# метод _process - вызывается с каждым тактом процессора нужна для вычисления чего либо
func _process(delta: float) -> void:
	#print("hi")
	#print(position)
	#position.x += 2
	

	#if(position.y < 570):
		# гравитация
		#position.y += 2
	

	# Input.is_action_pressed - обрабатывает зажатие клавиш
	#print(Input.is_action_pressed("key_left"))
	# Input.is_action_just_pressed - обрабатывает клик клавиш
	#print(Input.is_action_just_pressed("key_left"))
	# Input.is_action_just_pressed - обрабатывает отжатие клавиш
	#print(Input.is_action_just_released("key_left"))
	

	# движение игрока влево или право 
	if(Input.is_action_pressed("key_left") and velocity.y == 0):
		# движение через position
		#self.position.x -= 400 * delta
		# движение через velocity
		velocity.x = -400
		# переворачиваем спрайт
		sprite.flip_h = true
		sprite.play("anime_run")
		
	elif(Input.is_action_pressed("key_right") and velocity.y == 0):
		# движение через position
		#position.x += 400 * delta
		# движение через velocity
		velocity.x = 400
		# переворачиваем спрайт
		sprite.flip_h = false
		sprite.play("anime_run")
	
	else :
		velocity.x = 0
		if(velocity.y == 0):
			sprite.play("anime_idel")

		
		
	# прыжок игрока через position 
	#if(Input.is_action_just_pressed("key_up")):
		#position.y = 300
		#num_jump = 900
	#if(num_jump != 0):
		#position.y -= num_jump * delta
		#num_jump -= 10
		
	
	
	# прыжок игрока через velocity
	if(velocity.y != 0):
		sprite.play("anime_flight")
	if(Input.is_action_pressed("key_up") and is_on_floor()):
		#sprite.play("anime_jump")
		velocity.y = -600
		
	

	# скорость по y 
	print(velocity.y)


	# включаем гравитацию если игрок не стоит на земле
	#print(is_on_floor())
	if(not is_on_floor()):
		#print(velocity.y)
		#position.y += 400 * delta
		velocity.y += 1300 * delta
		
	
	#print(delta)
	#print(400 * delta)
	
	
	
	if(Input.is_action_just_pressed("key_teleport_t")):
		# position - меняет координаты в следующий кадр
		#position.x = 400

		# velocity - постоянная скорость объекта
		velocity.x = 200
	
	
	

	# move_and_slide() - обязательная функция нужна для скольжения тел друг о друга
	move_and_slide()
