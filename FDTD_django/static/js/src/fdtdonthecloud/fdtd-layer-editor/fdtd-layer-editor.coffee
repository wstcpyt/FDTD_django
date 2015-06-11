polymer = {
  is: 'fdtd-layer-editor'
  properties: {
    totallayernumber: {
      type: Number
      notify: true
    }
    layernumber: {
      type: Number
      notify: true
      observer: "layernumberChanged"
    }
    projectid:{
      type: Number
      notify: true
    }
    ajaxGetdatalayerinfoResponse:{
      type: Object
      notify:true
      observer: "ajaxGetdatalayerinfoResponseChanged"
    }
  }
  attached: ->
    #this.$$("#id_title").label = ''
    #this.$$("#id_title").$$("paper-input-container").querySelector('#input').value = 'TESTVALUE'
  ajaxGetdatalayerinfoResponseChanged: ->
    if this.ajaxGetdatalayerinfoResponse.hasOwnProperty("title")
      this.$$("#id_title").$$("paper-input-container").querySelector('#input').value = this.ajaxGetdatalayerinfoResponse['title']
    else
      this.$$("#id_title").$$("paper-input-container").querySelector('#input').value = ""
    if this.ajaxGetdatalayerinfoResponse.hasOwnProperty("thickness")
      this.$$("#id_thickness").$$("paper-input-container").querySelector('#input').value = this.ajaxGetdatalayerinfoResponse['thickness']
    else
      this.$$("#id_thickness").$$("paper-input-container").querySelector('#input').value = ""
    if this.ajaxGetdatalayerinfoResponse.hasOwnProperty("rf")
      this.$$("#id_rf").$$("paper-input-container").querySelector('#input').value = this.ajaxGetdatalayerinfoResponse['rf']
    else
      this.$$("#id_rf").$$("paper-input-container").querySelector('#input').value = ""

  layernumberChanged: ->
    this.$$("#id_ajax_getdatalayerinfo").params = {"projectid":this.projectid, "layerid": this.layernumber}
    this.$$("#id_ajax_getdatalayerinfo").generateRequest()
  savelayerinfo: ->
    inputvalidate = this.checkinputvalidate()
    if inputvalidate
      this.$$("#id_ajax_updatelayerinfo").headers = {"X-CSRFToken":$.cookie('csrftoken'), "Content-Type":"application/json"}
      jsonstring = this.generatelLayerinfoJsonstring()
      this.$$("#id_ajax_updatelayerinfo").body = jsonstring
      this.$$("#id_ajax_updatelayerinfo").generateRequest()
      this.changelayernumber()

  changelayernumber: ->
      if this.layernumber < this.totallayernumber-1
        this.layernumber = this.layernumber + 1
      else
        this.layernumber = 0

  checkinputvalidate: ->
    titlevalidateresult = this.$$("#id_title").validate()
    thicknessvalidateresult = this.$$("#id_thickness").validate()
    rfvalidateresult = this.$$("#id_rf").validate()
    return titlevalidateresult && thicknessvalidateresult && rfvalidateresult

  generatelLayerinfoJsonstring: ->
    layerobject = {"title": this.$$("#id_title").value, "thickness": this.$$("#id_thickness").value, "rf": this.$$("#id_rf").value}
    object = {}
    object["layerdetail"] = layerobject
    object["id"] = this.projectid
    object['layernumber'] = this.layernumber
    return JSON.stringify(object)
}
Polymer(polymer)