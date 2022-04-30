import 'package:code_me/data/core/api_client.dart';
import 'package:code_me/data/models/compile_output_model.dart';
import 'package:code_me/data/models/compile_request_model.dart';
import 'package:code_me/data/models/compile_response_model.dart';

abstract class CompileRemoteDataSource {
  Future<CompileResponseModel> requestCompile(CompileRequestModel requestModel);

  Future<CompileOutputModel> getOutput(dynamic submissionid);
}

class CompileRemoteDatasourceImpl implements CompileRemoteDataSource {
  final ApiClient _apiClient;

  CompileRemoteDatasourceImpl(this._apiClient);

  @override
  Future<CompileOutputModel> getOutput(dynamic submissionid) async {
    final response = await _apiClient.get(submissionid);
    final output = CompileOutputModel.fromJson(response);
    print('output');
    print(response);
    return output;
  }

  @override
  Future<CompileResponseModel> requestCompile(
      CompileRequestModel requestModel) async {
    final response = await _apiClient.post('submit-request', requestModel);
    final responseBody = CompileResponseModel.fromJson(response);
    return responseBody;
  }
}
