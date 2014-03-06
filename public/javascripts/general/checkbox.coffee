$ ->
  $(".list-group.checked-list-box .list-group-item").each ->

    updateDisplay = ->
      isChecked = $checkbox.is(":checked")
      
      $widget.data "state", (if (isChecked) then "on" else "off")
      
      $widget.find(".state-icon").removeClass().addClass "state-icon " + settings[$widget.data("state")].icon
      
      if isChecked
        $widget.addClass style + color + " active"
      else
        $widget.removeClass style + color + " active"
      return
    
    init = ->
      $checkbox.prop "checked", not $checkbox.is(":checked")  if $widget.data("checked") is true
      updateDisplay()
      
      $widget.prepend "<span class=\"state-icon " + settings[$widget.data("state")].icon + "\"></span>"  if $widget.find(".state-icon").length is 0
      return
    $widget = $(this)
    $checkbox = $("<input type=\"checkbox\" class=\"hidden\" />")
    color = ((if $widget.data("color") then $widget.data("color") else "success"))
    style = ((if $widget.data("style") is "button" then "btn-" else "list-group-item-"))
    settings =
      on:
        icon: "glyphicon glyphicon-check"

      off:
        icon: "glyphicon glyphicon-unchecked"

    $widget.append $checkbox
    $widget.on "click", '.state-icon', ->
      $checkbox.prop "checked", not $checkbox.is(":checked")
      $checkbox.triggerHandler "change"
      updateDisplay()
      return

    $checkbox.on "change", ->
      updateDisplay()
      return

    init()
    return

  $("#get-checked-data").on "click", (event) ->
    event.preventDefault()
    checkedItems = {}
    counter = 0
    $("#check-list-box li.active").each (idx, li) ->
      checkedItems[counter] = $(li).text()
      counter++
      return

    $("#display-json").html JSON.stringify(checkedItems, null, "\t")
    return

  return
