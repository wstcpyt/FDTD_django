polymer = {
  is: 'fdtd-new',
  getnumberoflayer: ->
    titlevalidateresult = this.$$("#id_title").validate()
    numbervalidateresult = this.$$("#id_numberoflayer").validate()
    if titlevalidateresult && numbervalidateresult
      console.log($.cookie('csrftoken'))
      this.numberoflayer = this.$$("#id_numberoflayer").value
      this.$$("#id_pages").selectNext()
      this.$$("#id_iron_ajax").headers = {"X-CSRFToken":$.cookie('csrftoken'), "Content-Type":"application/json"}
      object = {"title":"test1"}
      jsonstringfy = JSON.stringify(object)
      this.$$("#id_iron_ajax").body = jsonstringfy
      this.$$("#id_iron_ajax").generateRequest()
}

Polymer(polymer)