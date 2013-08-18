# -*- mode: snippet -*-
# name: app-router.js
# key: approuter
# --
define(['backbone'], function(Backbone) {
  var AppRouter = Backbone.Router.extend({

    initialize: function() {
      this.$header = $('#header');
      this.$content = $('#content');
      this.$footer = $('#footer');
    },

    routes: {
      '': 'index'
    },

    index: function() {
    }

  });
  return AppRouter;
});
