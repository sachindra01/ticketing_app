import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/controller/ticket_controller.dart';
import 'package:ticketing_app/view/widget/ticketing_tile.dart';

class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
final TicketController ticketController = Get.put(TicketController());
  bool isSelected = false;

 

  @override
  void initState() {
    intialiseData();
    super.initState();
  }

  intialiseData(){
    ticketController.ticketDetail();
    ticketController.myTicketDetail('test@gmail.com');
  }

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder(
          init: TicketController(),
          builder: (_) {
            return ticketController.isLoading.value==true
            ?const Center(child: CircularProgressIndicator()):
            SingleChildScrollView(
              child: Column(
              children: <Widget>[
                  _tabSection(context,ticketController.dayData,ticketController.weekData,ticketController.monthData,ticketController.yearData),
                // graphSection(context,ticketController.mydayData,ticketController.myweekData,ticketController.mymonthData,ticketController.myyearData)
              ],
              ),
            );
          }
        )
      );
  }
}

 toggleButton(BuildContext context){
  return ToggleButtons(
    borderColor: Colors.black,
    fillColor: Colors.grey,
    borderWidth: 2,
    selectedBorderColor: Colors.black,
    selectedColor: Colors.white,
    borderRadius: BorderRadius.circular(0),
    onPressed: (int index) {
        
    }, isSelected: const [],
    children: const[
        Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
            'Open 24 Hours',
            style: TextStyle(fontSize: 16),
        ),
        ),
        Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
            'Custom Hours',
            style: TextStyle(fontSize: 16),
        ),
        ),
    ]
    );
            
 }

gridViewSection(dayData){
  return SizedBox(
    child: ListView.builder(
      padding: const EdgeInsets.only(left: 1.8, right: 0.0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: dayData.length,
      shrinkWrap: true,
      itemBuilder: (context, indx) {
        return Wrap(
          children: List.generate(dayData[indx].length, (index) => 
                 TicketingTile(
                  ticketNumber:dayData[indx][index].value,
                  ticketname: dayData[indx][index].label,
                  backgroundColor: Colors.white,
                  description: 'Ticketing',
                  icon: const Icon(Icons.airplane_ticket),
                  imageUrl: '',
                  name: '',
                  onTap: () {
              }
            )
          ),
        );
      }
    ),
  );
}
 
 graphDesign(context){
  
  
    return Column(
      children: [
     
      
      ],
    );
 }


// gridview
Widget _tabSection(context,dayData,weekData,monthData,yearData) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0),
    child: DefaultTabController(
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
                
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
                child: TabBar(
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      7.0,
                    ),
                    color: Colors.white,
                  ),
                  labelColor: const Color(0xff8d6b4f),
                  unselectedLabelColor: const Color(0xff8d6b4f),
                  tabs: const [
                    Tab(
                      text: 'Day',
                      height: 30,
                    ),
                    Tab(
                      text: 'Week',
                      height: 30,
                    ),
                     Tab(
                      text: 'Month',
                      height: 30,
                    ),
                     Tab(
                      text: 'Year',
                      height: 30,
                    ),
                  ],
                ),
              ),
          SizedBox( 
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
             gridViewSection(dayData),
             gridViewSection(weekData),
             gridViewSection(monthData),
             gridViewSection(yearData),
            ]),
          ),
        ],
      ),
    ),
  );
}

Widget graphSection(context,dayData,weekData,monthData,yearData) {
  return Padding(
    padding: const EdgeInsets.only(top: 5.0,left: 10.0,right: 10.0),
    child: DefaultTabController(
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
                height: 45,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
                child: TabBar(
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      7.0,
                    ),
                    color: Colors.white,
                  ),
                  labelColor: const Color(0xff8d6b4f),
                  unselectedLabelColor: const Color(0xff8d6b4f),
                  tabs: const [
                    Tab(
                      text: 'Day',
                      height: 30,
                    ),
                    Tab(
                      text: 'Week',
                      height: 30,
                    ),
                     Tab(
                      text: 'Month',
                      height: 30,
                    ),
                     Tab(
                      text: 'Year',
                      height: 30,
                    ),
                  ],
                ),
              ),
          SizedBox( 
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
             Container(),
             Container(),
             Container(),
             Container(),
            
            ]),
          ),
        ],
      ),
    ),
  );
}
