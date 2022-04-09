import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
	double logoWidth, logoHeight;

	LogoWidget({required this.logoWidth, required this.logoHeight});

	Widget build(BuildContext context) {
		var assetImage = const AssetImage('assets/logoblue.png');
		var image = Image(
			image: assetImage,
			width: logoWidth,
			height: logoHeight,
		);
		return Container(child: image);
	}
}
