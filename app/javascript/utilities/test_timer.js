$(document).on('turbolinks:load', function() {
  let $timer = $('.time-left')
  if ($timer.length) {
    var secounds = $timer.data("left-time")
    setInterval(function(){
      secounds--
      var date = new Date(0, 0, 0)
      date.setSeconds(secounds)
      var h = date.getHours()
      var m = date.getMinutes()
      var s = date.getSeconds()
      $timer.text(`${h}:${m}:${s}`)
      if (secounds <= 0) {
        $("form").submit()
      }
    }, 1000)
  }
})

function updateTime() {

}
function formatDate(date) {
    var d = new Date(date),
        h = '' + (d.getHours() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join(':');
}
