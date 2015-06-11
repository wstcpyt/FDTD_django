suite('fdtd-layer-editor tests',->
  setup(->
    this.fdtdlayereditor = fixture('fdtdlayereditor')
  )
  test('checkinputvalidate-false', ->
    result = this.fdtdlayereditor.checkinputvalidate()
    assert.equal(result,false)
  )
  test('checkinputvalidate-true_integer', ->
    this.fdtdlayereditor.$$("#id_title").value = 'title'
    this.fdtdlayereditor.$$("#id_thickness").value = 12
    this.fdtdlayereditor.$$("#id_rf").value = 12
    result = this.fdtdlayereditor.checkinputvalidate()
    assert.equal(result,true)
  )
  test('checkinputvalidate-true_float', ->
    this.fdtdlayereditor.$$("#id_title").value = 'title'
    this.fdtdlayereditor.$$("#id_thickness").value = 12.2
    this.fdtdlayereditor.$$("#id_rf").value = 12.2
    result = this.fdtdlayereditor.checkinputvalidate()
    assert.equal(result,true)
  )
)