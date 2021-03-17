import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookLogin _facebookLogin;
  //constructor
  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn, FacebookLogin facebookLogin}):
      _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      _googleSignIn = googleSignIn ?? GoogleSignIn(),
      _facebookLogin = facebookLogin ?? FacebookLogin();

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim()
    );
  }
  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
    );
    await _firebaseAuth.signInWithCredential(authCredential);
  }
  Future<FirebaseUser> loginWithFacebook() async {
      final FacebookLoginResult facebookLoginResult = await _facebookLogin.logIn(['email']);
      final FacebookAccessToken accessToken = facebookLoginResult.accessToken;

      // Create a credential from the access token
      final AuthCredential credential = FacebookAuthProvider.getCredential(
        accessToken: accessToken.token,
      );
      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
  }
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password);
  }
  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
      _facebookLogin.logOut(),
    ]);
  }
  Future<bool> isSignedIn() async {
    return await _firebaseAuth.currentUser() != null;
  }
  Future<FirebaseUser> getUser() async {
    return await _firebaseAuth.currentUser();
  }
}
