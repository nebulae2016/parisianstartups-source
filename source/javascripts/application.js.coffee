#= require 'jquery'

$(document).ready ->
  $('#toggle').click ->
    $(this).toggleClass 'active'
    $('nav').toggleClass 'mobile-on'
    $('nav').toggleClass 'transition-dismiss'
    $('body').toggleClass 'transition-dismiss'
    # $('body, html').toggleClass 'overflow'
    # if navigator.userAgent.match('CriOS')
      # $('html').toggleClass 'fixed'
    # return
  return
$document = $(document)

$(window).resize ->
  test = $(window).width()
  $('#header').text(test)

$document.scroll ->
  if $document.scrollTop() >= 350
    $('header#header').addClass 'notOnTop'
    $('#content').addClass 'margintop'
  else
    $('header#header').removeClass 'notOnTop'
    $('#content').removeClass 'margintop'
  return
lastScrollTop = 0
$(window).scroll (event) ->
  st = $(this).scrollTop()
  if st > lastScrollTop
    $('header#header').removeClass 'scrollup'
  else
    $('header#header').addClass 'scrollup'
    $('header#header').removeClass 'scrolldown'
  if st < 1
    $('header#header').removeClass 'scrollup'
  lastScrollTop = st
  return
