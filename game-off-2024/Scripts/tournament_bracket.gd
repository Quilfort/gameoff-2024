extends Node2D

# Constants for visual layout
const MATCH_BOX_WIDTH = 200  # Increased width for longer names
const MATCH_BOX_HEIGHT = 80  # Increased height for better text spacing
const HORIZONTAL_SPACING = 250  # Increased spacing between rounds
const VERTICAL_BASE_SPACING = 120  # Increased base spacing

# References to scene nodes
@onready var bracket_container = Node2D.new()

# Dynamic variables
var total_rounds = 0
var bracket_width = 0
var bracket_height = 0

func _ready():
	add_child(bracket_container)
	calculate_tournament_dimensions()
	create_bracket_visualization()
	get_viewport().size_changed.connect(self._on_viewport_size_changed)

func calculate_tournament_dimensions():
	# Calculate number of rounds based on MAX_PLAYERS
	total_rounds = floor(log(GameData.MAX_PLAYERS) / log(2))
	bracket_width = (total_rounds) * (MATCH_BOX_WIDTH + HORIZONTAL_SPACING)
	# Calculate height based on number of first round matches
	bracket_height = (GameData.MAX_PLAYERS / 2) * VERTICAL_BASE_SPACING

func create_bracket_visualization():
	# Position bracket in top-right corner with padding
	bracket_container.position = Vector2(50, 50)
	
	# Clear existing visualization
	for child in bracket_container.get_children():
		child.queue_free()
	
	# Calculate scale to fit viewport while maintaining aspect ratio
	var viewport_size = get_viewport().get_visible_rect().size
	var scale_factor = min(
		(viewport_size.x - 100) / bracket_width,
		(viewport_size.y - 100) / bracket_height
	)
	bracket_container.scale = Vector2(scale_factor, scale_factor)
	
	# Create only the current rounds
	for round_index in range(GameData.tournament_matches.size()):
		create_round(round_index)

func create_round(round_index: int):
	var round_matches = GameData.tournament_matches[round_index]
	var matches_in_round = round_matches.size()
	
	# Calculate vertical spacing for this round
	var vertical_spacing = VERTICAL_BASE_SPACING * pow(2, round_index)
	
	for match_index in range(matches_in_round):
		var match_data = round_matches[match_index]
		var match_node = create_match_box(match_data)
		
		# Calculate positions
		var x_pos = round_index * (MATCH_BOX_WIDTH + HORIZONTAL_SPACING)
		var total_height_for_round = (matches_in_round - 1) * vertical_spacing
		var y_start = (bracket_height - total_height_for_round) / 2
		var y_pos = y_start + (match_index * vertical_spacing)
		
		match_node.position = Vector2(x_pos, y_pos)
		
		# Only draw connection lines for completed matches that lead to existing next-round matches
		if round_index < GameData.tournament_matches.size() - 1:
			var next_round_matches = GameData.tournament_matches[round_index + 1]
			var next_match_index = floor(match_index / 2)
			if next_match_index < next_round_matches.size():
				draw_connection_lines(match_node, round_index, match_index)

func create_match_box(match_data: Dictionary) -> Node2D:
	var match_box = Node2D.new()
	
	# Create background panel
	var panel = Panel.new()
	panel.custom_minimum_size = Vector2(MATCH_BOX_WIDTH, MATCH_BOX_HEIGHT)
	
	# Create VBoxContainer for vertical text alignment
	var vbox = VBoxContainer.new()
	vbox.custom_minimum_size = Vector2(MATCH_BOX_WIDTH, MATCH_BOX_HEIGHT)
	vbox.alignment = BoxContainer.ALIGNMENT_CENTER
	
	# Create labels for each team
	var team1_label = Label.new()
	team1_label.text = match_data["team1"].name
	team1_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	var vs_label = Label.new()
	vs_label.text = "vs"
	vs_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	var team2_label = Label.new()
	team2_label.text = match_data["team2"].name
	team2_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	# Add labels to VBoxContainer
	vbox.add_child(team1_label)
	vbox.add_child(vs_label)
	vbox.add_child(team2_label)
	
	# Add panel and VBoxContainer to match_box
	match_box.add_child(panel)
	match_box.add_child(vbox)
	bracket_container.add_child(match_box)
	
	return match_box

func draw_connection_lines(match_node: Node2D, round_index: int, match_index: int):
	var line = Line2D.new()
	line.default_color = Color(0.7, 0.7, 0.7, 0.5)  # Lighter, semi-transparent lines
	line.width = 2.0
	
	# Calculate start and end positions
	var start_pos = match_node.position + Vector2(MATCH_BOX_WIDTH, MATCH_BOX_HEIGHT/2)
	var next_match_index = floor(match_index / 2)
	var next_round_spacing = VERTICAL_BASE_SPACING * pow(2, round_index + 1)
	var next_matches_in_round = GameData.tournament_matches[round_index + 1].size()
	var next_total_height = (next_matches_in_round - 1) * next_round_spacing
	var next_y_start = (bracket_height - next_total_height) / 2
	var next_y = next_y_start + (next_match_index * next_round_spacing)
	
	var end_pos = Vector2(
		start_pos.x + HORIZONTAL_SPACING,
		next_y + MATCH_BOX_HEIGHT/2
	)
	
	# Draw bezier curve
	var control_point_x = (start_pos.x + end_pos.x) / 2
	line.add_point(start_pos)
	line.add_point(Vector2(control_point_x, start_pos.y))
	line.add_point(Vector2(control_point_x, end_pos.y))
	line.add_point(end_pos)
	
	bracket_container.add_child(line)

func _on_viewport_size_changed():
	create_bracket_visualization()

func update_bracket():
	create_bracket_visualization()
