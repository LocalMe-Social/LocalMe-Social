import 'dart:convert';
import 'package:localme_mobile/globals.dart' as globals;
import 'package:localme_mobile/serviceRequest.dart' as serviceRequest;

get(String userID) {
	return serviceRequest.get('/users/$userID', globals.token, null);
}

login(String email, String password) async {
	var body = {
		"strategy": "local",
		"email": email,
		"password": password
	};
	var response = await serviceRequest.post('/authentication', body, null);
	var responseBody = jsonDecode(response.body);
	globals.token = responseBody['accessToken'];
	return response.statusCode;
}

signup(String email, String username, String fullname, String password) async {
	var body = {
		"email": email,
		"password": password,
		"username": username,
		"fullname": fullname
	};
	var response = await serviceRequest.post('/users', body, null);
	var responseCode = await login(email, password);
	globals.token = response.body['accessToken'];
	return responseCode;
}