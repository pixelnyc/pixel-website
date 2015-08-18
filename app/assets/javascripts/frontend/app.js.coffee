$ ->
  header = new Header($('[data-header]'))

  initializeMenu = ->
    burgerButton = $('[data-menu-open]')
    nav = $('[data-navigation]')

    burgerButton.on 'click', ->
      if nav.hasClass('active')
        nav.removeClass('active').addClass('closed')
      else
        nav.removeClass('closed').addClass('active')

  initializeCasesSlider = ->
    sliderObj = $('[data-slider-container]')
    if sliderObj.length > 0
      slider = new CasesSlider(sliderObj, $('[data-slider-nav]'))

  moveDownContainer = $('[data-move-down]')
  if moveDownContainer.length > 0
    $(window).scroll ->
      unless moveDownContainer.hasClass('active')
        moveDownContainer.addClass('active')

  $('[data-open-application-form]').on 'click touch', (e) ->
    form = $('[data-application-form]')
    form.toggleClass('active')

    form.find('input[type=text]').eq(0).focus()

    e.preventDefault()

  screenLoader = $('[data-screen-loader]')
  if screenLoader?
    setTimeout ->
      screenLoader.addClass('inactive')
      setTimeout ->
        screenLoader.hide()
      , 700
    , 1300



  applicationFormContainer = $('[data-application-form-container]')

  $("#new_application").on "ajax:success", (e, data, status, xhr) ->
    applicationFormContainer.html('')
    applicationFormContainer.append xhr.responseText


  swiper = new Swiper('[data-project-slider]', {
    nextButton: '.swiper-button-next'
    prevButton: '.swiper-button-prev'
    slidesPerView: 1
    paginationClickable: true
    spaceBetween: 0
    loop: true
  });

  initializeMenu()
  initializeCasesSlider()