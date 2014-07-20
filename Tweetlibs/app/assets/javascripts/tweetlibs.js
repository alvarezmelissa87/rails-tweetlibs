$(document).ready(bindListeners)

function bindListeners() {
  $('#new_story').on('ajax:success', askForTwitternames)
  $('#new_tweet').on('ajax:success', showTweets)
}

function askForTwitternames(e, data, status, xhr) {
  $('#new_story').append(xhr.responseText)
}

function showTweets(e, data, status, xhr) {
  $('body').clear()
  $('#new_tweet').append(xhr.responseText)
}
