#= require jquery
#= require jquery_ujs
#= require underscore
#= require ./backbone/todomvc

if typeof window.console == "undefined"
  window.console = { log: -> }
else if typeof window.console.log == "undefined"
  window.console.log = ->

try
  window.pp = _.bind(window.console.log, console)
catch ex
  window.pp = -> window.console.log(arguments)

$(document).ready ->
  pp "application.js"
