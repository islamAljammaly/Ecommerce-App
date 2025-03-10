
import '../../../../core/class/crud.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String email ,String password) async {
    var response = await crud.signInWithEmailAndPassword(email, password);
    return response.fold((l) => l, (r) => r);
  }
}