extends Area2D





# сигнал срабатывает когда сцена входит в Area2D_coin
func _on_body_entered(body: Node2D) -> void:
	# body - сцена которая вошла
	print(body)
	# получаем имя сцены
	print(body.name)

	if(body.name == "CharacterBody2D"):
		# получаем и меняем переменную в сцене
		#body.position.y -= 300
		body.num_coin += 1
		body.label_coin.text = "coin " + str(body.num_coin)
		
		
		
		#body.audio_coin.play()
		body.audio_coin.playing = true
	
		
		
		# удаляем эту сцену
		queue_free()
		#self.queue_free()
		#body.queue_free()
