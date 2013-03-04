YB.Models.Yearbook = Backbone.Model.extend({
  url: '/yearbooks',
  title: ''
});

YB.Collections.Yearbooks = Backbone.Collection.extend({
  model: YB.Models.Yearbook
});

