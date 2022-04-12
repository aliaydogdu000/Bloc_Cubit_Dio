import 'package:cubit_bloc/core/constant/extension/network_path.dart';
import 'package:cubit_bloc/home/model/home_model.dart';
import 'package:dio/dio.dart';

abstract class IHomeService {
  final Dio dio;

  IHomeService(this.dio);

  final String homePath = IHomeServicePath.homePath.rawValue;

  Future<HomeModel?> fetchHomeDatas();
}

class HomeService extends IHomeService {
  HomeService(Dio dio) : super(dio);

  @override
  Future<HomeModel?> fetchHomeDatas() async {
    final response = await dio.get(homePath);
    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
