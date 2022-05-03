part of 'compilerequest_cubit.dart';

abstract class CompilerequestState extends Equatable {
  const CompilerequestState();

  @override
  List<Object> get props => [];
}

class CompilerequestInitial extends CompilerequestState {}

class CompilerequestLoading extends CompilerequestState {}

class CompileSuccess extends CompilerequestState {}

class CompileResponse extends CompilerequestState {
  final CompileResponseModel responseModel;

  const CompileResponse(this.responseModel);
}

class CompileOuputResponse extends CompilerequestState {
  final CompileOutputModel responseModel;

  const CompileOuputResponse(this.responseModel);
}

class CompileError extends CompilerequestState {
  final String message;

  const CompileError(this.message);

  @override
  List<Object> get props => [message];
}

class OutputResponseStage extends CompilerequestState {
  final CompileOutputModel compileOutputModel;

  const OutputResponseStage(this.compileOutputModel);
}

class OutputError extends CompilerequestState {
  final String message;

  const OutputError(this.message);

  @override
  List<Object> get props => [message];
}
