$(document).ready(bindListeners)

function bindListeners() {
  $('.container').one('ajax:success', '#new_story', askForTwitternames)
  $('.container').one('ajax:success ajax:send ajax:error', '#new_tweet', tweetHelper)
  $('.container').one('ajax:success', '.edit_tweet', showStory)
  $('.container').one('ajax:success', '.home', goHome)
}

function askForTwitternames(e, data, status, xhr) {
  $('.bottom').append(xhr.responseText)
}

function tweetHelper(e, data, status, xhr) {
  if (e.type === 'ajax:send') {
    loading()
  } else if (e.type === 'ajax:error') {
    tweetError(e, data, status, xhr)
  } else {
    showTweets(e, data, status, xhr)
  }
}

function loading(e, data, status, xhr) {
  $('.bottom p').text('Loading tweets...')
}

function tweetError(e, data, status, xhr) {
  $('.bottom p').text('Please enter valid Twitter names and try again.')
  clearForm()
  $('.container').one('ajax:success ajax:send ajax:error', '#new_tweet', tweetHelper)
}

function clearForm() {
  $('#tweet_twitter_name1').val('')
  $('#tweet_twitter_name2').val('')
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
