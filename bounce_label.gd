extends Label

var default_text = "Bounces:"

func _process(delta):
	var text = str(default_text, str(Global.bounce_counter))
	self.text = (text)
