class window.CasesSlider
  KEY_CODES:
    UP: 38,
    DOWN: 40

  SLIDER_ACTIVATE_TIME: 1000
  SCROLL_THRESHOLD = 25

  constructor: (@slidesContainer, @navButtons) ->
    @active = true
    @delta = null
    @dragThreshold = 0.20
    @dragStart = null
    @percentage = 0
    @target = null
    @previousTarget = null


    @body = $('body')
    @window = $(window)
    @windowHeight = @window.height()
    @document = $(document)
    @currentSlideIndex = 0
    @slides = @slidesContainer.find('.slide')
    @slidesCount = @slides.length
    @skipSliderBtn = @slidesContainer.find('[data-skip-slider]')

    @bindListeners()
    @stabilize()
    @setSlidesBackgrounds()
    @showSlide()

  stabilize: ->
    setTimeout =>
      @document.scrollTop(0)
    ,100

  activate: ->
    @active = true
    @body.css(overflow: 'hidden')
    @body.removeClass('shifted')

  deactivate: ->
    @body.css(overflow: 'auto')
    @body.addClass('shifted')

    setTimeout =>
      @active = false
    , 900

  setSlidesBackgrounds: ->

    if Modernizr.touch
      @slides.each (i, slide) =>
        height = @window.height()
        $(slide).css('background-size': 'auto ' + height + 'px')
        $(slide).css('-webkit-background-size': 'auto ' +  height + 'px')

  bindListeners: ->
    @window.on "mousewheel DOMMouseScroll", (event) =>
      @onMouseWheel(event)
    @document.on "keydown", (event) =>
      @onKeyDown(event)
    @navButtons.on "click", (event) =>
      @onNavButtonClick(event)

    @document.on "touchstart", (event) =>
      @onTouchStart(event)
    @document.on "touchmove", (event) =>
      @onTouchMove(event)
    @document.on "touchend", (event) =>
      @onTouchEnd(event)

    @window.on 'resize', (event) =>
      @setSlidesBackgrounds()

    @skipSliderBtn.click (event) =>
      @currentSlideIndex = @slidesCount
      @deactivate()

      false



  onKeyDown: (event) ->
    pressedKey = event.keyCode

    if pressedKey == @KEY_CODES.UP
      @goToPrevSlide()
      event.preventDefault()
    else if pressedKey == @KEY_CODES.DOWN
      @goToNextSlide()
      event.preventDefault()


  onMouseWheel: (e) ->
    if e.originalEvent.detail < 0 || e.originalEvent.wheelDelta > 0
      @delta--

      if Math.abs(@delta) >= SCROLL_THRESHOLD
        @goToPrevSlide()
    else
      @delta++

      if @delta >= SCROLL_THRESHOLD
        @goToNextSlide()

    if @active
      return false

  onTouchStart: (event) ->
    if @dragStart != null
      return

    if event.originalEvent.touches
      event = event.originalEvent.touches[0]

    @dragStart = event.clientY

    if @currentSlideIndex < @slidesCount
      @target = @slides.eq(@currentSlideIndex)[0]
      @target.classList.add 'no-animation'

    @previousTarget = @slides.eq(@currentSlideIndex - 1)[0]
    @previousTarget.classList.add 'no-animation'

    return

  onTouchMove: (event) ->
    if @dragStart == null
      return

    if event.originalEvent.touches
      event = event.originalEvent.touches[0]

    @delta = @dragStart - (event.clientY)

    @percentage = @delta / @windowHeight

    if @active
      false

  onTouchEnd: ->
    @dragStart = null
    @target.classList.remove 'no-animation'

    if @previousTarget
      @previousTarget.classList.remove 'no-animation'
    if @percentage >= @dragThreshold
      @goToNextSlide()
    else if Math.abs(@percentage) >= @dragThreshold
      @goToPrevSlide()
    else
      @showSlide()

    @percentage = 0
    return

  onNavButtonClick: (event) ->
    slideIndex = $(event.target).data("slide-index")
    @currentSlideIndex = parseInt(slideIndex)

    @showSlide()
    event.preventDefault()


  goToPrevSlide: ->
    if @currentSlideIndex == @slidesCount
      @activate()

    @currentSlideIndex--
    if @currentSlideIndex < 0
      @currentSlideIndex = 0


    @showSlide()


  goToNextSlide: ->
    @currentSlideIndex++

    if @currentSlideIndex == @slidesCount
      @deactivate()

    if @currentSlideIndex >= @slidesCount
      @currentSlideIndex = @slidesCount

    @showSlide()

  showSlide: () ->
    @delta = 0
    setTimeout =>
      @delta = 0
    , 400

    @slides.each (i, slide) =>
      $(slide).toggleClass('active', (i >= @currentSlideIndex))

    @navButtons.filter('.active').removeClass('active')
    @navButtons.filter("[href=#slide-" + @currentSlideIndex + "]").addClass('active')