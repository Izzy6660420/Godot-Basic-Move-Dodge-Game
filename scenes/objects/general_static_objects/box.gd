extends StaticGenericObject

func hit():
	
	if not opened:
		$LidSprite.hide()
		opened = true
		for i in range(item_count_in_container):
			var pos = $SpawnPositions.get_child(randi()%$SpawnPositions.get_child_count()).global_position
			open.emit(pos, curr_direction)
