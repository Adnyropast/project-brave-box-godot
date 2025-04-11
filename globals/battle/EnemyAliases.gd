extends Node

class_name EnemyAliases

static func create_aliases(enemies: Array[Enemy]):
	var map = []
	var indices = []
	
	for enemy in enemies:
		var data = null
		
		for item in map:
			if item[0] == enemy:
				data = item
				break
		
		if not data:
			data = [enemy, 0]
			map.append(data)
		
		indices.append(data[1])
		data[1] = data[1] + 1
	
	var res = []
	var i = 0
	
	for enemy in enemies:
		var count = 1
		
		for item in map:
			if item[0] == enemy:
				count = item[1]
				break
		
		if count > 1:
			var index = indices[i]
			
			res.append(enemy.name + " " + n_alphabet(index))
		else:
			res.append(enemy.name)
		
		i = i + 1
	
	return res

static func n_alphabet(n: int):
	return char(65 + n)
