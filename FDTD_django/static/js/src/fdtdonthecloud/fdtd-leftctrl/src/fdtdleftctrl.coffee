polymer = {
  is: 'fdtd-leftctrl'
  properties: {
    menuselected: {
      type: Object
      notify: true
    }
    selectedindex: {
      type: String
      notify: true
    }
  }
  ready: ->
    self = this
    self.menuItems = [
      {menu: 'New', icon: 'create'}
      {menu: 'Drafts', icon:'drafts'},
      {menu: 'Done', icon: 'done'}
    ]
  attached: ->
    self = this
    self.$.leftmenu.addEventListener('selected-changed', ->
      self.menuselected = self.menuItems[self.$.leftmenu.selected]
      window.location = '#/' + self.menuItems[self.$.leftmenu.selected].menu + '/' + self.$.leftmenu.selected
    )
}

Polymer(polymer)