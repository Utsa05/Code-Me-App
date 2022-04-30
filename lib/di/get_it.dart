import 'package:code_me/data/core/api_client.dart';
import 'package:code_me/data/datasources/compiler_remote_datasource.dart';
import 'package:code_me/data/repositories/compiler_repository_impl.dart';
import 'package:code_me/domain/repositories/compiler_repository.dart';
import 'package:code_me/domain/usecases/compile_usecase.dart';
import 'package:code_me/domain/usecases/get_output_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final instance = GetIt.instance;
Future dInit() async {
  instance.registerLazySingleton<Client>(() => Client());
  instance.registerLazySingleton<ApiClient>(() => instance());
  instance.registerLazySingleton<CompileRemoteDataSource>(
      () => CompileRemoteDatasourceImpl(instance()));

  instance.registerLazySingleton<CompilerRepository>(
      () => CompilerRepositoryImpl(dataSource: instance()));

  instance.registerLazySingleton<CompileUsease>(
      () => CompileUsease(compilerRepository: instance()));

  instance.registerLazySingleton<GetOutputUsecase>(
      () => GetOutputUsecase(compilerRepository: instance()));
}
