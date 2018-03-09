# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.tag-input').on('input', ->
    isValid = undefined
    isValid = ($(this).val().match(/,/g) or []).length < 5
    if !isValid
      $('.new-question-submit').attr 'disabled', 'disabled'
      $('.new-question-submit').addClass 'disable-btn'
      $('.max-tags').text 'Maximum of 5 tags allowed.'
    else
      $('.new-question-submit').removeAttr 'disabled'
      $('.new-question-submit').removeClass 'disable-btn'
      $('.max-tags').empty()
    return
  ).trigger 'input'
  return