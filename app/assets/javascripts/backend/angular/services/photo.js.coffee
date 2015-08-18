window.BackendApp.service 'Photo', ($http) ->
  factory = {}

  factory.query = (params) ->
    $http.get("/backend/galleries/#{params.gallery_id}/photos.json", params: params)


  factory.delete = (params) ->
    $http.delete("/backend/galleries/#{params.gallery_id}/photos/#{params.id}")

  factory