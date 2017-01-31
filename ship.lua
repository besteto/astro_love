local ship = {}

function ship:new(config)
	local obj = config or {}
		
	obj.image = love.graphics.newImage(obj.img) 
	obj.dR = 0;
	obj.dS = 0 
	obj.centerX = obj.image:getWidth()/2
	obj.centerY = obj.image:getHeight()/2

	-- итд
	

	setmetatable(obj,self)
   	self.__index   = self
	return obj
end

function ship:spawn()
	self.x = love.graphics.getWidth() /2  
	self.y = love.graphics.getHeight()/2  
end

function ship:draw()
	love.graphics.draw(self.image, self.x, self.y, self.rotation, 1, 1, self.centerX, self.centerY)
end	

function ship:update(dt)
	-- todo

end	

function ship:turn_l()
	-- todo

end	

function ship:turn_r()
	-- todo

end	

function ship:accel()
	-- todo

end	

function ship:brake()
	-- todo

end	










return ship