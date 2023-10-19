import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../app/app.dart';
import '../../core/services/services.dart';
import '../../domain/models/models.dart';
import '../../presentation/presentation.dart';
import '../data.dart';

abstract class RemoteAuthDataSource {
  const RemoteAuthDataSource();

  Future<UserCredential> logIn({required SignInRequestDto request});

  Future<void> signUp({required SignUpRequestDto request});

  Future<void> logOut();

  Future<UserProfile?> logInWithGoogle();

  Future<void> reSubmitVerification({required UserCredential request});

  Future<UserProfile> getUserProfile({required UserCredential user});

  Future<void> deleteAccount({required String uid});
}

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  const RemoteAuthDataSourceImpl({
    required FirebaseAuth firebaseAuth,
    required LocaleCategoryDataSource localCategoryDataSource,
    required FirebaseFirestore firebaseFirestore,
    required FileManager fileManager,
  })  : _auth = firebaseAuth,
        _categoryDataSource = localCategoryDataSource,
        _fireStore = firebaseFirestore,
        _fileManager = fileManager;

  final FirebaseAuth _auth;
  final LocaleCategoryDataSource _categoryDataSource;
  final FirebaseFirestore _fireStore;
  final FileManager _fileManager;

  @override
  Future<UserCredential> logIn({required SignInRequestDto request}) async {
    final user = await _auth.signInWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );

    return user;
  }

  @override
  Future<void> signUp({required SignUpRequestDto request}) async {
    final user = await _auth.createUserWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );

    await user.user?.sendEmailVerification();

    await _fireStore.collection(FirebaseNames.users).doc(user.user!.uid).set(
          UserProfile(
            uid: user.user!.uid,
            username: request.username,
            email: request.email,
            avatarUri: '',
          ).toJson(),
        );

    await _categoryDataSource.addStartCategory();
  }

  @override
  Future<void> logOut() async {
    await _fileManager.deleteDirectory();
    await _auth.signOut();
  }

  @override
  Future<UserProfile?> logInWithGoogle() async {
    String? imagePath;

    final googleUser = await GoogleSignIn().signIn();

    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      try {
        await _auth.signInWithCredential(credential);
      } catch (e) {
        print(e);
      }


      //print(userCredential);
    }
    //   print('4');
    //
    //   final additionalUserInfo = userCredential.additionalUserInfo;
    //
    //   final isNewUser = additionalUserInfo!.isNewUser;
    //
    //   if (isNewUser) {
    //     await _fireStore
    //         .collection(FirebaseNames.users)
    //         .doc(userCredential.user!.uid)
    //         .set(
    //       UserProfile(
    //         uid: userCredential.user!.uid,
    //         username: userCredential.user!.displayName,
    //         email: userCredential.user!.email,
    //         avatarUri: '',
    //       ).toJson(),
    //     );
    //   }
    //
    //   if (isNewUser) {
    //     await _categoryDataSource.addStartCategory();
    //   }
    //
    //   print('5');
    //
    //   final response = await _fireStore
    //       .collection(FirebaseNames.users)
    //       .doc(userCredential.user!.uid)
    //       .get();
    //
    //   print('6');
    //
    //   final jsonData = response.data();
    //
    //   if (jsonData == null) {
    //     throw Exception();
    //   }
    //
    //   final userProfile =
    //   UserProfile.fromJson(jsonData);
    //
    //   if (userProfile.avatarUri?.isNotEmpty ?? false) {
    //     imagePath = await _fileManager.download(url: userProfile.avatarUri!, name: userProfile.uid!);
    //   }
    //
    //   print('7');
    //
    //   return userProfile.copyWith(avatarUri: imagePath ?? '');
    // }
    return UserProfile.empty();
  }

  @override
  Future<void> reSubmitVerification({required UserCredential request}) async {
    await request.user?.sendEmailVerification();
  }

  @override
  Future<UserProfile> getUserProfile({required UserCredential user}) async {
    String? imagePath;

    final response = await _fireStore
        .collection(FirebaseNames.users)
        .doc(user.user!.uid)
        .get();

    final userProfile =
        UserProfile.fromJson(response.data() as Map<String, dynamic>);

    if (userProfile.avatarUri?.isNotEmpty ?? false) {
      imagePath = await _fileManager.download(
          url: userProfile.avatarUri!, name: userProfile.uid!);
    }

    return userProfile.copyWith(avatarUri: imagePath ?? '');
  }

  @override
  Future<void> deleteAccount({required String uid}) async {
    await _fireStore
        .collection(FirebaseNames.users)
        .doc(uid)
        .delete()
        .catchError((error) {
      GetIt.instance<SnackBarService>().show(
        snackBar: ErrorSnackBar(
          exception: Exception(),
        ),
      );
    });

    await _auth.currentUser!.delete().catchError((error) {
      GetIt.instance<SnackBarService>().show(
        snackBar: ErrorSnackBar(
          exception: Exception(),
        ),
      );
    });
  }
}
