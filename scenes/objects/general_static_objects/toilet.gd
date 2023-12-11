extends StaticGenericObject

func hit():
	
	if not opened:
		$LidSprite.hide()
		
		var pos = $SpawnPositions.global_position	
		open.emit(pos, curr_direction)
		opened = true
