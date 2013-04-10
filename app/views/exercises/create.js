$('#exercise_form').empty();
$('#exercise').empty().append("<%=j render 'exercise' %>");
$('#question,#cost').val('');
$('#taglist,#answerlist').empty();
quiz.clear_question_form();
