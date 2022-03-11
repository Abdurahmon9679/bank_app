import 'package:bank_app/pages/create_card_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List items = ["Ali","Vali","G'ani","Qani"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
         // height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:    [
              ListTile(
                  title: Text("Good Morning",style: TextStyle(fontSize: 25,fontStyle: FontStyle.normal),),
                  subtitle: Text("eugane"),
                 trailing: CircleAvatar(
                   maxRadius: 25,
                   foregroundImage: AssetImage("assets/images/img.png"),
                 ),
                ),
              SizedBox(height: 20,),
              Container(
               // height: 300,
               child: ListView.builder(
                 shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context,index)
                    {
                      return itemOfCards(index);
                    }),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context,CreateCardPage.id);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_box_outlined,color: Colors.grey,size: 40,),
                      SizedBox(height: 10,),
                      Text("Add new card",style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemOfCards(int index) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade200,
                ),
              ),
              const Text("VISA",style: TextStyle(color: Colors.white,fontSize:25,fontWeight: FontWeight.bold),),            ],
          ),
          const SizedBox(height: 20,),
          const Text("1234  5678  9123  4567",style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.center,),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Hello",style: TextStyle(fontSize: 14),),
              Text("Expire"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Universal Travel",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text("04/11",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),


        ],
      ),
    );
  }
}
