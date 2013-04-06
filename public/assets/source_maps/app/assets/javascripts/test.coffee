window.test =
    docready:->
      $('body').on('click','.option',test.aselect)
      $('body').on('click','#stest',test.calc_score)
      $('body').on('click',"#seecorrect",test.show_correct)
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
    show_correct:->
      console.log("Showing Correct")
      $('.option')[0..-2].each (i,option) =>
          console.log($(option).attr("data-correct")=='true')
          if($(option).attr("data-correct") == "true")
            $(option).addClass('correct')
          else
            $(option).addClass('incorrect')







$(document).ready(test.docready)
