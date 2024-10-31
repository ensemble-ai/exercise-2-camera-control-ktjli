class_name TargetFocus
extends CameraControllerBase

@export var lead_speed:float = 8
@export var catchup_delay_duration:float = 0.5
@export var catchup_speed:float = 5
@export var leash_distance:float = 10

var movement_timer: float = 0.0
var is_moving: bool = false

func _ready() -> void:
	super()
	position = target.position

func _process(delta: float) -> void:
	if !current:
		return

	if draw_camera_logic:
		draw_logic()
		
	var tpos = target.global_position
	var cpos = global_position

	var input_direction = Vector3.ZERO
	input_direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_direction.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	if input_direction != Vector3.ZERO:
		is_moving = true
		movement_timer = 0.0  # Reset timer on movement
		var target_offset = input_direction.normalized() * leash_distance
		position = tpos + target_offset
	else:
		is_moving = false
		movement_timer += delta

		if movement_timer >= catchup_delay_duration:
			target.position = target.position.lerp(tpos, catchup_speed * delta)

	# Enforce leash distance
	var distance_to_player = cpos.distance_to(tpos)
	if distance_to_player > leash_distance:
		var direction_to_player = (cpos - tpos).normalized()
		#target.position = tpos + direction_to_player * leash_distance

	# Move the camera towards the target position
	global_position = global_position.lerp(target.position, lead_speed * delta)

	super(delta)


func draw_logic() -> void:
	var mesh_instance := MeshInstance3D.new()
	var immediate_mesh := ImmediateMesh.new()
	var material := ORMMaterial3D.new()
	
	mesh_instance.mesh = immediate_mesh
	mesh_instance.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	
	var left:float = 5
	var right:float = -5
	var top:float = 5
	var bottom:float = -5
	
	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES, material)
	immediate_mesh.surface_add_vertex(Vector3(2.5,0,0))
	immediate_mesh.surface_add_vertex(Vector3(-2.5,0,0))
	
	immediate_mesh.surface_add_vertex(Vector3(0,0,2.5))
	immediate_mesh.surface_add_vertex(Vector3(0,0,-2.5))
	
	immediate_mesh.surface_end()

	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = Color.WHITE
	
	add_child(mesh_instance)
	mesh_instance.global_transform = Transform3D.IDENTITY
	mesh_instance.global_position = Vector3(global_position.x, target.global_position.y, global_position.z)
	
	#mesh is freed after one update of _process
	await get_tree().process_frame
	mesh_instance.queue_free()
