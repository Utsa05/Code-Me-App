part of 'output_cubit.dart';

abstract class OutputState extends Equatable {
  const OutputState();

  @override
  List<Object> get props => [];
}

class OutputInitial extends OutputState {}

class OuputLoading extends OutputState {}

class OutputResponseS extends OutputState {
  final CompileOutputModel compileOutputModel;

  const OutputResponseS(this.compileOutputModel);
}

class OutputErrorState extends OutputState {
  final String message;

  const OutputErrorState(this.message);

  @override
  List<Object> get props => [message];
}
