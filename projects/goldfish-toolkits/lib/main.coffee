GoldfishCommands = require './goldfish-commands'
GoldfishToolBar = require './goldfish-tool-bar'
GoldfishChangeCase = require './goldfish-change-case'
GoldfishSortLines = require './goldfish-sort-lines'
GoldfishSassCompile = require './sass-autocompile/lib/sass-autocompile'

module.exports =
  activate: (state) ->
    GoldfishCommands.initialize()
    GoldfishChangeCase.initialize()
    GoldfishSortLines.initialize()
    GoldfishSassCompile.initialize(state)

  deactivate: ->
    GoldfishToolBar.deactivate()
    GoldfishSortLines.deactivate()
    GoldfishSassCompile.deactivate()

  consumeToolBar: (toolBar) ->
    @toolBar = GoldfishToolBar.initialize(toolBar)
