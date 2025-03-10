
import '../../../../core/class/crud.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postdata(String email) async {
    var response = await crud.sendPasswordResetEmail(email);
    return response.fold((l) => l, (r) => r);
  }
}