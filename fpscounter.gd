extends Node

var fps_label: Label
var show_fps: bool = false

func _ready():
	var canvas_layer = CanvasLayer.new()
	add_child(canvas_layer)
	
	fps_label = Label.new()
	canvas_layer.add_child(fps_label)
	
	# Set basic properties
	fps_label.text = "FPS: 0"
	fps_label.add_theme_color_override("font_color", Color.WHITE)
	fps_label.add_theme_font_size_override("font_size", 4)
	
	# Position the label
	position_label()
	
	# Initially hide the FPS label
	fps_label.hide()

func position_label():
	var viewport_size = Vector2(320, 180)  # Your actual viewport size
	fps_label.position = Vector2(viewport_size.x - 20, 0)
	fps_label.custom_minimum_size = Vector2(30, 10)

func _process(delta):
	if show_fps:
		fps_label.text = "FPS: " + str(Engine.get_frames_per_second())

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_F and event.ctrl_pressed:
			toggle_fps()

func toggle_fps():
	show_fps = !show_fps
	if show_fps:
		fps_label.show()
	else:
		fps_label.hide()
