
Install
---

$  component install kelonye/ember-user

Usage
---

```javascript

require('ember');
require('ember-user')('/:get_current_user_json_or_id);

App = Em.Application.create();

App.User = DS.Model.extend({
  username: DS.attr('string')
});

```

Possible `/:get_current_user_json_or_id` responses:

1. Current user `json`
2. Current user `id` if you are using `ember-data` of which the user model is assumed to be `MyAppNamespace.User`

License
---

MIT