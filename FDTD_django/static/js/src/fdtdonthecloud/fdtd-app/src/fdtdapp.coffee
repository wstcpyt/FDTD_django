polymer = {
  is: 'fdtd-app',
  properties: {
    userAvatar: {
      type: String
    }
    selectedindex:{
      type: String
      notify:true
    }
    menuselected: {
      type: Object,
      notify: true,
      value:{menu: 'Drafts', icon:'drafts'}
    }
  }
}
Polymer(polymer)