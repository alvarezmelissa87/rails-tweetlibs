$(document).ready(bindListeners)

function bindListeners() {
  $('.container').one('ajax:success', '#new_story', askForTwitternames)
  $('.container').one('ajax:before', '#new_tweet', loading)
  $('.container').one('ajax:success', '#new_tweet', showTweets)
}

function askForTwitternames(e, data, status, xhr) {
  $('.bottom').append(xhr.responseText)
}

function loading() {
  $('.bottom').html('Loading tweets...')
}

function showTweets(e, data, status, xhr) {
  $('.container').empty()
  $('.container').append(xhr.responseText)
}

