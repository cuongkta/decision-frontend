// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
//import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import Elm from "./elm.js"

let counterDiv = document.getElementById("decision-main")
if (counterDiv !== undefined) {
		//Elm.Main.embed(counterDiv);
        var app;
        var currentToken = localStorage.getItem("token");
        var currentLanguage = localStorage.getItem("language");
        var default_lang = 'en';
		var userLang = navigator.language || navigator.userLanguage || navigator.browserLanguage || navigator.systemLanguage || default_lang;

		if (currentLanguage) {
			userLang = currentLanguage;
		}
        if(currentToken){
		  app = Elm.Main.fullscreen({token: currentToken, language: userLang});
		} else {
		  app = Elm.Main.fullscreen({token: null, language: userLang});
		}


		app.ports.setStorage.subscribe(function(token){
		    localStorage.setItem("token", token);
		});

		app.ports.removeStorage.subscribe(function() {
        	localStorage.removeItem('token');
    	});


    	app.ports.setLanguage.subscribe(function(language){
		    localStorage.setItem("language", language);
		});

		app.ports.removeLanguage.subscribe(function() {
        	localStorage.removeItem('language');
    	});

		/*window.setTimeout(function(){
			app.ports.storageInput.send(currentToken);
		}, 0);*/


		app.ports.fileSelected.subscribe(function (id) {
			
			var node = document.getElementById(id);
			if (node === null) {
				return;
			}


			// If your file upload field allows multiple files, you might
			// want to consider turning this into a `for` loop.
			var file = node.files[0];
			var reader = new FileReader();

			// FileReader API is event based. Once a file is selected
			// it fires events. We hook into the `onload` event for our reader.
			reader.onload = (function(event) {
				// The event carries the `target`. The `target` is the file
				// that was selected. The result is base64 encoded contents of the file.
				var base64encoded = event.target.result;
				//var base64encoded = event.target.result.substr(event.target.result.indexOf(',') + 1);
				// We build up the `ImagePortData` object here that will be passed to our Elm
				// runtime through the `fileContentRead` subscription.
				var portData = {
				  contents: base64encoded,
				  filename: file.name
				};

				// We call the `fileContentRead` port with the file data
				// which will be sent to our Elm runtime via Subscriptions.
				app.ports.fileContentRead.send(portData);

			});
			// Connect our FileReader with the file that was selected in our `input` node.
  			reader.readAsDataURL(file);
		});

}

