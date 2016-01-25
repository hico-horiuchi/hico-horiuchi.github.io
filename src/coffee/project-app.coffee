((window) ->
  project = {}
  project.list = m.prop([])

  project.controller = ->
    m.request({
      method: 'GET'
      url: './assets/datas/projects.json'
      initialValue: []
    }).then((value) ->
      project.list(value);
      m.redraw()
    )

  project.view = () ->
    m('ul.fa-ul.m-b-0', [
      project.list().map((item) ->
        m('li', [
          m('i.fa.fa-li', {
            class: if item.organization then 'fa-users' else 'fa-user'
          }),
          m('a.link-white.m-r-05[target=_blank]', {
            href: 'https://github.com/' + item.repository
          }, item.repository),
          m('small', "(#{item.description})")
        ])
      )
    ])

  m.mount(document.getElementById('project-app'), project)
)(window)
