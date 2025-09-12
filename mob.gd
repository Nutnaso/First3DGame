extends CharacterBody3D


signal squashed

@export var min_speed = 5
@export var max_speed = 10
@export var damage = 1  # เพิ่ม damage ของ Mob
@onready var despawn_timer = $DespawnTimer


func initialize(start_position, player_position):
	# วาง mob และหันไปหาผู้เล่น
	look_at_from_position(start_position, player_position, Vector3.UP)
	rotate_y(randf_range(-PI / 4, PI / 4))
	
	# ความเร็วสุ่ม
	var random_speed = randi_range(min_speed, max_speed)
	velocity = Vector3.FORWARD * random_speed
	velocity = velocity.rotated(Vector3.UP, rotation.y)
	
	position = start_position

func squash():
	squashed.emit()
	queue_free()

func _physics_process(_delta):
	$"Pivot/Root Scene/AnimationPlayer".play("CharacterArmature|Fast_Flying")
	move_and_slide()  # ไม่มี arguments, velocity ถูกใช้จาก property ของ CharacterBody3D

func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()


func _on_despawn_timer_timeout() -> void:
	queue_free()
