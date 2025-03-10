
import '../../../../core/class/crud.dart';

class VerfiyCodeSignUpData {
  Crud crud;
  VerfiyCodeSignUpData(this.crud);
  postdata(String email ,String verifycode ) async {
    var response = await crud.checkEmailVerification();
    return response.fold((l) => l, (r) => r);
  }
}