// Generated by CoffeeScript 1.4.0

describe('User', function() {
  return it('user peoperty injected to routes and controllers', function() {
    var controller, route;
    Em.$.ajax = function() {};
    window.App = Em.Application.create();
    App.SomeController = Em.Controller.extend();
    App.SomeRoute = Em.Route.extend();
    controller = App.__container__.lookup('controller:some');
    console.log(controller);
    console.log(controller.get('user'));
    route = App.__container__.lookup('route:some');
    console.log(route.get('user'));
    return App.destroy();
  });
});
