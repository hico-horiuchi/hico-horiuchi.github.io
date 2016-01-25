((window) ->
  design = {}
  design.list = m.prop([])

  design.controller = ->
    m.request({
      method: 'GET'
      url: './assets/datas/designs.json'
      initialValue: []
    }).then((value) ->
      design.list(value);
      m.redraw()
    )

  design.view = () ->
    m('ul.fa-ul.m-b-0', [
      design.list().map((item) ->
        m('li', [
          m('i.fa.fa-li', {
            class: 'fa-' + item.icon
          }),
          m('a.link-white[target=_blank]', {
            href: item.content
          }, [
            item.title,
            m('i.fa.fa-external-link.m-l-05')
          ])
        ])
      )
    ])

  m.mount(document.getElementById('design-app'), design)
)(window)
