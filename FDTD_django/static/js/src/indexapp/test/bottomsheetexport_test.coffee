define(['angular', 'angularMocks', 'exportdata/index', 'common/index'],->
  describe('bottomsheetexport', ->
    beforeEach(module('app.exportdata'))
    beforeEach(module('app.common'))
    beforeEach(inject((generateCSVfileService, generateTXTfileService, generateJSONfileService)->
      this.generateCSVfileService = generateCSVfileService
      this.generateTXTfileService = generateTXTfileService
      this.generateJSONfileService = generateJSONfileService
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
    it('generateJSONfileService', ->
      jsonobject = {"Ref": 'test'}
      this.generateJSONfileService.generateJSON(jsonobject)
      jsonstring = this.generateJSONfileService.JSONContent
      assert.equal(jsonstring,'data:text;charset=utf-8,{"Ref":"test"}')
    )
  )
)