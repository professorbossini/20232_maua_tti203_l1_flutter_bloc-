import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';
class LoginTela extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: submitButton(bloc)
                )
              )
            ],
          )
        ],
      )
    );
  }

  Widget emailField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, AsyncSnapshot <String> snapshot){
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            //se tiver erro, mostro o erro, senão, associo null
            errorText: snapshot.hasError ? '${snapshot.error}' : null,
            hintText: 'seu@email.com',
            labelText: 'Digite seu e-email'
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, AsyncSnapshot <String> snapshot){
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            errorText: snapshot.hasError ? '${snapshot.error}' : null,
            hintText: 'Senha',
            labelText: 'Senha'
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, AsyncSnapshot <String> snapshot1){         
        return StreamBuilder(
          stream: bloc.email,
          builder: (context, AsyncSnapshot <String> snapshot2){
            return ElevatedButton(
              onPressed: snapshot1.hasError || snapshot2.hasError ? null : (){}, 
              child: Text('OK') 
            );
          },
        );
      }
    );
  }
}