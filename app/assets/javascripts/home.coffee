# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('ready page:load' , ->

  setTimeout($('#img1').addClass('animated bounceInLeft'),500)
  setTimeout($('#img2').addClass('animated bounceInRight'), 1500)
  setTimeout($('#img3').addClass('animated bounceInDown'), 2000)
)