import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
	String text;
	void Function()? onPressed;
	double width, height;

	RoundedButton({
    required this.text,
		this.width = 100,
		this.height = 50,
		required this.onPressed
  });

	Widget build(BuildContext context) {
		return Container(
			width: width,
			height: height,
			child: TextButton(
				child: Text(text),
				onPressed: onPressed,
				style: ButtonStyle(
					shape: MaterialStateProperty.all<RoundedRectangleBorder>(
						RoundedRectangleBorder(
							borderRadius: BorderRadius.circular(5.0),
							side: const BorderSide(color: Colors.white)
            )
          )
        )
      )
    );
	}
}
