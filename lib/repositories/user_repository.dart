import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

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
        idToken: googleSignInAuthentication.accessToken,
        accessToken: googleSignInAuthentication.idToken
    );
    await _firebaseAuth.signInWithCredential(authCredential);
  }
  Future<FirebaseUser> loginWithFacebook() async {
    final FacebookLoginResult facebookLoginResult = await _facebookLogin.logIn(['email']);
    if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
      final AuthCredential authCredential = FacebookAuthProvider.getCredential(
        accessToken: facebookLoginResult.accessToken.token,
      );
      await _firebaseAuth.signInWithCredential(authCredential);
    }
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
