// login exceptions
class WrongPasswordAuthException implements Exception{}
class UserNotFoundAuthException implements Exception{}
// register exceptions
class WeakPasswordAuthException implements Exception{}
class EmailAlreadyInUseAuthException implements Exception{}
class InvalidEmailAuthException implements Exception{}
// generic exceptions
class GenericInAuthException implements Exception{}
class UserNotLoggedInAuthException implements Exception{}