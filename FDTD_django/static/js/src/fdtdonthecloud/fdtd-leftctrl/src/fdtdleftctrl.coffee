polymer = {
  is: 'fdtd-leftctrl'
  properties: {
    menuselected: {
      type: Object
      notify: true
    }
  }
  ready: ->
    this.menuItems = [
      {menu: 'Drafts', icon:'drafts'},
      {menu: 'Done', icon: 'done'}
    ]
  toggleSelection: (e)->
    item = this.$.menulist.itemForElement(e.target)
    this.menuselected = item
}

Polymer(polymer)