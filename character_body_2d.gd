extends CharacterBody2D


@onready var sprite:AnimatedSprite2D = get_node("AnimatedSprite2D")
@onready var camera:Camera2D = $Camera2D
@onready var label_coin:Label = $"../CanvasLayer/Label_coin"
@onready var audio_coin:AudioStreamPlayer = $AudioStreamPlayer
@onready var label_hp:Label = $"../CanvasLayer/Label_hp_player"


var num_jump:int = 0
var num_coin:int = 0
var num_hp = 100
var hit_push = false



# метод _process - вызывается с каждым тактом процессора нужна для вычисления чего либо
func _process(delta: float) -> void:
	#label_coin.text = "coin " + str(num_coin)
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
		# движение через position
		#self.position.x -= 400 * delta
		# движение через velocity
		velocity.x = -400
		# переворачиваем спрайт
		sprite.flip_h = true
		# анимируем движение игрока
		sprite.play("anime_run")
		
		camera.rotation = -3 * delta
		
	elif(Input.is_action_pressed("key_right")):
		# движение через position
		#position.x += 400 * delta
		# движение через velocity
		velocity.x = 400
		# переворачиваем спрайт
		sprite.flip_h = false
		# анимируем движение игрока
		sprite.play("anime_run")
		
		camera.rotation = 3 * delta
	
	elif(not hit_push):
		velocity.x = 0
		sprite.play("anime_idel")

		camera.rotation = 0
		
		
	# прыжок игрока через position 
	#if(Input.is_action_just_pressed("key_up")):
		#position.y = 300
		#num_jump = 900
	#if(num_jump != 0):
		#position.y -= num_jump * delta
		#num_jump -= 10
		
	
	
	# анимации падения и прыжка игрока
	if(velocity.y > 0):
		sprite.play("anime_flight")
	if(velocity.y < 0):
		sprite.play("anime_jump")


	# прыжок игрока через velocity
	if(Input.is_action_pressed("key_up") and is_on_floor()):
		velocity.y = -700
		
	

	# скорость по y 
	#print(velocity.y)


	# is_on_floor() - возвращает true если сцена касается земли


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
		
		
	# отображаем количество hp
	label_hp.text = "hp "+ str(num_hp)
	
	
	
	
	# если hp игрока меньше или ровно нулю тогда меняем сцену
	if(num_hp <= 0):
		# get_tree() - дерево сцен
		#print(get_tree())
		
		# меняем сцену
		get_tree().change_scene_to_file("res://game_over.tscn")
	
	
	
	

	# move_and_slide() - обязательная функция нужна для скольжения тел друг о друга
	move_and_slide()
