polymer = {
  is: 'peter-dropdown'
  handleClick: ->
    this.$.peterselector.style.display='block'
  ready: ->
    _this = this
    this.$.peterselector.addEventListener('selected-changed',
      ->
        _this.$.peterselector.style.display='none'
        _this.$.peterselector.selected = 'none'
    )
}
Polymer(polymer)