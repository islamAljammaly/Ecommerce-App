

import '../../../core/class/crud.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var response = await crud.postData('https://catfact.ninja/fact', {});
    return response.fold((l) => l, (r) => r);
  }
}