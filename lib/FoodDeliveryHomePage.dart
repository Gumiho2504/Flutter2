import 'package:flutter/material.dart';

class Food_HomePage extends StatefulWidget {
  const Food_HomePage({super.key});

  @override
  State<Food_HomePage> createState() => _Food_HomePageState();
}

class _Food_HomePageState extends State<Food_HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buidBody(context),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: 400,
          height: 50,
          decoration: BoxDecoration(
            //color: Colors.amber,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Icon(Icons.home_sharp,size:30,color: Colors.grey,),
            Icon(Icons.shop,size:30,color: Colors.grey,),
            Icon(Icons.person,size:30,color: Colors.grey,),
          ]),
        ),
      ),
    );
  }
}

_buidBody(context) => Container(
  child:SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 250, 250, 250),
            height: 600,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              // Header#############################################################################
              //####################################################################################
              children: [
                Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        )
                      ],
                      color: Colors.red,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(65)),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://media.baamboozle.com/uploads/images/185253/1619746921_376370_url.jpeg"),
                          fit: BoxFit.cover)),
                ),
                ////Texdfile############################search
                Positioned(
                    top: 50,
                    left: 30,
                    right: 30,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: TextField(
                        enableInteractiveSelection: true,
                        scribbleEnabled: true,
                        autofocus: false,
                        obscureText: false,
                        style: TextStyle(color: Colors.brown,),
                        keyboardType: TextInputType.name,
                        autocorrect: true,
                        decoration: InputDecoration(
                          enabled: true,
                          prefixIcon: Icon(Icons.search_sharp, color: Colors.black),
                          hintText: 'Search Food',
                            border: InputBorder.none,
                      
                          ),
                        ),
                    )),
          ////////Food Text
              Positioned(
                top: 400,
                left: 20,
                child:  Text('Food Type',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,shadows: [Shadow(color: Colors.black)]),)
                ),
     /////////Food Type Circle
              Positioned(
                top: 450,
                child: Container(
                  //color: Colors.amber,
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: foodType.length,
                    itemBuilder: (context, index){
                      return _buidCircleFoodType(foodType[index], context);
                    }
                     ),
                )),
              
              
              ],
            ),
          ),
         /////////////////Food discription  /////////////////////////
                //////Foood name/////
                ////////////////////////
         Container(
          margin: EdgeInsets.all(20),
          alignment: Alignment.topLeft,
          child: Text('Specile Food',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,shadows: [Shadow(color: Colors.black)]),)),
          Container(
            color: Color.fromARGB(221, 68, 14, 232),
            margin: EdgeInsets.all(20),
            height:170,
            width: 380,
            child: ListView.builder(
             physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: foodDiscription.length,
              itemBuilder:(context, index) => _buidFoodDiscription(foodDiscription[index], context),
            ),
          )
       ],
      ),
    ));

 _buidFoodDiscription (FoodDiscription food,BuildContext context)=> Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 170,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: NetworkImage(food.img),fit: BoxFit.cover)
                ),
              ),
              Container(
                height: 170,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Container(
                    height:140,
                    width: 190,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Text(food.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8),fontStyle: FontStyle.italic),),
                      Text(food.discription,style: TextStyle(fontSize: 18,color: Colors.grey,fontStyle: FontStyle.italic),)
                      
                    ]),
                  ),
                ),
              )
            ],
          );
 _buidCircleFoodType(FoodTpye f,BuildContext context) => Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    )
                  ],
                  color: Colors.blue,
                  shape: BoxShape.circle, 
                  image: DecorationImage(image: NetworkImage(f.image),fit: BoxFit.cover)
                ),
              ),
              //SizedBox(height: 5,),
              Text(f.name)
            ],
            );
class FoodTpye{
  String image;
  String name;
  FoodTpye(this.image,this.name);
}
class FoodDiscription{
  String img,title,discription;
  FoodDiscription(this.img,this.title,this.discription);
}
List<FoodDiscription> foodDiscription = [
  FoodDiscription("https://whisk-res.cloudinary.com/image/upload/g_auto,g_auto,c_fill,q_60,f_auto,h_600,w_800/v1659234467/v3/user-recipes/toxevkwtbeomj2rr4arz.jpg", "Tteobokki","Stroll along any city center in Korea, and you’ll find plenty of pojangmacha and"),
  FoodDiscription("https://www.connoisseurusveg.com/wp-content/uploads/2021/07/ribollita-r-sq.jpg", "Ribollita","The only thing better than soup with bread? Soup that not only has chunks of bread in it, but crunchy  "),
  FoodDiscription("https://watermark.lovepik.com/photo/20211122/large/lovepik-japanese-style-dish-with-sashimi-picture_500695470.jpg", "Sashimi","is a Japanese delicacy consisting of fresh raw fish or meat sliced into thin pieces and "),
  FoodDiscription("https://wander-lush.org/wp-content/uploads/2019/09/Emily-Lush-Khmer-food-Phnom-Penh-4-2.jpg", "Khmer Food","Never heard of Khmer cuisine? Cambodian food might! Here are the best local dishes to try in Cambodia,"),
  FoodDiscription("https://www.indicasoftpower.com/wp-content/uploads/2021/09/5.jpg", "Aromas of Indian","The Indian Institute of Technology, Jodhpur recently analysed almost "),
];
List <FoodTpye> foodType = [
  FoodTpye("https://cdn.britannica.com/36/123536-050-95CB0C6E/Variety-fruits-vegetables.jpg", "Vegetable"),
  FoodTpye("https://health.clevelandclinic.org/wp-content/uploads/sites/3/2019/10/redMeat-849360782-770x553.jpg", "Meat"),
  FoodTpye("https://img.onmanorama.com/content/dam/mm/en/food/features/images/2022/1/1/food-prevent-sun-tan.jpg", "Fruit"),
  FoodTpye("https://img.delicious.com.au/CKMUcpx-/w1200/del/2015/11/summer-cocktails-24374-3.jpg", "Drink"),
  FoodTpye("https://www.crushpixel.com/big-static17/preview4/concept-mediterranena-diet-with-fishmeat-2636046.jpg", "Fish"),
];
