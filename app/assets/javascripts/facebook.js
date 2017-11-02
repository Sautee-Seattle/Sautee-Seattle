window.fbAsyncInit = function() {
  FB.init({
    appId      : '113466266090218',
    cookie     : true,
    xfbml      : true,
    version    : 'v2.10'
  });
  FB.AppEvents.logPageView();


  // statusChangeCallback(response);

};

function handlelogin() {
  FB.getLoginStatus(function(response){
    var userID = response.authResponse.userID;
    FB.api(
      `/${userID}?fields=id,name,email,about`,
      function (response) {
        var name = response.name;
        var email = response.email;
        var about = response.about;
        var data = {user: {username: name, email: email, bio: about, password: userID}}

        if (response && !response.error) {
          $.ajax({
            method: 'POST',
            data,
            url: '/users'
          }).done((response)=>{
            console.log(response);
            location.href = `/users/${response.id}`
          })
        }
      })
    }
  )
}

    // function checkLoginState() {
    //   FB.getLoginStatus(function(response) {
    //     // statusChangeCallback(response);
    //   });
    // }

    $(()=>{
      (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));

    })
