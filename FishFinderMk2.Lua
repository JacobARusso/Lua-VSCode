--just math for finding coordinates with horizontal and yawturn
function onTick()
local degrees = 0
local yawTurns = input.getNumber(1)    
    if yawTurns > 0 then
        degrees = (1 - yawTurns) * 360 

    elseif yawTurns == 0 then
        degrees = 0

    elseif yawTurns < 0 then
        degrees = math.abs(yawTurns * 360)

    end

local rad = math.rad(degrees)


    local function radQRef(angle)
    local q, refRad

        if rad >= 0 and rad < math.pi / 2 then
            q = 1
            refRad = rad

        elseif rad < math.pi then
            q = 2
            refRad = math.pi - rad

        elseif rad < 3 * math.pi / 2 then
            q = 3
            refRad = rad - math.pi

        else
            q = 4
            refRad = 2 * math.pi - rad

        end
        return q, refRad
    end

local q, refRad = radQRef(rad)
local hypotenuse = input.getNumber(2)
local x = math.cos(refRad) * hypotenuse

    if q == 2 or q == 3 then
        x = -x
    end
local y = math.sin(refRad) * hypotenuse

    if q == 3 or q == 4 then
        y = -y
    end
