$(document).ready ->
  victim = gon.victims_latest if gon
  current = 0
  
  change_victim = (current) ->
    $('#name').text(victim[current].name)
    $('#age').text(victim[current].age + " years old")
    $('#country').text("from " + 
    victim[current].country)
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
      
  $(document).ready ->
    change_victim(current)