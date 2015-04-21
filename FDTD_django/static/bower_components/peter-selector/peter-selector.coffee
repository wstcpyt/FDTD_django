polymer = {
  is: 'peter-selector'
  properties: {
    selectedtext: {
      type: String
      notify: true
    }
    selectedattr: {
      type: String
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
    this.selectedattr = this.$.coreselector.items[this.selected].getAttribute('attr')
}

Polymer(polymer)