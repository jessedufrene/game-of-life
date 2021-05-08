-- CONFIG
local cellBorderSize = 2
local cellSize = 30
-- {red, green, blue, alpha}
local borderColor = {0.2, 0.2, 0.2, 1}
local aliveColor = {0.9, 1, 0.9, 1}
local deadColor = {0.1, 0, 0, 1}
local cellsWide = 40
local cellsTall = 25
-- END CONFIG

function love.load()
    setWindow(cellsWide,cellsTall)
end
function love.update(dt)

end

function love.draw()
    drawGrid()
end

---Sets window size based on the grid size
function setWindow(w,h)
    ---get total width or height window should be based on number of cells given
    function getDimensionSize(cellCount)
        local dimensionSize = ((cellCount+1)*cellBorderSize)+(cellCount*cellSize)
        return dimensionSize
    end
    local windowWidth, windowHeight = getDimensionSize(w), getDimensionSize(h)
    love.window.setMode(windowWidth, windowHeight)
end

function drawGrid()
    -- center of top left pixel is 0.5, 0.5
    love.graphics.setColor(borderColor)
    love.graphics.setLineWidth(cellBorderSize)
    local centerOfLine = cellBorderSize*0.5
    local windowWidth, windowHeight = love.graphics.getDimensions()
    ---Given a cell count along a dimension, get each border coordinate
    function getCoordinatesToDraw(cellCount)
        local coordinates = {}
        for i=0,cellCount do
            local coordinate = ((cellBorderSize+cellSize)*i)+centerOfLine
            coordinates[i+1] = coordinate
        end
        return coordinates
    end
    local xCoords = getCoordinatesToDraw(cellsWide)
    local yCoords = getCoordinatesToDraw(cellsTall)
    for k,v in pairs(xCoords) do
        love.graphics.line(v, 0.5, v, windowHeight+0.5)
    end
    for k,v in pairs(yCoords) do
        love.graphics.line(0.5, v, windowWidth+0.5, v)
    end
end