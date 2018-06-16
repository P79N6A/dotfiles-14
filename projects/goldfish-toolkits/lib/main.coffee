GoldfishCommands = require './goldfish-commands'
GoldfishToolBar = require './goldfish-tool-bar'

module.exports =
  activate: ->
    GoldfishCommands.initialize()

  deactivate: ->
    @toolBar?.removeItems()
    
    @toolbar?.destroy()
    @toolbar = null

  consumeToolBar: (toolBar) ->
    @toolBar = GoldfishToolBar.initialize(toolBar)
