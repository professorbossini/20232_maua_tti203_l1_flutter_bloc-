import 'dart:async';
import 'package:email_validator/email_validator.dart';
mixin Validators{
  //isso não vai ser uma classe, em breve será um mixin
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      //if email valido, chamo o metodo add do sink, senão chamo o metodo addError
      if(EmailValidator.validate(email)){
        sink.add(email);
      }
      else{
        sink.addError('E-mail $email inválido');
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if (password.length > 3){
        sink.add(password);
      }
      else{
        sink.addError('Senha inválida');
      }
    }
  );
}