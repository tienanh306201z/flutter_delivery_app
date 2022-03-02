import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetailController extends GetxController {
  var isFavorite = false.obs;

  getFavStatus() {
    var data = GetStorage().read('FAV');
    if (data == null) return;
    isFavorite.value = data;
  }

  setFavStatus() {
    isFavorite.value = !isFavorite.value;
    GetStorage().write('FAV', isFavorite.value);
  }
}
