window.BackendApp.directive 'summernote', () ->
  {
    restrict: 'A'
    link: ($scope, elem, attr, ctrl) ->
      $(elem).summernote(
        lang: 'ru-RU'
        toolbar: [
          ['style', ['style']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['height', ['height']],
          ['table', ['table']],
          ['insert', ['link', 'image', 'video', 'hr']],
          ['view', ['fullscreen', 'codeview']],
        ]
        styleTags: ['p', 'blockquote', 'pre', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6']
      )
  }