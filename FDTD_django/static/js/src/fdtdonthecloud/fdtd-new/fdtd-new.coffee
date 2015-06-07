polymer = {
  is: 'fdtd-new',
  getnumberoflayer: ->
    titlevalidateresult = this.$$("#id_title").validate()
    numbervalidateresult = this.$$("#id_numberoflayer").validate()
    if titlevalidateresult && numbervalidateresult
      this.numberoflayer = this.$$("#id_numberoflayer").value
      this.$$("#id_pages").selectNext()
}

Polymer(polymer)