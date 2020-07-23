import 'package:cards/domain/dependencies/domain_module.dart';
import 'package:cards/generated/locale_key.g.dart';
import 'package:cards/presentation/base/contract.dart';
import 'package:cards/presentation/base/page.dart';
import 'package:cards/presentation/base/viewmodel.dart';
import 'package:cards/presentation/home/home.dart';
import 'package:cards/storage/dependencies/storage_module.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() => runApp(EasyLocalization(
    supportedLocales: [Locale('en'), Locale('vi')],
    path: 'asset/langs',
    child: MyApp()));

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends BaseState<MyApp, BaseContractView,
    BaseContractPresenter, BaseContractNavigator, BaseViewModel> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: LocaleKeys.appTitle,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }

  @override
  void initDependencies() {
    DomainModule.init();
    StorageModule.init();
  }

  @override
  BaseContractView get view => null;

  @override
  BaseViewModel get viewModel => null;

  @override
  BaseContractPresenter get presenter => null;

  @override
  BaseContractNavigator get navigator => null;
}
