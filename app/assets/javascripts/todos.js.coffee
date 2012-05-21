# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
	$(":checkbox").on "click", (event) ->
		todo_id = $(event.currentTarget).attr("id")
		todo_complete = $(event.currentTarget).is(':checked')
		params = {"todo[id]":todo_id, "todo[complete]":todo_complete}
		Todo.API.complete(params)
		$("#todo_" + todo_id).removeClass('completed_true completed_false') 
		$("#todo_" + todo_id).addClass("completed_"+todo_complete)
	
	$("#todos").sortable
		axis: "y"
		dropOnEmpty: false
		handle: "i"
		cursor: "crosshair"
		items: "li"
		opacity: 0.4
		update: ->
			sortData = $("#todos").sortable("serialize")
			Todo.API.sort(sortData)
	