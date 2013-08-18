# -*- mode: snippet -*-
# name: backbone-router.js
# key: bbr
# --
define(['backbone'], function(Backbone) {
  var ${1:Router} = Backbone.Router.extend({
    routes: {
      '': 'index'
    },
    index: function() {
    }
  });
  return $1;
});