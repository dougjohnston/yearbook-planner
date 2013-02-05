YB.Models.Spread = Backbone.Model.extend({
  url: '/spreads'
});

YB.Collections.Spreads = Backbone.Collection.extend({
  model: YB.Models.Spread
});

