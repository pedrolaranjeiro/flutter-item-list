import 'package:app/config.dart';
import 'package:app/data/errors.dart';
import 'package:app/data/model/item.dart';
import 'package:dio/dio.dart';

class ItemsProvider {
  Dio dio = Dio();

  Future<List<Item>> getItems() async {
    try {
      final response = await dio.get(apiItemsUrl);
      if (response.data == null) {
        // If the respinse is null, throw invalid reponse error
        throw InvalidResponseError();
      }
      return (response.data as List).map((e) => Item.fromMap(e)).toList();
    } on Exception catch (e) {
      // throw error when payload fails to be decoded
      throw InvalidPayloadError();
    }
  }
}
