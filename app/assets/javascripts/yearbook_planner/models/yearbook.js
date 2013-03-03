YB.Models.Yearbook = Backbone.Model.extend({
  url: '/yearbooks'
});

YB.Collections.Yearbooks = Backbone.Collection.extend({
  model: YB.Models.Yearbook
});

