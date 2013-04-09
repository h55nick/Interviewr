window.app =
  document_ready: ->
    $('#form').on('click', 'a[data-clear-form]', app.clear_form)
    console.log('app.ready')
  clear_form: (e) ->
    e.preventDefault()
    $('#login').children().show();
    $('#form').empty()
   clear_login: () ->
     $('#login_form').empty();
     $('#login_button').children().show();
     $('#login').children().show();

$(document).ready(app.document_ready)
