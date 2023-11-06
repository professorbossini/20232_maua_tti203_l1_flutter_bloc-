import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
class LoginTela extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(),
          passwordField(),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: submitButton()
                )
              )
            ],
          )
        ],
      )
    );
  }

  Widget emailField(){
    return StreamBuilder(
      builder: (context, AsyncSnapshot<String> snapshot){
        return TextField(
          onChanged: (newValue) => bloc.changeEmail(newValue),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'seu@email.com',
            labelText: 'Digite seu e-email',
            errorText: snapshot.hasError ? '${snapshot.error}' :  null
          ),
        );
      },
      stream: bloc.email,
    );
  }

  Widget passwordField(){
    return StreamBuilder(
      builder: (context, snapshot) {
        return TextField(
          onChanged: (newValue) => bloc.changePassword(newValue),
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Senha',
            labelText: 'Senha',
            errorText: snapshot.hasError ? '${snapshot.error}' : null
          ),
        );
      },
      stream: bloc.password
    );
  }

  Widget submitButton(){
    return ElevatedButton(
      onPressed: null, 
      child: Text('OK') 
    );
  }
}