import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import './store/AppStore.dart';
import './utils/AppTheme.dart';
import 'utils/DAColors.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

AppStore appStore = AppStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize(aLocaleLanguageList: [
    LanguageDataModel(
        id: 1,
        name: 'English',
        languageCode: 'en',
        fullLanguageCode: 'en-US',
        flag: 'images/flag/ic_us.png'),
    LanguageDataModel(
        id: 2,
        name: 'Hindi',
        languageCode: 'hi',
        fullLanguageCode: 'hi-IN',
        flag: 'images/flag/ic_hi.png'),
    LanguageDataModel(
        id: 3,
        name: 'Arabic',
        languageCode: 'ar',
        fullLanguageCode: 'ar-AR',
        flag: 'images/flag/ic_ar.png'),
    LanguageDataModel(
        id: 4,
        name: 'French',
        languageCode: 'fr',
        fullLanguageCode: 'fr-FR',
        flag: 'images/flag/ic_fr.png'),
  ]);
  appStore.toggleDarkMode(value: getBoolAsync('isDarkModeOnPref'));

  defaultRadius = 10;
  defaultToastGravityGlobal = ToastGravity.BOTTOM;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title:
                  '${'Cloud Storage'}${!isMobile ? ' ${platformName()}' : ''}',
              home: const MyDarkMode(),
              theme: !appStore.isDarkModeOn
                  ? AppThemeData.lightTheme
                  : AppThemeData.darkTheme,
            ));
  }
}

class MyDarkMode extends StatelessWidget {
  const MyDarkMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Darkmode Feature',
          titleTextStyle: boldTextStyle(size: 25), color: context.cardColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton(
              width: context.width(),
              color: primaryColor,
              text: 'Enable DarkMode',
              textStyle: boldTextStyle(color: white),
              onTap: (() {
                appStore.toggleDarkMode();
              })),
        ],
      ),
    );
  }
}
