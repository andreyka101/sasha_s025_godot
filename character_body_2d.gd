extends CharacterBody2D



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
	if(Input.is_action_pressed("key_left")):
		position.x -= 400 * delta
	if(Input.is_action_pressed("key_right")):
		position.x += 400 * delta
		
	

	# включаем гравитацию если игрок не стоит на земле
	#print(is_on_floor())
	if(not is_on_floor()):
		position.y += 400 * delta
		
	
	#print(delta)
	print(400 * delta)
	

	# move_and_slide() - обязательная функция нужна для скольжения тел друг о друга
	move_and_slide()
	
