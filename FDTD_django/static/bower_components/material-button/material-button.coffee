Polymerobject = {
  is: "material-button"
  properties: {
    link: {
      type: String
      value: '#'
    }
    raised: {
      type: Boolean
    }
  }
  listeners: {
    'click': 'handleClick'
  }
  handleClick: ->
    window.location.href = this.link
}

Polymer(Polymerobject)

