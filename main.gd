extends Node3D

#@onready var sun = $DirectionalLight3D
#@onready var player = $player
#
#
#var timer := 0.0
#var interval := 1/60 # 0.5 วินาที
#var rotation_speed := deg_to_rad(1) # หมุนทีละ 10 องศาทุก 0.5 วินาที
#
#func _process(delta):
	#timer += delta
	#if timer >= interval:
		#timer = 0
		#sun.rotate_x(rotation_speed)
		## Clamp ค่าการหมุนให้อยู่ในช่วง 0 - 2*PI (0 - 360 องศา)
		#var rot = sun.rotation
		#rot.x = fmod(rot.x, TAU) # TAU = 2 * PI
		#sun.rotation = rot
