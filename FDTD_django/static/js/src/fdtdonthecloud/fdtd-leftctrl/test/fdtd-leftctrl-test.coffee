suite('leftctrl tests',->
  setup(->
    this.pytmenu = fixture('leftctrl')
  )
  test('menuItems', ->
    assert.equal(this.pytmenu.menuItems[0].menu, 'New')
  )
  test('selectedindex_properties', ->
    assert.equal(this.pytmenu.selectedindex, '1')
  )
  test('paper-menu selected changed', ->
    self = this
    self.pytmenu.$.leftmenu.addEventListener('selected-changed', ->
      assert.equal(self.pytmenu.menuselected.menu, 'Drafts')
    )
    self.pytmenu.$.leftmenu.selected = 1
  )
)