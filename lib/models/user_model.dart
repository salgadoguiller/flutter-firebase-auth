import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String? email;
  final String? name;
  final String? photo;
  final bool? verifiedEmail;

  const User(
      {required this.id,
      this.email,
      this.name,
      this.photo,
      this.verifiedEmail = false});

  static const empty = User(id: '');

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [id, email, name, photo, verifiedEmail];
}
