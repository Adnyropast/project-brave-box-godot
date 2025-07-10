class_name FocusButtons
extends Node

static func focus_first_child(container: Node) -> void:
	var first_focusable_child: Control = find_first_focusable_child(container)
	
	if first_focusable_child:
		first_focusable_child.grab_focus.call_deferred()

static func find_first_focusable_child(container: Node) -> Control:
	for child in container.get_children():
		if child is Control and child.focus_mode and child.visible:
			return child
		else:
			var grandchild: Control = find_first_focusable_child(child)
			
			if grandchild:
				return grandchild
	
	return null

static func set_focus_on_draw(control: Control) -> void:
	control.draw.connect(on_draw.bind(control))

static func on_draw(control: Control) -> void:
	FocusButtons.focus_first_child(control)
