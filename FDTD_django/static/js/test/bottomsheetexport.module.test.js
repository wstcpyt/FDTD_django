// Generated by CoffeeScript 1.9.1
(function() {
  describe('Unit Test indexapp.bottomsheetexport', function() {
    beforeEach(module('indexapp.bottomsheetexport'));
    beforeEach(module('indexdata.service'));
    beforeEach(inject(function(generateCSVfileService, generateTXTfileService, generateJSONfileService) {
      this.generateCSVfileService = generateCSVfileService;
      this.generateTXTfileService = generateTXTfileService;
      return this.generateJSONfileService = generateJSONfileService;
    }));
    it('generateCSVfileService', function() {
      var csvarray_n, csvarray_nk, dataarray_n, dataarray_nk;
      dataarray_nk = [[1, 2, 3], [2, 3, 4]];
      this.generateCSVfileService.generateCSV(dataarray_nk);
      csvarray_nk = this.generateCSVfileService.csvContent.split(",");
      assert.equal(csvarray_nk.length, 8);
      dataarray_n = [[1, 2], [2, 3]];
      this.generateCSVfileService.generateCSV(dataarray_n);
      csvarray_n = this.generateCSVfileService.csvContent.split(",");
      return assert.equal(csvarray_n.length, 5);
    });
    it('generateCSVfileService', function() {
      var dataarray_n, dataarray_nk, txtarray_n, txtarray_nk;
      dataarray_nk = [[1, 2, 3], [2, 3, 4]];
      this.generateTXTfileService.generateTXT(dataarray_nk);
      txtarray_nk = this.generateTXTfileService.txtContent.split("\t");
      assert.equal(txtarray_nk.length, 5);
      dataarray_n = [[1, 2], [2, 3]];
      this.generateTXTfileService.generateTXT(dataarray_n);
      txtarray_n = this.generateTXTfileService.txtContent.split(",");
      return assert.equal(txtarray_n.length, 2);
    });
    return it('generateJSONfileService', function() {
      var jsonobject, jsonstring;
      jsonobject = {
        "Ref": 'test'
      };
      this.generateJSONfileService.generateJSON(jsonobject);
      jsonstring = this.generateJSONfileService.JSONContent;
      return assert.equal(jsonstring, 'data:text;charset=utf-8,{"Ref":"test"}');
    });
  });

}).call(this);

//# sourceMappingURL=bottomsheetexport.module.test.js.map
