polymer = {
  is: 'fdtd-app',
  properties: {
    userAvatar: {
      type: String
    }
    menuselected: {
      type: Object,
      notify: true,
      value:{menu: 'Drafts', icon:'drafts'}
    }
  }
}
Polymer(polymer)