describe('UserController', function() {
  it('should be injected to routes and controllers', function(done) {
    Em.$.ajax = function() {};
    var App = Em.Application.create({
      ready: function() {
        var controller = App.__container__.lookup('user:main');
        assert(controller);
        controller = App.__container__.lookup('controller:some');
        assert(controller.get('user'));
        var route = App.__container__.lookup('route:some');
        assert(route.get('user'));
        done();
      }
    });
    App.SomeController = Em.Controller.extend();
    App.SomeRoute = Em.Route.extend();
  });
});
