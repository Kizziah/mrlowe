removeHourFromTable = (hour) ->
  table = $("table.hours td")
  table.each ->
    if $(this).attr("class") is hour
      $(this).hide()

monthInWords = (monthNum) ->
  return "January"  if monthNum is 0
  return "February"  if monthNum is 1
  return "March"  if monthNum is 2
  return "April"  if monthNum is 3
  return "May"  if monthNum is 4
  return "June"  if monthNum is 5
  return "July"  if monthNum is 6
  return "August"  if monthNum is 7
  return "September"  if monthNum is 8
  return "October"  if monthNum is 9
  return "November"  if monthNum is 10
  return "December"  if monthNum is 11

dayOfTheWeek = (day) ->
  return "Monday" if day is 0
  return "Tuesday" if day is 1
  return "Wensday" if day is 2
  return "Thursday" if day is 3
  return "Friday" if day is 4
  return "Saturday" if day is 5
  return "Sunday" if day is 6

$ ->
  $("#hour_picker").hide()
  currentTime = new Date()
  month = currentTime.getMonth()
  day = currentTime.getDate()
  year = currentTime.getFullYear()

  $("#datepicker").datepicker
    minDate: new Date(year, month, day)
    dateFormat: "yy-mm-dd"
    onSelect: (dateText) ->
      dateString = dateText

      $("#hour_picker").show()
      $("#final_hour h2").empty()
      $("#final_date h2").empty()
      $(".appointment_button").hide()

      day_of_the_week = new Date(dateString)
      selectedDate = new Date(dateString)
      monthstring = selectedDate.getMonth()
      daystring = selectedDate.getDay()
      dateNumString = selectedDate.getDate()
      yearString = selectedDate.getFullYear()
      monthWord = monthInWords(monthstring)
      dayName = dayOfTheWeek(daystring)

      getAppointments dateString
      $("#availability h6").empty()
      $("#availability h6").append('Availability for ' + dayName + ', ' + monthWord + ' ' + (dateNumString + 1) + ', ' + yearString)
      $("input#appointment_date").val(dateString)

getAppointments = (chosen_date) ->
  $("table td").each ->
    $(this).show()

  $("#hidden_hour_div").empty()
  $("th.selected_date").empty()
  $.ajax
    type: "GET",
    url: "/../appointments",
    dataType: "JSON",
    cache: false,
    data:
      matched_date: chosen_date

    success: (html) ->
      $.each html, (i, item) ->
        removeHourFromTable(html[i])

calenderDateClickAction = (date) ->
  $("input#appointment_hour").val(date.attr("class"))
  $('#final_hour h2').empty()
  $('#final_hour h2').append(date.html())
  $(".appointment_button").show()


jQuery ->
  $("table.hours td").click (event) ->
    calenderDateClickAction($(this))
