describe('Unit Test indexapp.bottomsheetexport', ->
  beforeEach(module('indexapp.bottomsheetexport'))
  beforeEach(module('indexdata.service'))
  beforeEach(inject((generateCSVfileService, generateTXTfileService)->
    this.generateCSVfileService = generateCSVfileService
    this.generateTXTfileService = generateTXTfileService
  ))
  it('generateCSVfileService', ->
    dataarray_nk =[[1, 2, 3], [2, 3, 4]]
    this.generateCSVfileService.generateCSV(dataarray_nk)
    csvarray_nk = this.generateCSVfileService.csvContent.split(",")
    assert.equal(csvarray_nk.length, 8)
    dataarray_n = [[1, 2], [2, 3]]
    this.generateCSVfileService.generateCSV(dataarray_n)
    csvarray_n = this.generateCSVfileService.csvContent.split(",")
    assert.equal(csvarray_n.length, 5)
  )
  it('generateCSVfileService', ->
    dataarray_nk =[[1, 2, 3], [2, 3, 4]]
    this.generateTXTfileService.generateTXT(dataarray_nk)
    txtarray_nk = this.generateTXTfileService.txtContent.split("\t")
    assert.equal(txtarray_nk.length, 5)
    dataarray_n = [[1, 2], [2, 3]]
    this.generateTXTfileService.generateTXT(dataarray_n)
    txtarray_n = this.generateTXTfileService.txtContent.split(",")
    assert.equal(txtarray_n.length, 2)
  )
)