window.graph =
  document_ready:->
      graph.get_chart();
      # graph.display_chart()

  get_chart:->
    settings =
      dataType: 'json'
      type: "get"
      url: "/quizzes/graph/"
    $.ajax(settings).done(graph.display_chart)
    return false

  display_chart:(results) ->
    new Morris.Line({
      element: $('#graph')
      data: results,
      xkey: "date"
      ykeys: ["score"]
      # labels: [@quiz.person_id]
      labels: ['label']
      hoverCallback: (index, options) ->
        result = options.data[index]
        return "#{result.name}: #{result.score}"
      ymin: "auto"
      ymax: "auto"
    });
$(document).ready(graph.document_ready)
