import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Color backgroundColor = Color(0xFF343442);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;
  int isClick = 1;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.75).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          DashBoard(context),
        ],
      ),
    );
  }

  Widget menu(BuildContext context) {
    return SlideTransition(
      //make sideBar start from left to right
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50,),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                       image: AssetImage('assets/1.jpg')
                    ),shape: BoxShape.circle,

                  ),
                ),
                SizedBox(height: 25,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Text('Eslam Fares',style: TextStyle(color: Colors.white
                       ,fontWeight: FontWeight.w500,
                         fontSize: 25,
                          letterSpacing: 1.4,

                       ),),
                       Text('Mansoura, Egypt',style: TextStyle(
                         color: Colors.white70
                         ,fontWeight: FontWeight.w400,
                         fontSize: 14,
                         letterSpacing: 1.2,

                       ),)
                     ],
                  ),
                ),
                SizedBox(height: 50,),
                InkWell(
                  onTap: (){
                    setState(() {
                      isClick = 1;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.credit_card,color:isClick==1?Colors.white:Colors.white70,size: 30,),
                      SizedBox(width: 10,),
                      Text(
                        'Dashboard',
                        style: TextStyle(color:isClick==1?Colors.white:Colors.white70, fontSize: 22),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      isClick = 2;
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.local_post_office,color:isClick==2?Colors.white:Colors.white70,size: 30,),
                      SizedBox(width: 10,),
                      Text(
                        'Messages',
                        style: TextStyle( color:isClick==2?Colors.white:Colors.white70, fontSize: 22),
                      ),
                     SizedBox(width: 4,),
                     Container(
                       width:10,
                       height: 10,
                       decoration: BoxDecoration(
                        color: Colors.pink,
                       shape: BoxShape.circle
                     ),)
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      isClick = 3;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.home,color:isClick==3?Colors.white:Colors.white70,size: 30,),
                      SizedBox(width: 10,),
                      Text(
                        'Utility Bill',
                        style: TextStyle(color:isClick==3?Colors.white:Colors.white70, fontSize: 22),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      isClick = 4;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.swap_horiz,color:isClick==4?Colors.white:Colors.white70,size: 30,),
                      SizedBox(width: 10,),
                      Text(
                        'Funds Transfer',
                        style: TextStyle(color:isClick==4?Colors.white:Colors.white70, fontSize: 22),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      isClick = 5;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.store,color:isClick==5?Colors.white:Colors.white70,size: 30,),
                      SizedBox(width: 5,),
                      Text(
                        'Branches',
                        style: TextStyle(color:isClick==5?Colors.white:Colors.white70, fontSize: 22),
                      ),
                    ],
                  ),
                ),
                Container(height: 150,),
                Row(
                  children: <Widget>[
                    Icon(Icons.power_settings_new,color: Colors.white70,size: 30,),
                    SizedBox(width: 5,),
                    Text('Log out',style: TextStyle(color: Colors.white70,
                        letterSpacing: 1.5,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DashBoard(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 10,
          color: backgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();
                            isCollapsed = !isCollapsed;
                          });
                        },
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'My Cards',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: CardContain(),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: CardContain(),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: CardContain(),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Transactions',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Icon(
                        Icons.contact_mail,
                        color: Colors.white60,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: screenHeight - 250,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          TimeOfTransaction('Today'),
                          TreansactionsListVeiw('Macbook', 2, Colors.pink),
                          TimeOfTransaction('Yesterday'),
                          TreansactionsListVeiw('Coffee', 3, Color(0xff41CC94)),
                          TimeOfTransaction('Other'),
                          TreansactionsListVeiw('Shopping', 5, Colors.pink),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox TimeOfTransaction(String NameDay) {
    return SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                NameDay,
                style: TextStyle(
                  color: Colors.white54,
                  letterSpacing: 1.4,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ));
  }

  ListView TreansactionsListVeiw(
      String NameTarns, int numOfTrans, Color colorOfMoney) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Material(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            elevation: 10,
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Icon(
                  Icons.remove_circle,
                  color: colorOfMoney,
                  size: 25,
                ),
              ),
              title: Text(
                (index + 1).toString() + '. $NameTarns',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1.2),
              ),
              subtitle: Text(
                'Apple',
                style: TextStyle(
                    color: Colors.white70, fontSize: 14, letterSpacing: 1.2),
              ),
              trailing: Text(
                '-2900 \$',
                style: TextStyle(
                  color: colorOfMoney,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 1.4,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 8,
            color: Colors.transparent,
          );
        },
        itemCount: numOfTrans);
  }

  Container CardContain() {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, bottom:20, right: 10),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Current Balance',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        letterSpacing: 1.2),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$12,432,32',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.3),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Bank',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2),
                  ),
                  Text(
                    'X',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.3),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '**** **** **** 1505',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing:3,
                    fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height:isCollapsed? 15:1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Card Holder',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        letterSpacing: 1.2),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Eslam Fares',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Expires',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        letterSpacing: 1.2),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '05/20',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.blur_circular,
                  color: Colors.white,
                  size: 35,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
