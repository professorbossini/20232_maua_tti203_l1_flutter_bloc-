import 'package:email_validator/email_validator.dart';
import 'dart:async';
mixin Validators{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if(EmailValidator.validate(data)){
        sink.add(data);
      }
      else{
        sink.addError('E-mail inválido');
      }
    },
  );  
  //somente senhas de, pelo menos, 4 caracteres sejam consideradas válidas
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink){
      if (data.length >= 4){
        sink.add(data);
      }
      else{
        sink.addError('Senha precisa ter, pelo menos, 4 caracteres');
      }
    }
  );
}