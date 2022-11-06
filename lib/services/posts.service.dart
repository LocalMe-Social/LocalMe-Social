import 'dart:convert';
import 'package:localme_mobile/globals.dart' as globals;
import 'package:localme_mobile/serviceRequest.dart' as serviceRequest;

get() {
	print("refresh");
	return serviceRequest.get('/posts', null, {'\$sort[createdAt]': '-1'});
}
