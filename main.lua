local abs = math.abs
local sin = math.sin
local sqrt = math.sqrt

ship = {
	img = nil,
	x = 100,
	y = 100,
	rotation = 0,
	deltaRotation = 10,
	deltaSpeed = 10
}


function love.load()
	ship.img = love.graphics.newImage("ship.png")
end

function love.update(dt)
	if love.keyboard.isDown('left','a') then
		ship.rotation = ship.rotation + ship.deltaRotation
	elseif love.keyboard.isDown('right','d') then
		ship.rotation = ship.rotation - ship.deltaRotation
	end
end

function love.draw()
	love.graphics.setBackgroundColor(255, 255, 255)
	love.graphics.draw(ship.img, love.graphics.getWidth()/2, love.graphics.getHeight()/2, ship.rotation)
end