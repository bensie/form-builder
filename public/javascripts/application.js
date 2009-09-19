function insert_fields(link, method, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + method, "g")
  $(link).up().insert({
    before: content.replace(regexp, new_id)
  });
}
 
function remove_fields(link) {
  var hidden_field = $(link).previous("input[type=hidden]");
  if (hidden_field) {
    hidden_field.value = '1';
  }
  $(link).up(".fields").hide();
}