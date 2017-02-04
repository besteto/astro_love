local utils = {}

local abs = math.abs
local sin = math.sin
local sqrt = math.sqrt
local eps = 1e-7

function utils.round_null(num)
	if abs(num) < eps then return 0 end
	return num
end	

-- x1,y1 are the center coords as well as x2,y2
-- (x2-x1)^2 + (y1-y2)^2 <= (r1+r2)^2
function utils.isCrossed(firstBody, secondBody)
  return ((secondBody.x-firstBody.x)^2 + (firstBody.y-secondBody.y)^2) <= (firstBody.collisionR+secondBody.collisionR)^2
end

return utils