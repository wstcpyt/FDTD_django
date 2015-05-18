describe('Unit Test indexdata.service', ->
  beforeEach(module('indexdata.service'))
  beforeEach(inject((indexdataService, _$httpBackend_)->
    this.$httpBackend = _$httpBackend_
    this.indexdataService = indexdataService
    this.data_nk ={
      "DATA": [{
        "data":"0.2 0.5 0.8\n0.2 0.5 0.9\n"
      }]
    }
    this.data_n ={
      "DATA": [{
        "data":"0.3 0.5\n0.3 0.5\n"
      }]
    }
    this.$httpBackend.when('GET', '/elementlistitemsdetail/1/').respond(this.data_n)
  )
  )
  afterEach(->
    this.$httpBackend.verifyNoOutstandingExpectation()
    this.$httpBackend.verifyNoOutstandingRequest()
  )
  it('seturl', ->
    this.indexdataService.seturl('TESTURL')
    assert.equal(this.indexdataService.url, 'TESTURL')
  )
  it('gendataArrayfromRawData', ->
    dataArray_n = this.indexdataService.gendataArrayfromRawData(this.data_n)
    assert.equal(dataArray_n[1][0], 0.3)
    dataArray_nk = this.indexdataService.gendataArrayfromRawData(this.data_nk)
    assert.equal(dataArray_nk[1][0], 0.2)
  )
  it('getdata', ->
    this.indexdataService.seturl('/elementlistitemsdetail/1/')
    this.$httpBackend.expectGET('/elementlistitemsdetail/1/')
    this.indexdataService.getdata()
    this.$httpBackend.flush()
    assert.equal(this.indexdataService.indexdata['dataArray'][0][0], 0.3)
  )
)
