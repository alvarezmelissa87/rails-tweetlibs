$(document).ready(bindListeners)

function bindListeners() {
  $('.container').on('ajax:success', '#new_story', askForTwitternames)
  $('.container').on('ajax:success ajax:send', '#new_tweet', tweetHelper)
  // $('.container').on('ajax:send', '#new_tweet', loading)
}

function askForTwitternames(e, data, status, xhr) {
  $('.bottom').append(xhr.responseText)
  // $('.container').off('ajax:success', '#new_story', askForTwitternames)
}

function tweetHelper(e, data, status, xhr) {
  debugger
  if (e.type === 'ajax:send') {
    loading()
  } else {
    showTweets(e, data, status, xhr)
  }
}

function loading(e, data, status, xhr) {
  $('.bottom').append('Loading tweets...')
}

function showTweets(e, data, status, xhr) {
  console.log('balls')
  $('.container').empty()
  $('.container').append(xhr.responseText)
  $('.container').off('ajax:send', '#new_tweet', loading)
  $('.container').off('ajax:success', '#new_tweet', showTweets)
}

