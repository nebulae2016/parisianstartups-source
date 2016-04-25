#= require 'jquery'
#= require 'bootstrap/scrollspy.js'
#= require 'bootstrap/transition.js'
#= require 'bootstrap/dropdown.js'


# $(document).ready ->
#   $('#toggle').click ->
#     $(this).toggleClass 'active'
#     $('nav').toggleClass 'mobile-on'
#     $('nav').toggleClass 'transition-dismiss'
#     $('body').toggleClass 'transition-dismiss'
#     # $('body, html').toggleClass 'overflow'
#     # if navigator.userAgent.match('CriOS')
#       # $('html').toggleClass 'fixed'
#     # return
#   return
# $document = $(document)

# # $(window).resize ->
# #   test = $(window).width()
# #   $('#indicator').text(test)

# $document.scroll ->
#   if $document.scrollTop() >= 60
#     $('nav#navbar').addClass 'notOnTop'
#     $('body.index').addClass 'margintop'
#   else
#     $('nav#navbar').removeClass 'notOnTop'
#     $('body.index').removeClass 'margintop'
#   return
# lastScrollTop = 0
# $(window).scroll (event) ->
#   st = $(this).scrollTop()
#   if st > lastScrollTop
#     $('nav#navbar').removeClass 'scrollup'
#   else
#     $('nav#navbar').addClass 'scrollup'
#     $('nav#navbar').removeClass 'scrolldown'
#   if st < 1
#     $('nav#navbar').removeClass 'scrollup'
#   lastScrollTop = st
#   return
