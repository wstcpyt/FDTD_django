define(['angular', 'angularMocks', 'allmaterial/index'], ->
  describe('allmaterial', ->
    beforeEach(module('app.allmaterial'))
    beforeEach(inject((Allmaterial, _$httpBackend_)->
      this.allmaterial = new Allmaterial()
      this.$httpBackend = _$httpBackend_
      this.$httpBackend.when('GET', '/allmaterial/0/10/').respond('test')
    ))
    it('init value', ->
      assert.equal(this.allmaterial.busy, false)
      assert.equal(this.allmaterial.after, 0)
    )
    it('nextPage', ->
      this.allmaterial.nextPage()
    )
  )
)