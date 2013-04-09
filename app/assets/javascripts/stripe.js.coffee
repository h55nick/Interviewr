window.stripe =
  document_ready: ->
    console.log('stripe.ready')
    $('body').on('token', '.stripe-button', stripe.token_generated)
  token_generated: (e, token) ->
    e.preventDefault()
    $(this).siblings('form').append("<input type=hidden name=token value=#{token.id}>").submit()

$(document).ready(stripe.document_ready)