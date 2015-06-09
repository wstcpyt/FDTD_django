suite('fdtdnew tests',->
  setup(->
    this.fdtdapp = fixture('fdtd-new')
  )
  test('checkinputvalidate-false', ->
    result = this.fdtdapp.checkinputvalidate()
    assert.equal(result,false)
  )
  test('checkinputvalidate-true', ->
    this.fdtdapp.$$("#id_title").value = 'title'
    this.fdtdapp.$$("#id_numberoflayer").value = 12
    result = this.fdtdapp.checkinputvalidate()
    assert.equal(result,true)
  )
  test("generatejsonstring", ->
    this.fdtdapp.$$("#id_title").value = 'testtitle'
    result = this.fdtdapp.generatejsonstring()
    assert.equal(result, '{"title":"testtitle"}')
  )
  test("setnumberoflayer", ->
    this.fdtdapp.$$("#id_numberoflayer").value = 12
    this.fdtdapp.assignnumberoflayer()
  )
)