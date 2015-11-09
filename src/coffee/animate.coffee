((window) ->
  splats= document.getElementsByClassName('splat-img')
  cards = document.getElementsByClassName('card')

  Array.prototype.slice.call(splats).map((splat, i) ->
    delay = String(i * 0.2) + 's'

    splat.style['-webkit-animation-delay'] = delay
    splat.style['-moz-animation-delay'] = delay
    splat.style['-o-animation-delay'] = delay
    splat.style['-ms-animation-delay'] = delay
    splat.style['animation-delay'] = delay
  )

  Array.prototype.slice.call(cards).map((card, i) ->
    delay = String((i + splats.length) * 0.2) + 's'

    card.style['-webkit-animation-delay'] = delay
    card.style['-moz-animation-delay'] = delay
    card.style['-o-animation-delay'] = delay
    card.style['-ms-animation-delay'] = delay
    card.style['animation-delay'] = delay
  )
)(window)
