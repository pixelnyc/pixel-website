window.BackendApp.service 'viewport', ($window) ->
  height: ->
    window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight
  width: ->
    window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth