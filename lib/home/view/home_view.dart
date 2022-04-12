import 'package:cubit_bloc/core/constant/string_constants.dart';
import 'package:cubit_bloc/home/service/home-service.dart';
import 'package:cubit_bloc/home/view_model/home_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

class homeView extends StatelessWidget {
  const homeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
          homeService:
              HomeService(Dio(BaseOptions(baseUrl: StringConstants.baseUrl)))),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(StringConstants.title),
              centerTitle: true,
            ),
            body: context.read<HomeCubit>().isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      LottieContainer(context),
                      GridViewBuilder(context)
                    ],
                  ),
          );
        },
      ),
    );
  }

  SizedBox GridViewBuilder(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.63),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: context.read<HomeCubit>().model?.data?.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 10,
            child: Column(
              children: [
                Text(context.read<HomeCubit>().model?.data?[index].firstName ??
                    ""),
                Text(context.read<HomeCubit>().model?.data?[index].lastName ??
                    ""),
                Container(
                  width: context.dynamicWidth(0.38),
                  height: context.dynamicHeight(0.2),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        context.read<HomeCubit>().model?.data?[index].avatar ??
                            ""),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Container LottieContainer(BuildContext context) {
    return Container(
      child: Lottie.asset("assets/lottie/dj.json"),
      height: context.dynamicHeight(0.2),
    );
  }
}
