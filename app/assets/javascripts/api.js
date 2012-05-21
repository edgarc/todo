window.Todo = window.Todo || {};

Todo.API = (function() {
  var _api;

  _api = {
    onError: function(error) {
      console.log("Error");
	  console.log(error);
    },
	
    onDefault: function(response) {
      console.log(response);
    },

    sort: function(payload, callback) {
      $.ajax(_api.params({
        url: "/todos/sort",
		type: "POST",
        dataType: "script",
        data: payload
      }, callback || _api.onDefault));
    },

    complete: function(payload, callback) {
      $.ajax(_api.params({
        url: "/todos/update",
        type: "POST",
		data: payload
      }, callback || _api.onDefault));
    },

    params: function(options, callback) {
      return $.extend({
        success: function(data) {
          try {
             (callback || _api.onDefault)(data);
          } catch (e) {
             _api.onError(e);
          }
        }
      }, options);
    }
  }
  return _api;
}());