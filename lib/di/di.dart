import 'package:code_me/data/core/api_client.dart';
import 'package:code_me/data/datasources/local_datasource/local_datasource.dart';
import 'package:code_me/data/datasources/romote_datasource/compiler_remote_datasource.dart';
import 'package:code_me/data/repositories/compiler_repository_impl.dart';
import 'package:code_me/data/repositories/localdb_repository_impl.dart';
import 'package:code_me/domain/repositories/compiler_repository.dart';
import 'package:code_me/domain/repositories/localdb_repository.dart';
import 'package:code_me/domain/usecases/compile_usecase.dart';
import 'package:code_me/domain/usecases/delete_usecase.dart';
import 'package:code_me/domain/usecases/get_languages_usecase.dart';
import 'package:code_me/domain/usecases/get_output_usecase.dart';
import 'package:code_me/domain/usecases/insert_usecase.dart';
import 'package:code_me/domain/usecases/update_usecase.dart';
import 'package:code_me/presentations/cubits/CompileRequestCubit/compilerequest_cubit.dart';
import 'package:code_me/presentations/cubits/OutputCubit/output_cubit.dart';
import 'package:code_me/presentations/cubits/loadingCubit/loading_cubit.dart';
import 'package:code_me/presentations/cubits/localCubit/local_cubit_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final instance = GetIt.I;
Future dInit() async {
  instance.registerLazySingleton<Client>(() => Client());
  instance.registerLazySingleton<ApiClient>(() => ApiClient(instance()));
  instance.registerLazySingleton<CompileRemoteDataSource>(
      () => CompileRemoteDatasourceImpl(instance()));

  instance.registerLazySingleton<CompilerRepository>(
      () => CompilerRepositoryImpl(dataSource: instance()));

  instance.registerLazySingleton<LocalDatasource>(() => LocalDatasourceImpl());

  instance.registerLazySingleton<CompileUsease>(
      () => CompileUsease(compilerRepository: instance()));

  instance.registerLazySingleton<GetOutputUsecase>(
      () => GetOutputUsecase(compilerRepository: instance()));

  instance.registerLazySingleton<LocalDBRepository>(
      () => LocaldbRepositoryImpl(instance()));

  instance.registerLazySingleton<GetLanguageUsecase>(
      () => GetLanguageUsecase(instance()));

  instance
      .registerLazySingleton<InsertUsecase>(() => InsertUsecase(instance()));

  instance
      .registerLazySingleton<UpdateUsecase>(() => UpdateUsecase(instance()));

  instance
      .registerLazySingleton<DeleteUsecase>(() => DeleteUsecase(instance()));

  instance.registerSingleton<LoadingCubit>(LoadingCubit());

  instance.registerFactory(
      () => CompilerequestCubit(instance(), instance(), instance()));

  instance.registerFactory(() => OutputCubit(instance()));

  instance.registerFactory(
      () => LocalCubitCubit(instance(), instance(), instance()));
}
