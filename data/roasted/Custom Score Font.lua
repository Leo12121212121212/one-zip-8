function onCreatePost()
	makeLuaText("scoretext", "skill issue", 1000, 147, 685)
	setTextAlignment("scoretext", 'center')
	setTextSize("scoretext", 22)
	setTextFont("scoretext", "Cooljazz.ttf");
	addLuaText("scoretext")
end
function onUpdatePost()
	setProperty("scoreTxt.y", -500)
	setTextString("scoretext", getProperty("scoreTxt.text"))
end