-- Created by Ranjithkumar Matheswaran
-- For Womi Studios by Perk.com
-- ╦ ╦╔═╗╔╦╗╦  ╔═╗╔╦╗╦ ╦╔╦╗╦╔═╗╔═╗
-- ║║║║ ║║║║║  ╚═╗ ║ ║ ║ ║║║║ ║╚═╗
-- ╚╩╝╚═╝╩ ╩╩  ╚═╝ ╩ ╚═╝═╩╝╩╚═╝╚═╝
-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local webView
-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------

local function getColorForRGB(r,g,b)
  local red = r / 255
  local green = g / 255
  local blue = b / 255
  return red,green,blue
end

function closeButtonListener(event)
  if (event.phase == "ended") then
    webView:deleteCookies()
    webView:removeSelf()
    webView = nil
    composer.hideOverlay( "fade", 200 )
  end
end

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view

    local background = display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth,display.contentHeight + 200)
    background:setFillColor(0,0,0,0.8)
    sceneGroup:insert(background)

    local topHeader = display.newRect(display.actualContentWidth / 2,70,display.actualContentWidth - 20, 50)
    print(getColorForRGB(17,47,63))
    topHeader:setFillColor(getColorForRGB(17,47,65))
    sceneGroup:insert(topHeader)

    local topText = display.newText("Womi's Family of Apps",display.actualContentWidth - 20, 50,native.systemFont,16)
    topText.x = topHeader.x
    topText.y = topHeader.y
    topText.width = topHeader.width
    topText.height = topHeader.height
    topText:setFillColor(1,1,1)
    sceneGroup:insert(topText)

    local cancelButton = display.newImage("coronawomiapps/cancel.png")
    cancelButton.width = topText.height - 20
    cancelButton.height = topText.height - 20
    cancelButton.x = topText.x + topText.width / 2 - cancelButton.width / 2 - 10
    cancelButton.y = topText.y
    cancelButton:addEventListener("touch",closeButtonListener)
    sceneGroup:insert(cancelButton)

    local webViewHeight = display.contentHeight - topHeader.y - topHeader.height / 2 - 25
    webView = native.newWebView( topHeader.x, topHeader.y + topHeader.height / 2 + webViewHeight / 2, topHeader.width, display.contentHeight - topHeader.y - topHeader.height / 2 - 25)
    webView:request("http://womistudios.com/getapps")
    sceneGroup:insert(webView)


    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view
    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene
