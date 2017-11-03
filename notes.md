##Facebook API Notes

What a wild ride...

The real meat and potatoes of the situation is in `facebook.js`. But here's the general progression as it is apparent to me.

1. `FB.init()` gets called when the window loads.
2. User clicks the "Login With Facebook" button,
  * this is located in the `_facebook.html` partial, in `users/new.html`.
3. `_facebook.html` partial has an `onLogin` callback
  * This calls `handleLogin()` from `facebook.js`.
4. `handleLogin()` FB.getLoginStatus gets the user information if logged in, then `FB.api` makes an api call to (facebook's graph api)[https://developers.facebook.com/docs/graph-api/reference/user/]
5. Our client receives the response from that api call, then makes an ajax call to users#create.
6. The users#create route returns the newly created user's information, which we use to redirect to that user's show page. (i.e. `location.href = ...`)


The link to the facebook graph api is enough to get a little bit dangerous, but I'm pretty sure we were missing some authentication information. There are a few fields that we couldn't access (i.e. profile picture) without some kind of token, however, it wasn't apparent how to pass that token in.

It should also be noted that this feature was bootstrapped in a fairly short amount of time, so if one were to attempt to expand upon this, I would recommend a larger application of Facebook's api. Perhaps, also researching a Ruby SDK rather than a JavaScript one.

But I digress. Ipso facto, construct calls using the syntax on line 19 of `facebook.js` using routes from (here)[https://developers.facebook.com/docs/graph-api/reference/user/] and you're golden.

Cheers,
John Simoni
