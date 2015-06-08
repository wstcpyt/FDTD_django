polymer = {
  is: 'fdtd-layer-editor'
  properties: {
    layernumber: {
      type: Number
      notify: true
    }
  }
  attached: ->
    #this.$$("#id_title").label = ''
    #this.$$("#id_title").$$("paper-input-container").querySelector('#input').value = 'TESTVALUE'
}
Polymer(polymer)