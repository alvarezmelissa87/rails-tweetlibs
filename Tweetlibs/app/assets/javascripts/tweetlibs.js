$(document).ready(bindListeners)

function bindListeners() {
  $('.content').on('ajax:success', '#new_story', askForTwitternames)
  $('.content').on('ajax:success', '#new_tweet', showTweets)
}

function askForTwitternames(e, data, status, xhr) {
  $('.bottom').append(xhr.responseText)
  // removeListeners()
}

// function showTweets(e) {
//   debugger
//   e.preventDefault()
//   var ajaxCall = $.ajax({
//     url: e.currentTarget.action,
//     type: 'POST'
//   })
//   ajaxCall.done(displayContent)
// }

function showTweets(e, data, status, xhr) {
  $('#new_tweet').append(xhr.responseText)
}

// function removeListeners() {
//   $('.content').off('ajax:success', '#new_story', askForTwitternames)
//   // $('.content').off('submit', '#new_tweet', showTweets)
// }