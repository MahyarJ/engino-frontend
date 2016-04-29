# Engino Client

A simple LiveScript - React boiler plate.

----------
### Features added by default
1- material-ui
2- Auth by token
3- socket-io


----------
## Usage
### Request
	engino.request("spaceName/funcName", {foo: "bar"}).then (data) ->
		console.log data

### Login
	engino.auth.login("email@gmail.com", "myPassword").then (data) ->
		console.log data

### Register
	engino.auth.register(name, email, pass, confirm).then (data) ->
		console.log data

### getUser
It will log user if token is valid

    engino.auth.getUser().then (data) ->
    		console.log data

