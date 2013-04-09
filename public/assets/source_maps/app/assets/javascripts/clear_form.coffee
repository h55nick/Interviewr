window.app =
  document_ready: ->
    $('#form').on('click', 'a[data-clear-form]', app.clear_form)

  clear_form: (e) ->
    e.preventDefault()
    $('#login').children().show();
    $('#form').empty()
   clear_login: () ->
     $('#login_form').remove()
     $('#login_button').children().show();
     $('#login').children().show();

$(document).ready(app.document_ready)
