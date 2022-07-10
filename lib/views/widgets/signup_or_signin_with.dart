import 'package:eatbay_admin/controllers/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';

class AuthWithButton extends StatelessWidget {
  const AuthWithButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () async{
        

            await AuthController.instance.signinWithGoogle();
          },
          child: _signupWithIcon(
            url:
                'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-google-icon-logo-png-transparent-svg-vector-bie-supply-14.png',
          ),
        ),
        GestureDetector(
          onTap: ()async {
            await AuthController.instance.signInWithTwitter();
          },
          child: _signupWithIcon(
            url:
                'https://www.kindpng.com/picc/m/225-2252495_logo-twitter-bulat-clipart-png-download-square-twitter.png',
          ),
        ),
        GestureDetector(
          onTap: () async{
            await AuthController.instance.signInWithFacebook();
          },
          child: _signupWithIcon(
            url:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3zM12PHwwSmEbr9VQGaWngPxLt5bb1G5NWQ&usqp=CAU',
          ),
        ),
      ],
    );
  }

  ClipRRect _signupWithIcon({required url}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Image.network(
        url,
        height: 60.0,
        width: 60.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
