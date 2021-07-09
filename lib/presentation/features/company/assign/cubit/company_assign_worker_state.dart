part of 'company_assign_worker_cubit.dart';

class CompanyAssignWorkerState extends Equatable {
  const CompanyAssignWorkerState(
      {this.name = '', this.email = '', this.password = ''});

  final String? name;
  final String? email;
  final String? password;

  CompanyAssignWorkerState copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return CompanyAssignWorkerState(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password
    );
  }

  @override
  List<Object?> get props => [name, email, password];
}


