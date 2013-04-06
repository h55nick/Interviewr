window.test =
    docready:->
      $('body').on('click','.option',test.aselect)
      $('body').on('click','#stest',test.calc_score)
    aselect:->
      current = $(this).attr('data-selected') == 'true'
      $(this).attr('data-selected', !current)
      $(this).toggleClass('selected')
    calc_score:->
      complete = $.makeArray($(".option").map(->
        $(this).attr("data-correct") == $(this).attr('data-selected')
        ))
      t = 0
      complete.map((e)-> t += e==true)
      score = t / complete.length
      qid = $('.submit').data('qid');
      data = {score:score,qid:qid}
      settings =
          dataType: 'script'
          method: 'POST'
          url: '/quizresults'
          data:data
        $.ajax(settings)




$(document).ready(test.docready)
