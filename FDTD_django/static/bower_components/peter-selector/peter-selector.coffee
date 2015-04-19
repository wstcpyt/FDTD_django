polymer = {
  is: 'peter-selector'
  properties: {
    selectedtext: {
      type: String
      notify: true
    }
    selected: {
      type: String
      observer: 'handleselectedchange'
    }
    attrForSelected: {
      type: String
      value: "name"
    }
  }
  handleselectedchange: ->
    this.selectedtext = this.$.coreselector.items[this.selected].getAttribute(this.attrForSelected)
}

Polymer(polymer)