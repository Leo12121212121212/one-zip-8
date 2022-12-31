trailEnabledDad = false;
trailEnabledGF = false;
timerStartedDad = false;
timerStartedGF = false;

trailLength = 15;
trailDelay = 0.020;

function onEvent(name, value1, value2)
	if name == "Toggle Trail 2" or name == "Toggle_Trail" then
		if not (value1 == nil or value1 == '') and tonumber(value1) > 0 then
			if not timerStartedDad then
				runTimer('timerTrailDad', trailDelay, 0);
				timerStartedDad = true;
			end
			trailEnabledDad = true;
			curTrailDad = 0;
		else
			trailEnabledDad = false;
		end

		if not (value2 == nil or value2 == '') and tonumber(value2) > 0 then
			if not timerStartedGF then
				runTimer('timerTrailGF', trailDelay, 0);
				timerStartedGF = true;
			end
			trailEnabledGF = true;
			curTrailGF = 0;
		else
			trailEnabledGF = false;
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'timerTrailDad' then
		createTrailFrame('Dad');
	end

	if tag == 'timerTrailGF' then
		createTrailFrame('GF');
	end
end

curTrailDad = 0;
curTrailGF = 0;
function createTrailFrame(tag)
	num = 0;
	color = -1;
	image = '';
	frame = 'GF idle dance';
	x = 0;
	y = 0;
	scaleX = 0;
	scaleY = 0;
	offsetX = 0;
	offsetY = 0;
	flipX = false;

	if tag == 'GF' then
		num = curTrailGF;
		curTrailGF = curTrailGF + 1;
		if trailEnabledGF then
			color = getColorFromHex('812952');
			image = getProperty('gf.imageFile')
			frame = getProperty('gf.animation.frameName');
			x = getProperty('gf.x');
			y = getProperty('gf.y');
			scaleX = getProperty('gf.scale.x'); 
			scaleY = getProperty('gf.scale.y'); 
			offsetX = getProperty('gf.offset.x')+10 ;
			offsetY = getProperty('gf.offset.y')+4 ;
			flipX = getProperty('gf.flipX')
		end
	else
		num = curTrailDad;
		curTrailDad = curTrailDad + 1;
		if trailEnabledDad then
			color = getColorFromHex('00F7FF');
			image = getProperty('dad.imageFile')
			frame = getProperty('dad.animation.frameName');
			x = getProperty('dad.x');
			y = getProperty('dad.y');
			scaleX = getProperty('dad.scale.x');
			scaleY = getProperty('dad.scale.y');
			offsetX = getProperty('dad.offset.x');
			offsetY = getProperty('dad.offset.y');
			flipX = getProperty('dad.flipX')
		end
	end

	if num - trailLength + 1 >= 0 then
		for i = (num - trailLength + 1), (num - 1) do
			setProperty('psychicTrail'..tag..i..'.alpha', getProperty('psychicTrail'..tag..i..'.alpha') - (0.4 / (trailLength - 1)));
		end
	end
	removeLuaSprite('psychicTrail'..tag..(num - trailLength));

	if not (image == '') then
		trailTag = 'psychicTrail'..tag..num;
		makeAnimatedLuaSprite(trailTag, image, x, y);
		setProperty(trailTag..'.offset.x', offsetX);
		setProperty(trailTag..'.offset.y', offsetY);
		setProperty(trailTag..'.scale.x', scaleX);
		setProperty(trailTag..'.scale.y', scaleY);
		setProperty(trailTag..'.flipX', flipX);
		setProperty(trailTag..'.alpha', 0.4);
		setProperty(trailTag..'.color', color);
		setBlendMode(trailTag, 'alpha');
		addAnimationByPrefix(trailTag, 'stuff', frame, 0, false);
		addLuaSprite(trailTag, false);
	end
end