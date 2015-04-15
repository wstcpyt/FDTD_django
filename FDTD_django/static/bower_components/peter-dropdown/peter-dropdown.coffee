polymer = {
  is: 'peter-dropdown'
  properties: {
    buttontext: {
      type: String
      notify: true
    }
    attrForSelected: {
      type: String
      value: "name"
    }
    selected: {
      type: String
      observer: 'handleselectedchange'
    }
  }
  listeners: {
    'click': 'handleClick'
  }
  handleClick: ->
    if this.$.peterselector.style.display=='none'
      this.$.peterselector.style.display='block'
    else
      this.$.peterselector.style.display='none'
  handleselectedchange: ->
    this.buttontext = this.$.peterselector.$.coreselector.items[this.selected].getAttribute(this.attrForSelected)
}
Polymer(polymer)