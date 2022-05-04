import 'package:code_me/common/app_routes.dart';
import 'package:code_me/common/constants/route_constants.dart';
import 'package:code_me/common/screenutil/screenutil.dart';
import 'package:code_me/di/di.dart';
import 'package:code_me/presentations/cubits/CompileRequestCubit/compilerequest_cubit.dart';
import 'package:code_me/presentations/cubits/OutputCubit/output_cubit.dart';
import 'package:code_me/presentations/cubits/loadingCubit/loading_cubit.dart';
import 'package:code_me/presentations/cubits/localCubit/local_cubit_cubit.dart';

import 'package:code_me/presentations/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CodeMeApp extends StatefulWidget {
  const CodeMeApp({Key? key}) : super(key: key);

  @override
  State<CodeMeApp> createState() => _CodeMeAppState();
}

class _CodeMeAppState extends State<CodeMeApp> {
  late LoadingCubit _loadingCubit;
  late CompilerequestCubit _compilerequestCubit;
  late LocalCubitCubit _localCubitCubit;
  late OutputCubit _outputCubit;
  // This widget is the root of your application.

  @override
  void initState() {
    _compilerequestCubit = instance<CompilerequestCubit>();
    _loadingCubit = instance<LoadingCubit>();
    _outputCubit = instance<OutputCubit>();
    _localCubitCubit = instance<LocalCubitCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _compilerequestCubit.close();
    _loadingCubit.close();
    _outputCubit.close();
    _localCubitCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoadingCubit>.value(value: _loadingCubit),
        BlocProvider<CompilerequestCubit>.value(value: _compilerequestCubit),
        BlocProvider<OutputCubit>.value(value: _outputCubit),
        BlocProvider<LocalCubitCubit>.value(value: _localCubitCubit),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Code Me',
        theme: ThemeData(
          unselectedWidgetColor: ColorTheme.sceandaryColor,
          primaryColor: ColorTheme.primaryColor,
          scaffoldBackgroundColor: ColorTheme.primaryColor,
          brightness: Brightness.light,
          cardTheme: const CardTheme(
            color: ColorTheme.whiteColor,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(elevation: 0),
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorTheme.blueColor,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorTheme.primaryColor)),
          ),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: ColorTheme.redColor),
        ),
        initialRoute: RouteCons.initial,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
