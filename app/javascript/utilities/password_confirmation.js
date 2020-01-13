$(document).on('turbolinks:load', function () {
  var passwordField = $('#user_password')
  var confirmationField = $('#user_password_confirmation')

  // Not bind keyups if confirmation field not exist
  if (confirmationField.length) {
    confirmationField.on('input', confirmationAlerts)
    passwordField.on('input', confirmationAlerts)
  }

  function confirmationAlerts() {
    if (confirmationField.val() === '') {
      reset()
    } else if (passwordField.val() === confirmationField.val()) {
      passed()
    } else {
      passent()
    }
  }

  function reset() {
    $('.passed').addClass('hide')
    $('.passend').addClass('hide')
  }

  function passent() {
    $('.passed').removeClass('hide')
    $('.passend').addClass('hide')
  }

  function passed() {
    $('.passend').removeClass('hide')
    $('.passed').addClass('hide')
  }
})
