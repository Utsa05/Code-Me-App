import 'package:equatable/equatable.dart';

class CompileParms extends Equatable {
  final dynamic value;

  const CompileParms({this.value});

  @override
  List<Object?> get props => [value];
}
