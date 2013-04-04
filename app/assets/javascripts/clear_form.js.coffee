window.app =
  document_ready: ->
    $('#form').on('click', 'a[data-clear-form]', app.clear_form)

clear_form: (e) ->
    e.preventDefault()
    $('#form').slideUp()