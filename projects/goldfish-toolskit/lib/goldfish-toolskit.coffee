GoldfishToolskitView = require './goldfish-toolskit-view'
{CompositeDisposable} = require 'atom'

module.exports = GoldfishToolskit =
  goldfishToolskitView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @goldfishToolskitView = new GoldfishToolskitView(state.goldfishToolskitViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @goldfishToolskitView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'goldfish-toolskit:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @goldfishToolskitView.destroy()

  serialize: ->
    goldfishToolskitViewState: @goldfishToolskitView.serialize()

  toggle: ->
    console.log 'GoldfishToolskit was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
