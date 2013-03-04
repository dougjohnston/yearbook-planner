YB.Views.Yearbook = Backbone.View.extend({
  initialize: function(){
    this.render();
  },
  render: function(){
    var template = _.template( $("#ladder-title-template").html(), {} );
    this.$el.html(template);
  }
});
