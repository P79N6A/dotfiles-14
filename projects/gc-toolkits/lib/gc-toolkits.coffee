GcToolkitsView = require './gc-toolkits-view'
{CompositeDisposable} = require 'atom'

MainToolBar = require './gc-tool-bar'

module.exports = GcToolkits =
  gcToolkitsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @gcToolkitsView = new GcToolkitsView(state.gcToolkitsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @gcToolkitsView.getElement(), visible: false)

    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'gc-toolkits:toggle': => @toggle()



  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @gcToolkitsView.destroy()

  serialize: ->
    gcToolkitsViewState: @gcToolkitsView.serialize()

  toggle: ->
    console.log 'GcToolkits was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
