module.exports = (url)->

  url ?= '/users/me/'

  Em.Application.initializer
    name: "user"
    initialize: (container, App) ->
      ObjectController = Em.ObjectController.extend
        init: ->
          # sideload user
          that = @
          Em.$.ajax
            url: url
            type: 'GET'
            contentType: 'application/json'
            success: (res) ->
              if res != ''
                if typeof(res) == 'string'
                  res = App.User.find res
                that.set 'content', res
      container.register 'user', 'main', ObjectController
      container.lookup 'user:main'


  Em.Application.initializer
    name: 'injectUser'
    initialize: (container, App) ->
      container.typeInjection 'controller', 'user', 'user:main'
      container.typeInjection 'route', 'user', 'user:main'