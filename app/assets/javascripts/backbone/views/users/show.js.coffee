App.Views.Users ||= {}

class App.Views.Users.Show extends Backbone.View
  template: JST["backbone/templates/users/show"]

  constructor: (model) ->
    @model = model
    @$el = $('#caesar_cipher')
    @editing = false
    _.bindAll @, 'save'
  tagName: "div"

  render: ->
    @$el.html(@template())
    this.bindEvents()
    return this

  bindEvents: ->
    self = this 
    $(".message").unbind('keyup').on 'keyup', ->
      self.editing = false
      setTimeout (->
        self.save()
        return
      ), 500
    $(".message").unbind('keydown').on 'keydown', ->
      self.editing = true
    return

  save: ->
    self = this
    message = $(".message").val()
    shift = $('.shift').val()
    if !@editing && message != ""
      @model.set({message: message, shift: shift})
      @model.save null,
        success: (obj)->
          self.render()


