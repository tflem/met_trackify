# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('.message .close').on('click', 
    -> $(this).closest('.message').transition('fade')  
  )   

$(document).ready(ready)
$(document).on('page:load', ready)

ready = ->
  $('#date-received').calendar({
    type: 'date'
  }); 

$(document).on('turbolinks:load', ready)

