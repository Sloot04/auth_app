import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInServices {
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  static Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      print(account);
      // TODO: idToken
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
