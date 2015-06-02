#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require jquery.raty
#= require ratyrate

window.onload = ->
  path = '/app/public/'
  header = document.getElementById('top-logo')
  pictures = new Array('1.png', '2.jpg', '3.png')
  numPics = pictures.length
  if document.images
    chosenPic = Math.floor(Math.random() * numPics)
    header.style.background = 'url("/images/'+pictures[chosenPic]+'")'
