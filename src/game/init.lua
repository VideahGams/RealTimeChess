game = {}
game.path = ... .. '/'

game.playername = "Untitled Player"
game.selected = ""

function game.load()

	game.board = engine.scripts.require("board")
	game.selector = engine.scripts.require("selector")

	engine.map.loadmap("chess")

	-- Set default state --
	engine.state.setState("splash")

	-- Splash Screen --
	engine.splash.addSplash(love.graphics.newImage("game/data/images/splashes/love.png"))
	engine.splash.onComplete(function() engine.state.setState("menu") end)

	-- Debug Vars --
	engine.panel.addVar("FPS", function() return _G.fps end)
	engine.panel.addVar("MouseX", function() return engine.camera:getMouseX() end)
	engine.panel.addVar("MouseY", function() return engine.camera:getMouseY() end)
	engine.panel.addVar("Selected", function() return game.selected end)

	-- Menu Buttons --
	engine.menu.addButton("Start", 0, 0, function() engine.state.setState("game") end)
	engine.menu.addButton("Quit", 0, 0, function() love.event.quit() end)

	engine.scripts.require("pieces.base")

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

function game.mousepressed(x, y, button)

	if engine.state:isCurrentState("game") then

		if button == "l" then
			local mx = math.floor(engine.camera:getMouseX() / 64)
			local my = math.floor(engine.camera:getMouseY() / 64)

			if mx <= 8 and mx >= 1 and my <= 8 and my >= 1 then
				game.selector.setTile(mx, my)
				game.selected = game.board.toCoords(mx, my)
			end

		end

	end

end

return game