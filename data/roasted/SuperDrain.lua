function onUpdate(elapsed)
	if curBeat >= 616 and curBeat < 620 then
		runTimer('drain', 0.045, 0);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if curBeat >= 616 and curBeat < 620 then
	setProperty('health', getProperty('health')-0.0080);
	end
end