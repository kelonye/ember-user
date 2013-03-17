describe 'User', ->

  it 'user peoperty injected to routes and controllers', (done)->

    Em.$.ajax = ->

    require('ember-user')()

    App = Em.Application.create

      # isDestroyedChanged: (->
      #   done()
      # ).observes 'isDestroyed'

      ready: ->

        # user controller
        controller = App.__container__.lookup 'user:main'
        assert controller

        # controller instances have a user prop
        controller = App.__container__.lookup 'controller:some'
        assert controller.hasOwnProperty 'user'

        # route instances have a user prop
        route = App.__container__.lookup 'route:some'
        assert route.hasOwnProperty 'user'

    App.SomeController = Em.Controller.extend()
    App.SomeRoute = Em.Route.extend()

    App.destroy()

    done()
