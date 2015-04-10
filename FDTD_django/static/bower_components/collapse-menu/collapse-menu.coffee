polymer = {
  is: 'collapse-menu'
  properties: {
    query: {
      type: String
      observer: 'queryChanged'
    }
    screenmatched: {
      type: Boolean
    }
  }
  queryChanged: ->
    this.screenmatched = this.$.coremediaid.queryMatches
  ready: ->
    setresponsivenav(this)
}

class Nav
  constructor: (@menunav, @smallscreennav) ->
  toggleNav: (queryMatches) ->
    if queryMatches
      this.menunav.style.display = 'none'
      this.smallscreennav.style.display = ''
    else
      this.menunav.style.display = ''
      this.smallscreennav.style.display = 'none'

setresponsivenav = (_this) ->
  _this.nav = new Nav(_this.$.menunavid, _this.$.smallscreennavid)
  _this.nav.toggleNav(_this.$.coremediaid.queryMatches)
  add_core_media_event_handler(_this)

add_core_media_event_handler = (_this) ->
  _this.$.coremediaid.addEventListener('query-matches-changed',
    ->
      _this.nav.toggleNav(_this.$.coremediaid.queryMatches)
  )
Polymer(polymer)
