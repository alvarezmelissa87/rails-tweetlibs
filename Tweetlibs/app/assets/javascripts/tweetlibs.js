$(document).ready(bindListeners)

function bindListeners() {
  $('.container').on('ajax:success', '#new_story', askForTwitternames)
  $('.container').on('ajax:success ajax:send', '#new_tweet', tweetHelper)
  $('.container').on('ajax:success', '.edit_tweet', showStory)
  $('.container').on('ajax:success', '.home', goHome)
}

function askForTwitternames(e, data, status, xhr) {
  $('.bottom').append(xhr.responseText)
}

function tweetHelper(e, data, status, xhr) {
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
  $('.container').empty()
  $('.container').append(xhr.responseText)
}

function showStory(e, data, status, xhr) {
  $('.container').empty()
  $('.container').append(xhr.responseText) 
}

function goHome(e, data, status, xhr) {
  $('body').empty()
  $('body').append(xhr.responseText)
  bindListeners()
}