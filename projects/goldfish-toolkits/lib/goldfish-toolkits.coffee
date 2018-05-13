GoldfishToolkitsView = require './goldfish-toolkits-view'
{CompositeDisposable} = require 'atom'

module.exports = GoldfishToolkits =
  goldfishToolkitsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @goldfishToolkitsView = new GoldfishToolkitsView(state.goldfishToolkitsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @goldfishToolkitsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'goldfish-toolkits:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @goldfishToolkitsView.destroy()

  serialize: ->
    goldfishToolkitsViewState: @goldfishToolkitsView.serialize()

  toggle: ->
    console.log 'GoldfishToolkits was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
