polymer = {
  is: 'fdtd-leftctrl'
  properties: {
    menuselected: {
      type: Object
      notify: true
    }
  }
  ready: ->
    self = this
    self.menuItems = [
      {menu: 'Drafts', icon:'drafts'},
      {menu: 'Done', icon: 'done'}
    ]
    self.$.leftmenu.addEventListener('selected-changed', ->
      self.menuselected = self.menuItems[self.$.leftmenu.selected]
    )
}

Polymer(polymer)