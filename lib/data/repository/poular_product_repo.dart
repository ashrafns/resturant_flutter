import 'package:get/get.dart';
import 'package:returant_flutter/data/api/aoi_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData('https://www.dbesteah.com/api/poroduct/list');
  }
}
