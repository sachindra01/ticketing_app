import 'dart:developer';
import 'package:dio/dio.dart';

import 'package:ticketing_app/core/dio/dio_client.dart';
import 'package:ticketing_app/model/all_ticket_model.dart';
import 'package:ticketing_app/model/my_ticket_model.dart';

getTicketDetail() async {
  try {
    var response = await dio.get(
      'v1/mobile-support/tickets/all-tickets-details',
    );

    if(response.statusCode == 200) {
       final data = AllTicketModel.fromJson(response.data);
      return data;
    } else {
      return null;
    }
  } on DioError catch (e) {
    log(e.message);
  } catch (e) {
    log(e.toString());
  }
}

getMyTicketDetail(userId) async {
  try {
    var response = await dio.get(
      'v1/mobile-support/tickets/my-tickets-details/$userId',
    );

    if(response.statusCode == 200) {
       final data = MyTicketModel.fromJson(response.data);
      return data;
   
    } else {
      return null;
    }
  } on DioError catch (e) {
    log(e.message);
  } catch (e) {
    log(e.toString());
  }
}