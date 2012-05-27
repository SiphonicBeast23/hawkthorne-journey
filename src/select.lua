local Gamestate = require 'vendor/gamestate'
local game = require 'game'
local window = require 'window'
local state = Gamestate.new()

local selections = {}
selections[0] = {}
selections[0][0] = require 'characters/abed'
selections[0][1] = require 'characters/annie'

function state:init()
    self.side = 0 -- 0 for left, 1 for right
    self.level = 0 -- 0 through 3 for characters
    self.screen = love.graphics.newImage("images/selectscreen.png")
    self.arrow = love.graphics.newImage("images/arrow.png")
    love.graphics.setFont(love.graphics.newFont("fonts/xen3.ttf", 32))
end

function state:character()
    return selections[0][self.level]
end

function state:update(dt)
end

function state:keypressed(key)
    if key == "up" then
        self.level = (self.level + 1) % 2
    elseif key == "down" then
        self.level = (self.level - 1) % 2
    elseif key == "return" then
        Gamestate.switch(game, self:character())
    end
end

function state:draw()
    love.graphics.draw(self.screen)

    love.graphics.draw(self.arrow, 156 - 34 * self.level, 136 + 34 * self.level)
    love.graphics.printf(self:character().name, 0, 20, window.width, 'center')
    love.graphics.printf('PRESS ENTER', 0, 200, window.width, 'center')
end


return state

