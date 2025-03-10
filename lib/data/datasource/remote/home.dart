import 'package:dartz/dartz.dart';

import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData() async {
      // Fetch categories
      var categoriesResult = await crud.fetchDataHome('categories');
      if (categoriesResult.isLeft()) return const Left(StatusRequest.serverfailure);

      // Fetch items
      var itemsResult = await crud.fetchDataHome('items');
      if (itemsResult.isLeft()) return const Left(StatusRequest.serverfailure);

      // Map data to a combined structure
      return Right({
        'status': 'success',
        'categories': categoriesResult.fold((l) => null, (r) => r.docs.map((doc) => doc.data()).toList()),
        'items': itemsResult.fold((l) => null, (r) => r.docs.map((doc) => doc.data()).toList()),
      });
  }
}
