import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_cash_app/app_router.dart';
import 'package:tab_cash_app/data/models/user_data.dart';
import 'package:tab_cash_app/modules/home/cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserDataModel userFinalData;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).gitUsersBloc();
  }

  Widget homeScreenLoading() {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget homeScreenWidget() {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Text(
                'Hi ms.${userFinalData.firstName}, Wellcome to TabCacsh');
          },
        ),
      ),
    );
  }

  Widget buildScreenWidget() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: ((context, state) {
        if (state is UserLoaded) {
          userFinalData = (state).userState;
          return homeScreenWidget();
        } else {
          return homeScreenLoading();
        }
      }),
    );
  }

// Home Screen Scaffold
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildScreenWidget(),
    );
  }
}
