import 'package:get/get.dart';
import 'package:ticketing_app/repo/ticket_repo.dart';

class TicketController extends GetxController{
    RxBool isLoading = false.obs;
    // ignore: non_constant_identifier_names
    List Data =[];
    dynamic datashown ;
    List dayData=[];
    List weekData=[];
    List  monthData=[];
    List  yearData=[];
     List mydayData=[];
    List myweekData=[];
    List  mymonthData=[];
    List  myyearData=[];

   ticketDetail() async {
      try {
      isLoading(true);
     
      var response = await getTicketDetail();
      if(response !=null){
        dayData.add(response.data.dist.day);
        weekData.add(response.data.dist.week);
        monthData.add(response.data.dist.month);
        yearData.add(response.data.dist.year);
        Data.add(response.data);
       return response.data;
       
      } else {
        datashown=response;

      
      }
    } finally {
      isLoading(false);
      update();
    }

  }
  myTicketDetail(userId) async {
      try {
      isLoading(true);
     
      var response = await getMyTicketDetail(userId);
     if(response !=null){
        mydayData.add(response.data.dist.day);
        myweekData.add(response.data.dist.week);
        mymonthData.add(response.data.dist.month);
        myyearData.add(response.data.dist.year);
       return response.data;
      } else {
        datashown=response;
      }
    } finally {
      isLoading(false);
      update();
    }

  }

}