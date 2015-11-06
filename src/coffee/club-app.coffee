((window) ->
  club = {}
  club.list = m.prop([])

  club.controller = ->
    m.request({
      method: 'GET'
      url: './assets/datas/clubs.json'
      initialValue: []
    }).then((value) ->
      club.list(value);
      m.redraw()
    )

  club.view = () ->
    m('ul.fa-ul.m-b-0', [
      club.list().map((item) ->
        m('li', [
          m('i.fa.fa-li', {
            class: 'fa-' + item.icon
          }),
          m('a.link-white[target=_blank]', {
            href: item.url
          }, [
            item.name,
            m('i.fa.fa-external-link.m-l-sm')
          ])
        ])
      )
    ])

  m.mount(document.getElementById('club-app'), club)
)(window)
