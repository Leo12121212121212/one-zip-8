function onCreatePost()
	makeLuaSprite('parentsCircle', 'MFM Stuff/parents', 0, 0)
	setGraphicSize('parentsCircle', getProperty('parentsCircle.width')*0.1)
	setProperty('parentsCircle.alpha', 0)
	addLuaSprite('parentsCircle')

	makeLuaSprite('blackBg', '', 0, 0)
	makeGraphic('blackBg', screenWidth*3, screenHeight*3, '000000')
	setObjectOrder('blackBg', getObjectOrder('gfGroup')+1)
	screenCenter('blackBg')
	setProperty('blackBg.alpha', 0)
	addLuaSprite('blackBg')
end

function onEvent(name, v1, v2)
	if name == 'Parents Circle' then
		if (tonumber(v1) == 1) or (tonumber(v1) == 2) then
				setProperty('parentsCircle.x', getCharacterX('dad')+360)
				setProperty('parentsCircle.y', getCharacterY('dad')+240)
				setGraphicSize('parentsCircle', getProperty('parentsCircle.width')*0.1)
				setProperty('parentsCircle.angle', 0)
				setProperty('parentsCircle.alpha', 1)
				doTweenX('circleScaleX', 'parentsCircle.scale', 1, 0.30, 'smoothStepOut')
				doTweenY('circleScaleY', 'parentsCircle.scale', 1, 0.30, 'smoothStepOut')
				doTweenAlpha('blackAlpha', 'blackBg', 0.8, 0.2, 'circIn')
			if tonumber(v1) == 1 then --clockwise
				doTweenAngle('circleSPEEN', 'parentsCircle', 360, tonumber(v2), 'smoothStepOut')
			else --countercockwise
				doTweenAngle('circleSPEEN', 'parentsCircle', -360, tonumber(v2), 'smoothStepOut')
			end
		elseif (tonumber(v1) == 4) then
				doTweenAlpha('blackAlpha', 'blackBg', 0.8, 0.2, 'circIn')
		else
				doTweenAlpha('blackAlphaRemove', 'blackBg', 0, 0.65, 'circIn')
				doTweenAlpha('circleAlpha', 'parentsCircle', 0, 2, 'smoothStepOut')
		end
	end
end