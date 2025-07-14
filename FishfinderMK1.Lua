    yawTurns = 0
    degrees = nil
    horizontal = 0
function onTick()

fish = input.getBool(1)

    if fish then
       yawTurns = input.getNumber(1)
       horizontal = input.getNumber(2)


       if yawTurns > 0 then
            degrees = (1 - yawTurns) * 360 

        elseif yawTurns == 0 then
            degrees = 0

        elseif yawTurns < 0 then
            degrees = math.abs(yawTurns * 360)

        end
        output.setBool(1,true)
    end

    if not fish then 
        output.setBool(1,false)

    end

end


function onDraw()
    local w = 96
    local h = 64
    local cx = 32
    local cy = 32
    local refDegrees = 0
    local q = 0
screen.setColor(70,70,70)
screen.setClear()

screen.setColor(41, 83, 107)
screen.drawCircleF(cx, cy, 30)

screen.setColor(120,120,120)
screen.drawline(64,0,64,64)
    if degrees ~= nil then
        if degrees < 90 then
            q = 1
            refDegrees = degrees
         elseif degrees  < 180 then
            q = 2
            refDegrees = 180 - degrees
        elseif degrees < 270 then
            q = 3
            refDegrees = degrees - 180
        else
            q = 4
            refDegrees = 360 - degrees
        end
    end
local cosRad = nil
local x = 0 -- x value of coordinate
cosRad = math.cos(math.rad(refDegrees)) * horizontal
    if q == 1 then
       x = cos
    elseif q == 2 then
        x = -cos
    elseif q == 3 then
        x = cos
    elseif q == 4 then
        x = -cos
    end
local sin = nil
local y = 0
sin = math.sin(refDegrees) * horizontal
    if q == 1 then
       y = sin
    elseif q == 2 then
        y = sin
    elseif q == 3 then
        y = -sin
    elseif q == 4 then
        y = -sin
    end
local rPolar
rPolar = math.sqrt(x^2 + y^2)




end
