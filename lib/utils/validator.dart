import 'package:form_field_validator/form_field_validator.dart';

RequiredValidator requiredValidator = RequiredValidator(errorText: 'Required');
MultiValidator emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Required'),
  EmailValidator(errorText: 'Invalid email')
]);

MultiValidator phoneValidator = MultiValidator([
  RequiredValidator(errorText: 'Required'),
  MinLengthValidator(9, errorText: 'Invalid length'),
  MaxLengthValidator(9, errorText: 'Invalid length'),
  PatternValidator(r'^(?=.*?[0-9])', errorText: 'Invalid character'),
]);
