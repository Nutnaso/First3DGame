extends Node3D

@export var mob_scene: PackedScene
@onready var player = $Player
@onready var sun = $DirectionalLight3D

var timer := 0.0
var interval := 1/60
var rotation_speed := deg_to_rad(1)

func _process(delta):
	$MainFloor/Boss/AnimationPlayer.play("CharacterArmature|Flying_Idle")
	timer += delta
	if timer >= interval:
		timer = 0
		sun.rotate_x(rotation_speed)
		var rot = sun.rotation
		rot.x = fmod(rot.x, TAU)
		sun.rotation = rot

func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	mob.squashed.connect($UserInterface/ScoreLabel._on_mob_squashed.bind())
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	mob_spawn_location.progress_ratio = randf()
	var player_position = player.position
	mob.initialize(mob_spawn_location.position, player_position)
	add_child(mob)

func _on_player_hit():
	$MobTimer.stop()
