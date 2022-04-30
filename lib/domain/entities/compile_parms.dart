import 'package:code_me/data/models/compile_request_model.dart';
import 'package:equatable/equatable.dart';

class CompileParms extends Equatable {
  final CompileRequestModel value;

  const CompileParms({required this.value});

  @override
  List<Object?> get props => [value];
}
