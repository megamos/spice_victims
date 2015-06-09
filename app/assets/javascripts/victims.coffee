# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  victim = gon.victims_latest
  current = 0
  
  change_victim = (current) ->
    $('#name').text(victim[current].name)
    $('#age').text(victim[current].age)
    $('#country').text(victim[current].country)
    $('#info').text(victim[current].info)
    $('#link').attr("href", victim[current].link)
  
    
  $('.control-prev').click ->
    if current > 0
      current -= 1
      change_victim(current)
    else
      current = 9
      change_victim(current)
      
  $('.control-next').click ->
    if current < 9
      current += 1
      change_victim(current)
    else
      current = 0
      change_victim(current)
  change_victim(current)