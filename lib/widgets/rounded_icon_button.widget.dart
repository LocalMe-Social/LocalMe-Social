import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
	void Function()? onPressed;
	double width, height;
	IconData icon;

	RoundedIconButton({
		super.key, 
    	required this.icon,
		this.width = 70,
		this.height = 50,
		required this.onPressed
  	});


	Widget build(BuildContext context) {
		return Container(
			width: width,
			height: height,
			child: TextButton(
				onPressed: onPressed,
				style: ButtonStyle(
					shape: MaterialStateProperty.all<RoundedRectangleBorder>(
						RoundedRectangleBorder(
							borderRadius: BorderRadius.circular(30.0),
							side: const BorderSide(color: Colors.white)
            )
          )
        ),
				child: Icon(icon, color: Colors.white)
      )
    );
	}
}
