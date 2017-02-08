local config  = require('config') 
local gameObj = require('gameObj')
local utils   = require('utils')

function love.load()
	math.randomseed( os.time() )
	sh_back = love.graphics.newShader(config.background)
	
	allthings = {}

	table.insert(allthings, gameObj:new(config.ship))

	for i = 1, config.blackthingNumb do
		table.insert(allthings, gameObj:new(config.blackthing):roaming())
	end

	t = 0
end

function love.update(dt)

	if love.keyboard.isDown('p')         then 
		
		allthings[1]:spawn() 
		for i = 2, config.blackthingNumb+1 do
			allthings[i]:roaming()
		end
	end
	if love.keyboard.isDown('left','a')  then allthings[1]:turn_l() end
	if love.keyboard.isDown('right','d') then allthings[1]:turn_r() end
	if love.keyboard.isDown('up','w')    then allthings[1]:accel()  end
	if love.keyboard.isDown('down','s')  then allthings[1]:brake()  end

	for i = 1, #allthings do
		for j = 1, #allthings do
			if utils.isCrossed(allthings[i],allthings[j]) then
				allthings[i].dS = allthings[i].dS * (-1)
				allthings[j].dS = allthings[j].dS * (-1)
			end
		end
		allthings[i]:update(dt)
	end
	t = t + dt
	sh_back:send("time", t)

end

function love.draw()
	love.graphics.setShader(sh_back)
	love.graphics.rectangle('fill',0,0,love.graphics.getDimensions())
	love.graphics.setShader()

	for i = 1, #allthings do
		allthings[i]:draw()
	end
end