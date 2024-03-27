import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intellicane/main_page/screen/page.dart';
import 'package:intellicane/maps_page/screen/maps_page.dart';
import 'package:intellicane/message_page/page.dart';
import 'package:intellicane/login_page/page.dart';

enum ApplicationState {
  loginPage,
  homePage,
  mapsPage,
  messagePage,
}

class WidgetBinder {
  const WidgetBinder();

  Widget get loginPage => const LoginPage();
  Widget get homePage => const MainHomePage();
  Widget get mapsPage => const MapsPage();
  Widget get messagePage => MessagePage();

  Widget fetchStateWidget(ApplicationState currentState) {
    switch (currentState) {
      case ApplicationState.loginPage:
        return loginPage;
      case ApplicationState.homePage:
        return homePage;
      case ApplicationState.mapsPage:
        return mapsPage;
      case ApplicationState.messagePage:
        return messagePage;
    }
  }

  Widget fetchStateWidgetWithIndex(int index) {
    switch (index) {
      case 0:
        return homePage;
      case 1:
        return mapsPage;
      case 2:
        return messagePage;
      default:
        return homePage;
    }
  }
}
