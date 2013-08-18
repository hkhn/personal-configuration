# -*- mode: snippet -*-
# name: app.js
# key: app
# --
require.config({
  paths: {
    'jquery': 'http://code.jquery.com/jquery-1.10.2.min',
    'underscore': 'http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.4.4/underscore-min',
    'lodash': 'http://cdnjs.cloudflare.com/ajax/libs/lodash.js/1.3.1/lodash.min',
    'backbone': 'http://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.0.0/backbone-min',
    'backbone-localstorage': 'http://cdnjs.cloudflare.com/ajax/libs/backbone-localstorage.js/1.1.0/backbone.localStorage-min',
    'createjs': 'http://code.createjs.com/createjs-2013.05.14.min'
  },
  shim: {
    'jquery': {
      exports: 'jQuery'
    },
    'underscore': {
      exports: '_'
    },
    'lodash': {
      exports: '_'
    },
    'backbone': {
      deps: ['jquery', 'lodash'],
      exports: 'Backbone'
    },
    'backbone-localstorage': {
      deps: ['backbone'],
      exports: 'BackboneLS'
    },
    'createjs': {
      exports: 'createjs'
    }
  }
});
require(['backbone', 'router/app-router'], function(Backbone, AppRouter) {
  new AppRouter();
  Backbone.history.start();
});
