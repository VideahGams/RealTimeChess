game = {}
game.path = ... .. '/'

game.playername = "Untitled Player"

function game.load()

	game.board = engine.scripts.require("board")
	game.selector = engine.scripts.require("selector")

	-- Set default state --
	engine.state.setState("splash")

	-- Splash Screen --
	engine.splash.addSplash(love.graphics.newImage("game/data/images/splashes/love.png"))
	engine.splash.onComplete(function() engine.state.setState("menu") end)

	-- Debug Vars --
	engine.panel.addVar("FPS", function() return _G.fps end)
	--engine.input.mouse.bind("l", "click")

	-- Menu Buttons --
	engine.menu.addButton("Start", 0, 0, function() engine.state.setState("game") end)
	engine.menu.addButton("Quit", 0, 0, function() love.event.quit() end)

end

function game.draw()

	if engine.state:isCurrentState("menu") then	
		engine.menu.draw()
	end

	if engine.state:isCurrentState("game") then

		engine.camera:set()

			engine.map.draw()

			game.selector.draw()

			-- Game Draw Code Here --

		engine.camera:unset()

	end

end

function game.update(dt)

	if engine.state:isCurrentState("menu") then
		engine.menu.update(dt)
	end

	if engine.state:isCurrentState("game") then
		engine.camera.update(dt)

		if love.keyboard.isDown("down") then
			engine.camera:move("down", 100 * dt)
		end

		if love.keyboard.isDown("left") then
			engine.camera:move("left", 100 * dt)
		end

		if love.keyboard.isDown("right") then
			engine.camera:move("right", 100 * dt)
		end

		if love.keyboard.isDown("up") then
			engine.camera:move("up", 100 * dt)
		end

	end

end

return game