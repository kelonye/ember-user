describe 'User', ->

  it 'user peoperty injected to routes and controllers', ->

    #get = Em.get
    #set = Em.set


  
    Em.$.ajax = ->

    window.App = Em.Application.create()
    App.SomeController = Em.Controller.extend()
    App.SomeRoute = Em.Route.extend()

#    Em.run ->
    controller = App.__container__.lookup 'controller:some'
    console.log controller
    console.log controller.get 'user'

    route = App.__container__.lookup 'route:some'
    console.log route.get 'user'

    App.destroy()