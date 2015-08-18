window.BackendApp.controller 'CoreSettingsController', ($scope, $rootScope, $window, $timeout, viewport) ->

  $scope.core =
    name: 'Pixel'
    version: '0.0.1 '
    settings:
      fullScreen: false
      pageLoading: false
      headerFixed: true
      headerSearchForm: false
      sidebarLeftOpen: false
      sidebarLeftFixed: false
      sidebarLeftCollapse: viewport.width() >= 768 && viewport.width() < 992 ? true : false
    screen:
      xs: viewport.width() < 768 ? true : false
      sm: viewport.width() >= 768 && viewport.width() < 992 ? true : false
      md: viewport.width() >= 992 && viewport.width() < 1200 ? true : false
      lg: viewport.width() >= 1200 ? true : false
      height: viewport.height()
      width: viewport.width()

  angular.element($window).on 'resize', ->
    $timeout.cancel($scope.resizing)

    $scope.resizing = $timeout ->
      $scope.core.screen.xs = viewport.width() < 768 ? true : false
      $scope.core.screen.sm = viewport.width() >= 768 && viewport.width() < 992 ? true : false
      $scope.core.screen.md = viewport.width() >= 992 && viewport.width() < 1200 ? true : false
      $scope.core.screen.lg = viewport.width() >= 1200 ? true : false
      $scope.core.screen.height = viewport.height()
      $scope.core.screen.width = viewport.width()
    , 100