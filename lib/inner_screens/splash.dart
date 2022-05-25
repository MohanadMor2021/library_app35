
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/ads/interstitial_ad_model.dart';
import 'package:library_app/components/global_componnets.dart';

import '../components/constant.dart';
import '../drawer_screens/home_screen/cubit/home_cubit.dart';
import '../drawer_screens/home_screen/cubit/home_state.dart';
import '../drawer_screens/home_screen/home_sceen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
//    Adinterstitial.loadInterstitialAd();

    Timer(
        Duration(seconds: 10),
            () {

          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen()));
//          Adinterstitial.showInterstitialAd();

        }
    );

  }

  @override
  Widget build(BuildContext context) {

    return  BlocProvider(
      create: (BuildContext context) =>LibraryCubit()..getAppData(),

       child:  BlocConsumer<LibraryCubit, libraryStates>(
         listener: (contex,state){},
         builder:  (context, state) {
           LibraryCubit cubit = LibraryCubit.get(context);

           return cubit.appModel!=null?Scaffold(
//             backgroundColor: primaryColor,
             body: Center(
               child: Image.network(cubit.appModel.app.logo, width:  170,)
             ),
           ):Center(child: buildSearchLoadingIndicator());


         },
       ),

          );
  }
}

