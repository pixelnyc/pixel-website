class window.Header
  static: false
  active: true
  hasBack: false

  constructor: (@container, @sliderMode=false) ->
    @bindScrollingAcvity()
    @bindMainSliderHandling()

  bindMainSliderHandling: ->
    @sliderChannel = postal.channel('main-slider')

    @sliderChannel.subscribe 'slider.active',   (data, envelope) =>
      @static = true
    @sliderChannel.subscribe 'slider.inactive', (data, envelope) =>
      @static = false


  bindScrollingAcvity: ->
    $(window).on 'mousewheel DOMMouseScroll', (event) =>

      unless @static
        delta = event.originalEvent.wheelDelta / 30 || -event.originalEvent.detail

        if delta < -0.2
          @deactivate()
        else if delta > 0.2 || $(window).scrollTop() == 0
          @activate()

        if event.pageY > 100 && $(window).scrollTop() > 20
          @activateBack()
        else
          @deactivateBack()


  activate: ->
    unless @active
      @container.addClass('active')
      @active = true

  deactivate: ->
    if @active
      @container.removeClass('active')
      @active = false

  activateBack: ->
    unless @hasBack
      @container.addClass('with-back')
      @hasBack = true

  deactivateBack: ->
    if @hasBack
      @container.removeClass('with-back')
      @hasBack = false