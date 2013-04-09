window.aj =
  ready: ->
    console.log('aj.ready')
    $('body').on('keyup', '#search', aj.filter_quizzes)
  create_quiz:(e)->
    console.log("Create Quiz")
    name = $('#name').val();
    exercises = []
    exercises = $.makeArray($("[data-eid]").map(->
          $(this).attr "data-eid"
        ))
    priv = $('#private').data('priv')
    data = {exercises: exercises, priv: priv, name:name}
    settings =
      dataType: 'script'
      method: 'POST'
      data: data
      url: "/quizzes"
    $.ajax(settings)
  filter_quizzes: (e) ->
    query = $('#search').val()
    if query.length == 0
      settings =
        dataType: 'script'
        type: 'get'
        url: "/quizzes"
      $.ajax(settings)
    else
      settings =
        dataType: 'script'
        type: 'get'
        url: "/quizzes/search?query=#{query}"
      $.ajax(settings)
  add_tags:(e)->
    console.log('add tags')
    e.preventDefault
    tags = $('#tags').val()
    settings =
      dataType: 'script'
      method: 'POST'
      url: "/tags?tags=#{tags}"
    $.ajax(settings)
  add_answer:->
    console.log('adding answers')
    answer = $('#answer').val()
    correct = $('#correct').attr('data-correct');
    settings =
      dataType: 'script'
      method: 'POST'
      url: "/options?answer=#{answer}&correct=#{correct}"
    $.ajax(settings)
  add_question:->
    console.log('adding question')
    tags = []
    tags = $.makeArray($("[data-tid]").map(->
          $(this).attr "data-tid"
        ))
    answers = []
    answers = $.makeArray($("[data-oid]").map(->
          $(this).attr "data-oid"
        ))
    question = $('#question').val();
    cost = $('#cost').val();
    difficulty = $('[data-difficulty]').first().data().difficulty;
    data = {answers: answers, tags:tags,cost:cost,question:question,difficulty:difficulty}
    settings =
      dataType: 'script'
      method: 'POST'
      url: "/exercises"
      data: data
    $.ajax(settings)
    #arrayVariable = $.makeArray$("note").ma $(this).attr("noteId");

$(document).ready(aj.ready)