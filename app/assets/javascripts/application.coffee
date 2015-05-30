#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require jquery.raty
#= require ratyrate

window.onload = ->
  header = document.getElementById('top-logo')
  pictures = new Array('images/1.png', 'images/2.jpg', 'images/3.png')
  numPics = pictures.length
  if document.images
    chosenPic = Math.floor(Math.random() * numPics)
    header.style.background = 'url(' + pictures[chosenPic] + ')'
  return
