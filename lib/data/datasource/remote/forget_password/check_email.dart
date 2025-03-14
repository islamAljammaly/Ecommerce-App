
import '../../../../core/class/crud.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postdata(String email) async {
    var response = await crud.postData('', {
      "email" : email   
    });
    return response.fold((l) => l, (r) => r);
  }
}