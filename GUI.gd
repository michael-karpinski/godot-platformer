extends Control

var heart_icon = preload('res://res/life.png')

func update_hearts(n):
	while $Hearts.get_children().size() < n:
		add_heart()
	while $Hearts.get_children().size() > n:
		remove_heart()

func add_heart():
	var node = TextureRect.new()
	node.set_name('heart')
	node.set_texture(heart_icon)
	$Hearts.add_child(node)

func remove_heart():
	var last_heart = $Hearts.get_children()[$Hearts.get_children().size() - 1]
	$Hearts.remove_child(last_heart)