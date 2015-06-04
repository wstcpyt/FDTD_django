suite('fdtdapp tests',->
  setup(->
    this.fdtdapp = fixture('fdtdapp')
  )
  test('selectedindex', ->
    assert.equal(this.fdtdapp.selectedindex, '0')
  )
  test('useravatar', ->
    assert.equal(this.fdtdapp.userAvatar, 'testavatar')
  )
)