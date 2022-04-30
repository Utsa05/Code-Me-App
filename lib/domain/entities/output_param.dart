import 'package:equatable/equatable.dart';

class OutputParams extends Equatable {
  final dynamic submissionid;

  const OutputParams({required this.submissionid});
  @override
  List<Object?> get props => [submissionid];
}
