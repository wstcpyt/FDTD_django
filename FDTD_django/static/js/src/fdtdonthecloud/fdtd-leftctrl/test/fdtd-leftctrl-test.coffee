suite('leftctrl tests',->
  setup(->
    this.pytmenu = fixture('leftctrl')
  )
  test('menuItems', ->
    assert.equal(this.pytmenu.menuItems[0].menu, 'Drafts')
  )
  test('paper-menu selected changed', ->
    self = this
    self.pytmenu.$.leftmenu.addEventListener('selected-changed', ->
      assert.equal(self.pytmenu.menuselected.menu, 'Done')
    )
    self.pytmenu.$.leftmenu.selected = 1
  )
)