import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    final result = await httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    if (result['result'] != null) {
      final user = UserModel.fromMap(result['result']);
      print(user);
    } else {
      print('signIn nok');
      print(result['error']);
    }
  }
}
