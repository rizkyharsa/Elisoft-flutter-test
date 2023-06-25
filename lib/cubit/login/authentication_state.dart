import 'package:equatable/equatable.dart';

import '../../models/login/user.dart';

abstract class AuthenticationState extends Equatable{
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState{}

class AuthenticationLoading extends AuthenticationState{}

class AuthenticationSuccess extends AuthenticationState{
  final User user;

  const AuthenticationSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthenticationError extends AuthenticationState{
  final String error;

  const AuthenticationError({required this.error});

  @override
  List<Object> get props => [error];
}