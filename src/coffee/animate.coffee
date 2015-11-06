((window) ->
  cards = document.getElementsByClassName('card')

  Array.prototype.slice.call(cards).map((card, i) ->
    delay = String(i * 0.2) + 's'

    card.style['-moz-animation-delay'] = delay
    card.style['-webkit-animation-delay'] = delay
    card.style['-o-animation-delay'] = delay
    card.style['-ms-animation-delay'] = delay
    card.style['animation-delay'] = delay
  )
)(window)
