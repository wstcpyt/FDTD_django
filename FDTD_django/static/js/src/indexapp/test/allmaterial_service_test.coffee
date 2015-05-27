define(['angular', 'angularMocks', 'allmaterial/index'], ->
  describe('allmaterial_service', ->
    beforeEach(module('app.allmaterial'))
    beforeEach(inject((allmaterialService, _$httpBackend_)->
      this.allmaterialService = allmaterialService
      this.$httpBackend = _$httpBackend_
      this.$httpBackend.when('GET', '/allmaterial/0/10/').respond('test')
    ))
    it('init value', ->
      assert.equal(this.allmaterialService.busy, false)
      assert.equal(this.allmaterialService.after, 0)
    )
    it('nextPage', ->
      this.allmaterialService.nextPage()
    )
  )
)