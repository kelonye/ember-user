describe('UserController', function() {
  it('should be injected to routes and controllers', function(done) {
    Em.$.ajax = function() {};
    require('ember-user')();
    var App = Em.Application.create({
      ready: function() {
        var controller = App.__container__.lookup('user:main');
        assert(controller);
        controller = App.__container__.lookup('controller:some');
        assert(controller.hasOwnProperty('user'));
        var route = App.__container__.lookup('route:some');
        return assert(route.hasOwnProperty('user'));
      }
    });
    App.SomeController = Em.Controller.extend();
    App.SomeRoute = Em.Route.extend();
    App.destroy();
    return done();
  });
});
