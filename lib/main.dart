import 'package:flutter/material.dart';
import 'package:p1/detailspage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        bottomNavigationBar:Container(height: 70,
        color: Colors.white,
        child:Container(
          decoration: BoxDecoration(color: Colors.white,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),boxShadow: [
          BoxShadow(blurRadius: 20,color: Colors.grey[300]! , spreadRadius: 1,)
        ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            buildcont(Icons.person),
            buildcont(Icons.shopping_bag),
            buildcont(Icons.home,isselected: true,),
            buildcont(Icons.favorite),
            buildcont(Icons.settings),
          
          ],
          ),
        ),
        ) ,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.grey[300],
          elevation: 0,
          leading: Image.asset("assets/images/hamburger.png"),
          actions: [
            Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10),
                child: Image.asset("assets/images/SEARCH.png")),
          ],
        ),
        body: Column(
          children: [
            const Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Shop ",
                  style: TextStyle(fontSize: 32, letterSpacing: 1),
                ),
                Text(
                  "Anthropologie",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                newMethod("Home Decor", isselected: true),
                newMethod(" Bath & Body"),
                newMethod("Beauty"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 20,
                        )
                      ]),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height:40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            newMethodattop("Candels",isselected: true),
                            newMethodattop("Vases"),
                            newMethodattop("Bins"),
                            newMethodattop("Floral"),
                            newMethodattop("Decor"),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        
                        const MyCandelsList(),
                        
                        const SizedBox(height:20),
                        const LineBar(),
                        const Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Row(
                          
                            children: [
                            Text("Holiday Special",style: TextStyle(fontSize: 20),),
                            Spacer(),
                            Text("View All",style: TextStyle(fontSize: 15,color: Colors.grey),),
                            ],),
                        ),
                        
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            
                            children: [
                              buildbottomcontainer("3","Coconout Milk Bath","16 0z","28"),
                              buildbottomcontainer("2","Herbivore Milk Bath","14 0z","26"),
                              buildbottomcontainer("1","Cool Coconut Bath","16 3z","23"),
                              buildbottomcontainer("3","Coconout Milk Bath","26 0z","28"),
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),),
            )
          ],
        ),
      ),
    );
  }

  Container buildcont(IconData icon,{isselected=false}) {
    return Container(decoration: BoxDecoration(color:isselected? Colors.pink[100]:Colors.white,shape: BoxShape.circle,
    boxShadow:isselected? [
      const BoxShadow(color: Colors.grey,blurRadius: 10,spreadRadius: 1)
    ]:[],
        ),
        height: 50,
        width: 50,
        child: Icon(icon,color: isselected?Colors.white:Colors.black,),
        );
  }

  Container buildbottomcontainer(String img, String title,String text,String price) {
    return Container(height:130,
                        color: Colors.white,
                        width: 250,
                        margin: const EdgeInsets.only(left:20),
                        child: Row(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: SizedBox(
                              height: 120,
                              width: 100,
                              child: Image.asset("assets/images/candel$img.jpg",fit: BoxFit.cover,),),),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(title),
                                Text(text,style: const TextStyle(color: Colors.grey,fontSize: 18,),),
                                const Spacer(),
                                Text("\$ $price",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),
                            
                            
                            
                              ],
                            ),
                          )
                        ],),);
  }

 
  Column newMethodattop(String text, {bool isselected=false}) {
    return Column(
                          children: [
                            Text(text,style: TextStyle(color:isselected? Colors.black:Colors.grey,fontSize: 18,),
                            ),
                            const SizedBox(height: 5,),
                            if(isselected)
                            Container(height: 5,width: 5,
                            decoration: const BoxDecoration(
                              color:Colors.black,
                              shape: BoxShape.circle,
                               ),)
                          ],
                        );
  }

  TextButton newMethod(String text, {bool isselected = false}) {
    return TextButton(
      onPressed: () {
        print("button pressed");
      },
      style: TextButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: isselected ? Colors.pink[100] : Colors.grey[400],
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isselected ? Colors.white : Colors.black, fontSize: 18),
      ),
    );
  }
}

class LineBar extends StatelessWidget {
  const LineBar({super.key});

   @override
  Widget build(BuildContext context) {
    
    return Container(height: 5,width: MediaQuery.of(context).size.width,
    
    margin: const EdgeInsets.only(left: 40),
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(color:  Colors.grey[300],
    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),),
    ),

    child: Container(height: 5,width: 100,
     decoration: const BoxDecoration(color:  Colors.black,
    borderRadius: BorderRadius.all(Radius.circular(10),),
    ),
    ),
    );
  }
}


class MyCandelsList extends StatelessWidget {
  const MyCandelsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
        
          buildcolumn("1", "Elemental Tin Candel", "29",context),
          buildcolumn("2", "Summer Candel", "23",context),
          buildcolumn("3", "Winter candel", "40",context),
          buildcolumn("4", "dummy candel", "60",context),
        ],
      ),
    );
  }
    GestureDetector buildcolumn(String img, String title,String price,BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return  DetailsPage(img,title,price,context,); 
         
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
                            children: [
                              SizedBox(
                                height:100,
                                width: 160,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  
                                  child: Image.asset("assets/images/candel$img.jpg",fit: BoxFit.cover,),),),
                                const SizedBox(height: 10,
                                ),
                                Text(title),
                                  const SizedBox(height: 10,
                                ),
                                Text("\$ $price",style: const TextStyle(fontSize: 20),),
                            ],
                          ),
      ),
    );
  }
}

