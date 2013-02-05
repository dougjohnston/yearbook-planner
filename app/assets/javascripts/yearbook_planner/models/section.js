YB.Models.Section = Backbone.Model.extend({
  url: '/sections'
});

YB.Collections.Sections = Backbone.Collection.extend({
  model: YB.Models.Section
});
