$ ->
  $("body").on("input propertychange", ".floating-label-form-group", (e) ->
    $(this).toggleClass "floating-label-form-group-with-value", !!$(e.target).val()
    return
  ).on("focus", ".floating-label-form-group", ->
    $(this).addClass "floating-label-form-group-with-focus"
    return
  ).on "blur", ".floating-label-form-group", ->
    $(this).removeClass "floating-label-form-group-with-focus"
    return

  return