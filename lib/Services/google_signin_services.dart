import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInServices {
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  static Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googleKey = await account!.authentication;

      print(account);
      print('======== ID TOKEN ========');
      print(googleKey.idToken);
      
      // TODO: llamar un servicio Rest a nuestro backend con el ID token
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
