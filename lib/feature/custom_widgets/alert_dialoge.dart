
import 'package:flutter/material.dart';

class DialogeUtls{
  static void showLoading(
    {required BuildContext context,required String message}){

    showDialog(
      barrierDismissible: false,
      context: context,
       builder: (context){
        return AlertDialog(
          content: Row(children:  [
            const CircularProgressIndicator(),
            Padding(padding:const  EdgeInsets.all(8),
            child:  Text(message),
            ),
          ],),
        );
       }
       );
  }
  static void hideLoading({required BuildContext context}){
        Navigator.of(context).pop();
       }
  static void showMessage( {
    required BuildContext context,
    required String message,
    String title="",
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
  }){
    List<Widget>actions=[];
    if(posActionName!=null){
      actions.add(
        TextButton(
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pop();
            posAction?.call();
          },
           child: Text(posActionName))
      );
    }
     if(negActionName!=null){
      actions.add(
        TextButton(
          onPressed: (){
            Navigator.pop(context);
            negAction?.call();
          },
           child: Text(negActionName))
      );
    }
    showDialog(
      barrierDismissible: false,
      context: context,
       builder: (context){
        return AlertDialog(
          content: Text(message),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: actions,
        );
       }
       );
  }     
}