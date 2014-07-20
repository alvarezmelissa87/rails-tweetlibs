$(document).ready(bindListeners)

function bindListeners() {
  $('#new_story').on('ajax:success', askForTwitternames)
  $('#new_tweet').on('ajax:success', showTweets)
}

function askForTwitternames(e, data, status, xhr) {
  $('#new_story').append(xhr.responseText)
}

function showTweets(e, data, status, xhr) {
  $('body').clear
  $('#new_tweet').append(xhr.responseText)
}
// $(document).ready(ajax)
//   $("#_post").on("ajax:success", (e, data, status, xhr) ->
//     $("#new_post").append xhr.responseText
//   ).on "ajax:error", (e, xhr, status, error) ->
//     $("#new_post").append "<p>ERROR</p>"