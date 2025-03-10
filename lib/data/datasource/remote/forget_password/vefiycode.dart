
import '../../../../core/class/crud.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postdata(String email ,String verifycode) async {
    var response = await crud.postData('', {
      "email" : email , 
      "verifycode" : verifycode   
    });
    return response.fold((l) => l, (r) => r);
  }
}