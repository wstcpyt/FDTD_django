// Generated by CoffeeScript 1.9.2
(function() {
  var polymer;

  polymer = {
    is: 'fdtd-new',
    getnumberoflayer: function() {
      var jsonstringfy, numbervalidateresult, object, titlevalidateresult;
      titlevalidateresult = this.$$("#id_title").validate();
      numbervalidateresult = this.$$("#id_numberoflayer").validate();
      if (titlevalidateresult && numbervalidateresult) {
        console.log($.cookie('csrftoken'));
        this.numberoflayer = this.$$("#id_numberoflayer").value;
        this.$$("#id_pages").selectNext();
        this.$$("#id_iron_ajax").headers = {
          "X-CSRFToken": $.cookie('csrftoken'),
          "Content-Type": "application/json"
        };
        object = {
          "title": "test1"
        };
        jsonstringfy = JSON.stringify(object);
        this.$$("#id_iron_ajax").body = jsonstringfy;
        return this.$$("#id_iron_ajax").generateRequest();
      }
    }
  };

  Polymer(polymer);

}).call(this);

//# sourceMappingURL=fdtd-new.js.map
