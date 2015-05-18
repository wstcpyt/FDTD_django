// Generated by CoffeeScript 1.9.1
(function() {
  describe('Unit Test indexdata.service', function() {
    beforeEach(module('indexdata.service'));
    beforeEach(inject(function(indexdataService, _$httpBackend_) {
      this.$httpBackend = _$httpBackend_;
      this.indexdataService = indexdataService;
      this.data_nk = {
        "DATA": [
          {
            "data": "0.2 0.5 0.8\n0.2 0.5 0.9\n"
          }
        ]
      };
      this.data_n = {
        "DATA": [
          {
            "data": "0.3 0.5\n0.3 0.5\n"
          }
        ]
      };
      return this.$httpBackend.when('GET', '/elementlistitemsdetail/1/').respond(this.data_n);
    }));
    afterEach(function() {
      this.$httpBackend.verifyNoOutstandingExpectation();
      return this.$httpBackend.verifyNoOutstandingRequest();
    });
    it('seturl', function() {
      this.indexdataService.seturl('TESTURL');
      return assert.equal(this.indexdataService.url, 'TESTURL');
    });
    it('gendataArrayfromRawData', function() {
      var dataArray_n, dataArray_nk;
      dataArray_n = this.indexdataService.gendataArrayfromRawData(this.data_n);
      assert.equal(dataArray_n[1][0], 0.3);
      dataArray_nk = this.indexdataService.gendataArrayfromRawData(this.data_nk);
      return assert.equal(dataArray_nk[1][0], 0.2);
    });
    return it('getdata', function() {
      this.indexdataService.seturl('/elementlistitemsdetail/1/');
      this.$httpBackend.expectGET('/elementlistitemsdetail/1/');
      this.indexdataService.getdata();
      this.$httpBackend.flush();
      return assert.equal(this.indexdataService.indexdata['dataArray'][0][0], 0.3);
    });
  });

}).call(this);

//# sourceMappingURL=indexdata.service.test.js.map
