local angleshit = 1;
local anglevar = 1;

function onBeatHit()
	if curBeat >= 392 and curBeat < 488 then
		triggerEvent('Add Camera Zoom', 0.08,0.08)
	end
	if curBeat >= 22400 and curBeat < 35200 then
		triggerEvent('Add Camera Zoom', 0.14,-0.02)
	end
	if curBeat >= 35200 and curBeat < 38400 then
		triggerEvent('Add Camera Zoom', 0.24,-0.16)
	end
	if curBeat >= 41700 and curBeat < 48000 then
		triggerEvent('Add Camera Zoom', 0.20,-0.02)
	end
end

function onStepHit()
	if curBeat >= 38400 and curBeat < 41600 then
		if curStep % 4 == 0 then
			doTweenY('rrr', 'camHUD', -24, stepCrochet*0.002, 'circOut')
			doTweenY('rtr', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
		end
		if curStep % 4 == 2 then
			doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
	end
end