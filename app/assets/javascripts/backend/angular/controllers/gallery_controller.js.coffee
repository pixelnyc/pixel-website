window.BackendApp.controller 'GalleryController', ($scope, FileUploader, Photo) ->
  $scope.showProgressBar = false
  $scope.allChecked = false
  $scope.photos = []

  Photo.query({ gallery_id: $scope.galleryId}).then (photos) ->
    $scope.photos = photos.data


  ### UPLOADER ###
  $scope.uploader = new FileUploader
    scope: $scope
    headers:
      'X-CSRF-TOKEN' : window.csrfToken
    url: "/backend/galleries/#{$scope.galleryId}/photos.json",

  $scope.uploader.onAfterAddingAll = (event, items) ->
    $scope.showProgressBar = true
    @uploadAll()

  $scope.uploader.onSuccessItem = (item, response, status, headers) ->
    if status == 200
      $scope.photos.unshift response

  $scope.uploader.onCompleteAll = (event, items) ->
    $scope.showProgressBar = false

  # Images only
  $scope.uploader.filters.push
    name: 'imagesOnly',
    fn: (item) ->
      type = if $scope.uploader.isHTML5 then item.type else '/' + item.value.slice(item.value.lastIndexOf('.') + 1)
      type = '|' + type.toLowerCase().slice(type.lastIndexOf('/') + 1) + '|'

      '|jpg|png|jpeg|bmp|gif|'.indexOf(type) != -1

  $scope.removePhoto = (photo) ->
    Photo.delete({id: photo.id, gallery_id: $scope.galleryId}).then ->
      index = $scope.photos.indexOf photo
      $scope.photos.splice index, 1 if index isnt -1

