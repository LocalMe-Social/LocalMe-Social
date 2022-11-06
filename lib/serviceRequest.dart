import 'package:http/http.dart' as http;

get(String endpoint, String? token, Map<String, dynamic>? queryParams) async {
	print("Hey");
	var url = Uri.http('localhost:3030', endpoint, queryParams);
	print('URL');
	http.Response response;
	if(queryParams == null) {
		url = Uri.http('localhost:3030', endpoint);
	}
	if(token == null) {
		response = await http.get(
			url,
		);
	} else {
		response = await http.get(
			url,
			headers: {
				'Authorization': 'Bearer $token'
			}
		);
	}
	return response;
}

post(String endpoint, body, String? token) async {
	var url = Uri.http('localhost:3030', endpoint);
	http.Response response;
	if(token == null) {
		response = await http.post(
			url,
			body: body
		);
	} else {
		response = await http.post(
			url,
			body: body,
			headers: {
				'Authorization': 'Bearer $token'
			}
		);
	}
	return response;
}

delete(String endpoint, String params, String? token) async {
	var url = Uri.http('localhost:3030', '$endpoint/$params');
	http.Response response;
	if(token == null) {
		response = await http.delete(
			url,
		);
	} else {
		response = await http.delete(
			url,
			headers: {
				'Authorization': 'Bearer $token'
			}
		);
	}
	return response;
}