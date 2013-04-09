window.person =
  document_ready:->
    console.log('person.ready')
  get_chart: (i)->
    id = parseInt(i)
    settings =
      dataType: 'json'
      type: "get"
      url: "/people/#{id}/graph"
    $.ajax(settings).done(graph.display_chart)
    return false

  display_chart:(results) ->
    new Morris.Line({
      element: $('#graph')
      data: results,
      xkey: "date"
      ykeys: ["score"]
      labels: ['label']
      hoverCallback: (index, options) ->
        result = options.data[index]
        return "#{result.name}: #{result.score}"
      ymin: "auto"
      ymax: "auto"
    });
$(document).ready(person.document_ready)
