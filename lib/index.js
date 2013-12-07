require('ember');
module.exports = function(url) {
  if (url == null) url = '/users/me/'
  Em.Application.initializer({
    name: 'user',
    initialize: function(container, App) {
      var ObjectController = Em.ObjectController.extend({
        init: function() {
          var that = this;
          Em.$.ajax({
            url: url,
            type: 'GET',
            contentType: 'application/json',
            success: function(res) {
              if (typeof res === 'string'){
                if (res.trim() === ''){
                  res = {};
                } else {
                  res = container
                    .lookup('store:main')
                    .find('user', res);
                }
              }
              that.set('content', res);
            }
          });
        }
      });
      container.register('user:main', ObjectController);
      container.lookup('user:main');
    }
  });
  Em.Application.initializer({
    name: 'injectUser',
    initialize: function(container, App) {
      container.typeInjection('controller', 'user', 'user:main');
      container.typeInjection('route', 'user', 'user:main');
    }
  });
};
