import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleSignInServices {
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  static Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googleKey = await account!.authentication;

      final signInWithGoogleEndpoint = Uri(
          scheme: 'https',
          host: 'apple-google--signin.herokuapp.com',
          path: '/google');

      final session = await http
          .post(signInWithGoogleEndpoint, body: {'token': googleKey.idToken});

      return account;
    } catch (error) {
      print('error en google SignIn');
      print(error);
      return null;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
}
