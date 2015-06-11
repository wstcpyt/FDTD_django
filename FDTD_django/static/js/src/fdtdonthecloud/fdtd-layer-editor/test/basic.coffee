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
  test('generatelLayerinfoJsonstring', ->
    this.fdtdlayereditor.$$("#id_title").value = 'title'
    this.fdtdlayereditor.$$("#id_thickness").value = 12.2
    this.fdtdlayereditor.$$("#id_rf").value = 12.2
    result = this.fdtdlayereditor.generatelLayerinfoJsonstring()
    assert.equal(result, '{"layerdetail":{"title":"title","thickness":12.2,"rf":12.2}}')
  )
  test("changelayernumber_layernumber_less_than_total_number", ->
    this.fdtdlayereditor.layernumber = 0
    this.fdtdlayereditor.totallayernumber =2
    this.fdtdlayereditor.changelayernumber()
    assert.equal(this.fdtdlayereditor.layernumber, 1)
  )
  test("changelayernumber_layernumber_equal_total_number", ->
    this.fdtdlayereditor.layernumber = 1
    this.fdtdlayereditor.totallayernumber =2
    this.fdtdlayereditor.changelayernumber()
    assert.equal(this.fdtdlayereditor.layernumber, 0)
  )
  test("ajaxGetdatalayerinfoResponseChanged", ->
    this.fdtdlayereditor.ajaxGetdatalayerinfoResponse = {"title": "testtitle", "thickness": 1, "rf":1}
    assert.equal(this.fdtdlayereditor.$$("#id_title").$$("paper-input-container").querySelector('#input').value, 'testtitle')
    assert.equal(this.fdtdlayereditor.$$("#id_thickness").$$("paper-input-container").querySelector('#input').value, 1)
    assert.equal(this.fdtdlayereditor.$$("#id_rf").$$("paper-input-container").querySelector('#input').value, 1)
  )
)