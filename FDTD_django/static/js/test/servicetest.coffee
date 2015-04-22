describe('Person', ->
  root = exports ? this
  beforeEach(module('myApp'))
  beforeEach(inject((_Person_)->
    this.Person = _Person_
  ))
  describe('Constructor', ->
    it('assigns a name', ->
      person = new this.Person('Ben')
      assert(person.name == 'Ben')
      ))

)