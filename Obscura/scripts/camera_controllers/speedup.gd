class_name Speedup
extends CameraControllerBase


@export var push_ratio:float = 5
@export var pushbox_top_left:Vector2
@export var pushbox_bottom_right:Vector2
@export var speedup_zone_top_left:Vector2
@export var speedup_zone_bottom_right:Vector2
@export var box_width:float = 10.0
@export var box_height:float = 10.0

func _ready() -> void:
	super()
	position = target.position
	

func _process(delta: float) -> void:
	if !current:
		return
	
	if draw_camera_logic:
		draw_logic()
	
	if target:
		var target_velocity = target.velocity
		var target_pos = target.position
		
		if target_pos.x > speedup_zone_top_left.x and target_pos.x < speedup_zone_bottom_right.x and target_pos.y > speedup_zone_top_left.y and target_pos.y < speedup_zone_bottom_right.y:
			return
		
		var camera_movement = Vector2.ZERO
		
		var touching_left = target_pos.x <= pushbox_top_left.x
		var touching_right = target_pos.x >= pushbox_bottom_right.x
		var touching_top = target_pos.y <= pushbox_top_left.y
		var touching_bottom = target_pos.y >= pushbox_bottom_right.y
		
		if touching_left:
			camera_movement.x = target_velocity.x * push_ratio
		elif touching_right:
			camera_movement.x = target_velocity.x
		
		if touching_top:
			camera_movement.y = target_velocity.y * push_ratio
		elif touching_bottom:
			camera_movement.y = target_velocity.y
		
		camera_movement = target_velocity * push_ratio
		position += camera_movement * delta

	super(delta)


func draw_logic() -> void:
	var mesh_instance := MeshInstance3D.new()
	var immediate_mesh := ImmediateMesh.new()
	var material := ORMMaterial3D.new()
	
	mesh_instance.mesh = immediate_mesh
	mesh_instance.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	
	var left:float = -box_width / 2
	var right:float = box_width / 2
	var top:float = -box_height / 2
	var bottom:float = box_height / 2
	
	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES, material)
	immediate_mesh.surface_add_vertex(Vector3(right, 0, top))
	immediate_mesh.surface_add_vertex(Vector3(right, 0, bottom))
	
	immediate_mesh.surface_add_vertex(Vector3(right, 0, bottom))
	immediate_mesh.surface_add_vertex(Vector3(left, 0, bottom))
	
	immediate_mesh.surface_add_vertex(Vector3(left, 0, bottom))
	immediate_mesh.surface_add_vertex(Vector3(left, 0, top))
	
	immediate_mesh.surface_add_vertex(Vector3(left, 0, top))
	immediate_mesh.surface_add_vertex(Vector3(right, 0, top))
	immediate_mesh.surface_end()

	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = Color.BLACK
	
	add_child(mesh_instance)
	mesh_instance.global_transform = Transform3D.IDENTITY
	mesh_instance.global_position = Vector3(global_position.x, target.global_position.y, global_position.z)
	
	#mesh is freed after one update of _process
	await get_tree().process_frame
	mesh_instance.queue_free()