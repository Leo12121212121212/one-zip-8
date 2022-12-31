function onCreate()

end
function onUpdate()
	if curStep > 2479 and curStep < 2488 then
		setProperty('boyfriend.angle', getProperty('boyfriend.angle') + 16);
		setProperty('boyfriend.x', getProperty('boyfriend.x') + 2);
		setProperty('boyfriend.y', getProperty('boyfriend.y') - 18);
	end
	if curStep > 2487 and curStep < 2495 then
		setProperty('boyfriend.angle', getProperty('boyfriend.angle') + 12);
		setProperty('boyfriend.x', getProperty('boyfriend.x') + 2);
		setProperty('boyfriend.y', getProperty('boyfriend.y') + 22);
	end
end