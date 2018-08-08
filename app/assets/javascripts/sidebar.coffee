ready = ->

  $('.ui.sidebar')
  .sidebar('attach events', '.item.sidebar')

$(document).ready(ready)
$(document).on('turbolinks:load', ready) 