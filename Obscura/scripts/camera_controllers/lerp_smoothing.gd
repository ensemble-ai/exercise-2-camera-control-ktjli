class_name LerpSmoothing
extends CameraControllerBase

@export var follow_speed:float = 5
@export var  catchup_speed:float = 5
@export var leash_distance:float = 10

func _ready() -> void:
	super()
	position = target.position

func _process(delta: float) -> void:
	if !current:
		return
	
	if draw_camera_logic:
		draw_logic()

	if target.velocity == Vector3.ZERO:
		position = position.lerp(target.position, catchup_speed * delta)
	if position.distance_to(target.position) > leash_distance:
		var direction = (target.position - position).normalized()
		position = target.position - direction * leash_distance
	else:
		position = position.lerp(target.position, follow_speed * delta)
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
