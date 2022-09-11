extends Control

export(String, FILE, "*.tscn") var startScene;

func _on_StartGameButton_pressed():
	var _id = get_tree().change_scene(startScene)


func _on_QuitGameButton_pressed():
	get_tree().quit()
