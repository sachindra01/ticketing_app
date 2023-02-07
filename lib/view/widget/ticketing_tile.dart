
import 'package:flutter/material.dart';



class TicketingTile extends StatefulWidget {
  final String imageUrl, name, description,ticketname,ticketNumber;
  final Widget icon;
  final Color backgroundColor;
  final VoidCallback onTap;
  const TicketingTile({super.key, required this.imageUrl, required this.name, required this.description, required this.onTap, required this.icon, required this.backgroundColor, required this.ticketname, required this.ticketNumber});

  @override
  State<TicketingTile> createState() => _TicketingTileState();
}

class _TicketingTileState extends State<TicketingTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 152,
      margin: const EdgeInsets.only( bottom: 40.0, left: 6.0, right: 7.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey
        ),
        borderRadius: BorderRadius.circular(12.0),
        color: widget.backgroundColor,
        boxShadow:const  [
           BoxShadow(
            color: Color.fromARGB(255, 223, 223, 223),
            offset: Offset(0, 5),
            blurRadius: 5
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: InkWell(
          onTap: widget.onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              widget.icon,
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left : 12.0),
                  child: Text(
                    widget.name, 
                    style: const TextStyle(
                      color: Colors.black
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
               Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left : 12.0),
                  child: Text(
                    widget.ticketname, 
                    style: const TextStyle(
                      color: Colors.black
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
               Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left : 12.0),
                  child: Text(
                    widget.ticketNumber, 
                    style: const TextStyle(
                      color: Colors.black
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}