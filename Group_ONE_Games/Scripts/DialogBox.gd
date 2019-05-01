extends RichTextLabel

var dialog = [
	"I can't believe I have already been stranded for so long. I beginining to wonder if I will ever get off of this cursed island...", 
	"I'm feeling pretty hungry, I should look for some food."
	]
var pageNum = 0



func _ready():
	set_process_input(true)
	set_bbcode(dialog[pageNum])
	set_visible_characters(0)
	pass 

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if pageNum >= dialog.size() - 1 && get_visible_characters() >= get_total_character_count() :
			get_parent().get_parent().hide()
		if get_visible_characters() > get_total_character_count():
			if pageNum < dialog.size()-1:
				pageNum += 1
				set_bbcode(dialog[pageNum])
				set_visible_characters(0)
				get_parent().get_node("Label").hide()
		else:
			set_visible_characters(get_total_character_count())
			get_parent().get_node("Label").show()



func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	if get_visible_characters() >= get_total_character_count():
		get_parent().get_node("Label").show()


func set_single_dialog_text(text):
	pageNum = 0
	dialog.clear()
	dialog.append(text)
	set_bbcode(dialog[0])
	set_visible_characters(0)
	get_parent().get_parent().show()


func set_multiple_dialog_text(textArray):
	pageNum = 0
	dialog.clear()
	for text in textArray:
		dialog.append(text)
	set_bbcode(dialog[0])
	set_visible_characters(0)
	get_parent().get_parent().show()