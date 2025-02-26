import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({super.key});

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {

  Future<void> askPermission() async{
  PermissionStatus permissionStatus=await getContactsPermissions();



 }

  Future<PermissionStatus> getContactsPermissions() async {
    PermissionStatus permission =await Permission.contacts.status;

    if(permission !=PermissionStatus.granted && permission !=PermissionStatus.permanentlyDenied){
      PermissionStatus permissionStatus=await Permission.contacts.request();
      return permissionStatus;
    }else{
      return permission;
    }
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Contract page "),
      ),
    );
  }


}
