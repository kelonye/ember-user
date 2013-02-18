get = Em.get
set = Em.set

module.exports = (url)->

  url ?= '/users/me/'

  Em.Application.initializer

    name: "user"

    initialize: (container, App) ->

      App.UserController = Em.ObjectController.extend
        init: ->
          # sideload user
          that = @
          Em.$.ajax
            url: url
            type: 'GET'
            contentType: 'application/json'
            success: (key) ->
              if key isnt ''
                user = App.User.find key
                set that, 'content', user

      container.register 'user', 'main', App.UserController
      container.lookup 'user:main'


  Em.Application.initializer

    name: "injectUser"

    initialize: (container, App) ->
      container.typeInjection 'controller', 'user', 'user:main'
      container.typeInjection 'route', 'user', 'user:main'
