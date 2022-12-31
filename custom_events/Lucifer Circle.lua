function onCreatePost()
	makeLuaSprite('seleverCircle', 'MFM Stuff/circ', 0, 0)
	setGraphicSize('seleverCircle', getProperty('seleverCircle.width')*0.1)
	setProperty('seleverCircle.alpha', 0)
	addLuaSprite('seleverCircle')

	makeLuaSprite('blackBg', '', 0, 0)
	makeGraphic('blackBg', screenWidth*3, screenHeight*3, '000000')
	setObjectOrder('blackBg', getObjectOrder('gfGroup')+1)
	screenCenter('blackBg')
	setProperty('blackBg.alpha', 0)
	addLuaSprite('blackBg')
end

function onEvent(name, v1, v2)
	if name == 'Lucifer Circle' then
		if (tonumber(v1) == 1) or (tonumber(v1) == 2) then
				setProperty('seleverCircle.x', getCharacterX('dad')-60)
				setProperty('seleverCircle.y', getCharacterY('dad')+280)
				setGraphicSize('seleverCircle', getProperty('seleverCircle.width')*0.1)
				setProperty('seleverCircle.angle', 0)
				setProperty('seleverCircle.alpha', 1)
				doTweenX('circleScaleX', 'seleverCircle.scale', 1, 0.30, 'smoothStepOut')
				doTweenY('circleScaleY', 'seleverCircle.scale', 1, 0.30, 'smoothStepOut')
				doTweenAlpha('blackAlpha', 'blackBg', 0.8, 0.2, 'circIn')
			if tonumber(v1) == 1 then --clockwise
				doTweenAngle('circleSPEEN', 'seleverCircle', 360, tonumber(v2), 'smoothStepOut')
			else --countercockwise
				doTweenAngle('circleSPEEN', 'seleverCircle', -360, tonumber(v2), 'smoothStepOut')
			end
		elseif (tonumber(v1) == 4) then
				doTweenAlpha('blackAlpha', 'blackBg', 0.8, 0.2, 'circIn')
		else
				doTweenAlpha('blackAlphaRemove', 'blackBg', 0, 0.65, 'circIn')
				doTweenAlpha('circleAlpha', 'seleverCircle', 0, 2, 'smoothStepOut')
		end
	end
end