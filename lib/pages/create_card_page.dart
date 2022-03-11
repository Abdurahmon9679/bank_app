import 'package:bank_app/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateCardPage extends StatefulWidget {
  const CreateCardPage({Key? key}) : super(key: key);

  static const String id = '/create';

  @override
  _CreateCardPageState createState() => _CreateCardPageState();
}

class _CreateCardPageState extends State<CreateCardPage> {
  TextEditingController seriaNumberController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();


  addCart()async{
    String serialNumber = seriaNumberController.text.trim().toString();
    String expireDate = expireDateController.text.trim().toString();
    String cvv = expireDateController.toString().trim().toString();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff052186),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add your card",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  Icon(Icons.qr_code_scanner,color: Colors.white,size: 35,),
                ],
              ),
              SizedBox(height: 10,),
              Text("Find in the fields below or use camera phone",style: TextStyle(color: Colors.white,fontSize: 14),textAlign: TextAlign.left,),
              SizedBox(height: 25,),
              Text("Your card number",style: TextStyle(color: Colors.white,fontSize: 18),),
              Container(
                margin: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child:  TextField(
                  controller: seriaNumberController,
                  keyboardType: TextInputType.number,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.all(20),
                    border: InputBorder.none,
                    hintText: 'serie number'
                  ),
                ),
              ),
              SizedBox(height: 25,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                Text("Expire date",style: TextStyle(color: Colors.white,fontSize: 18),),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: MediaQuery.of(context).size.width*0.4,
                  height: 50,
                  child:  TextField(
                    controller: expireDateController,
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(20),
                        border: InputBorder.none,
                        hintText: 'date'
                    ),
                  ),
                ),
                  ],
                    ),

                    Column(
                      children: [
                        Text("CVV2",style: TextStyle(color: Colors.white,fontSize: 18),),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: MediaQuery.of(context).size.width*0.4,
                          height: 50,
                          child:  TextField(
                            controller: cvvController,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                isCollapsed: true,
                                contentPadding: EdgeInsets.all(20),
                                border: InputBorder.none,
                                hintText: 'Cvv2'
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              SizedBox(height: 50,),
              Align(
                alignment: Alignment.bottomCenter,
               child: MaterialButton(onPressed: (){},
                  minWidth: MediaQuery.of(context).size.width,
                  height: 60,
                  shape: StadiumBorder(),
                  child: Text("Add",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
