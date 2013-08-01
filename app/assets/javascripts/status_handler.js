var StatusHandler = {
  errorMessage: function(event, xhr){
    if (xhr.status == 401) alertify.error("You need to be signed in!")
    if (xhr.status == 422) alertify.error("You've already added this one!")
  },

  successMessage: function(event, data){
    alertify.error("Saved Successfully!")
  }
}
