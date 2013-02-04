YB.Models.Page = Backbone.Model.extend({
  url: '/pages'
});

YB.Collections.Pages = Backbone.Collection.extend({
  model: YB.Models.Page
});
