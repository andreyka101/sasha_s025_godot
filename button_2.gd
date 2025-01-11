extends Button




func _on_pressed() -> void:
	position.y += 20
	position.x = 10
	size.x = 500
	print(size.x)
	
	pivot_offset.x = size.x / 2
	pivot_offset.y = size.y / 2

	rotation += 1
	
	#text = "hello"
	#text = position.y
	
	#for i in range(10):
		#print(i)
