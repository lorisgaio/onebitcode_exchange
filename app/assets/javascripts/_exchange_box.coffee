$(document).ready ->
  $('.arrow').click ->
    cur_1 = $('#currency').val()
    cur_2 = $('#currency_destination').val()
    $('#currency').val(cur_2)
    $('#currency_destination').val(cur_1)
    $('form').submit()

  $('#quantity').keyup ->
    if $('#quantity').val().length > 0
      $('form').submit()

  $('form').submit ->
    if $('form').attr('action') == '/exchange'
      $.ajax '/exchange',
          type: 'POST'
          dataType: 'json'
          data: {
                  currency: $("#currency").val(),
                  currency_destination: $("#currency_destination").val(),
                  quantity: $("#quantity").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;
