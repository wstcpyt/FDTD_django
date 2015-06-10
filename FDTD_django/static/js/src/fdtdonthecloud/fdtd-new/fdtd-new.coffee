polymer = {
  is: 'fdtd-new'
  properties: {
    numberoflayer: {
      type: Number
      notify: true
    }
    newprojectresponse: {
      type: Object
      notify: true
      observer: 'projectresponsechanged'
    }
  }
  createnewproject: ->
    inputvalidate = this.checkinputvalidate()
    if inputvalidate
      this.assignnumberoflayer()
      this.$$("#id_pages").selectNext()
      this.$$("#id_iron_ajax").headers = {"X-CSRFToken":$.cookie('csrftoken'), "Content-Type":"application/json"}
      jsonstring = this.generatejsonstring()
      this.$$("#id_iron_ajax").body = jsonstring
      this.$$("#id_iron_ajax").generateRequest()

  assignnumberoflayer: ->
    this.numberoflayer = this.$$("#id_numberoflayer").value

  generatejsonstring: ->
    object = {"title":this.$$("#id_title").value}
    return JSON.stringify(object)

  checkinputvalidate: ->
    titlevalidateresult = this.$$("#id_title").validate()
    numbervalidateresult = this.$$("#id_numberoflayer").validate()
    return titlevalidateresult && numbervalidateresult

  projectresponsechanged: ->
    this.projectid =  this.newprojectresponse.id
    console.log(this.projectid)
}

Polymer(polymer)