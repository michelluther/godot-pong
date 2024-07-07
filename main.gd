extends Node2D

@export var score_player_1  = 0
@export var score_player_2 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ball_point_for_player_1():
	score_player_1 += 1
	$ScoreBoard/HBoxContainer/VBoxContainer/Score_player_1.text = str(score_player_1)


func _on_ball_point_for_player_2():
	score_player_2 += 1
	$ScoreBoard/HBoxContainer/VBoxContainer2/Score_player_2.text = str(score_player_2)
