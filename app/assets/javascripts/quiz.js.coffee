window.quiz =
    document_ready:->
        console.log('quiz ready')
        $('.answers').hide();
        ###Question form ###
        $('#questionform').addClass('hide')
        $('#addquestion').click(quiz.show_questionform)
        $('#createquestion').click(aj.add_question)
        $('#difficulty').attr('data-difficulty',5)
        ###Toggles###
        $('#questions').on('click', '.question',quiz.show_answers)
        $('#private').click(quiz.toggle_private)
        $('#correct').click(quiz.toggle_correct)
        ###AJAX###
        $('#create_quiz').click(aj.create_quiz)
        $('#add_tag').click(aj.add_tags)
        $('#add_answer').click(aj.add_answer)
        ###Slider###
        $( "#difficulty" ).slider({
              value:5
              min: 0
              max: 10
              step: 1
              slide: (event, ui ) ->
                $('#difficulty').attr("data-difficulty", ui.value)
                #console.log( ui.value)
                })

    show_questionform:->
        $('#questionform').toggleClass('hide')
    show_answers:->
        $('.answers').slideUp()
        $(this).children().slideDown()
    toggle_private:->
        current = $('#private').attr('data-priv') == 'true'
        $(this).attr('data-priv', !current)
        $(this).text(!current)
        $(this).toggleClass('priv')
    toggle_correct:->
        current = $('#correct').attr('data-correct') == 'true'
        $(this).attr('data-correct', !current)
        $(this).text(!current)
        $(this).toggleClass('correct')



$(document).ready(quiz.document_ready)