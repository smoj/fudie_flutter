import 'package:flutter/material.dart';
import 'package:fudie_ui_flutter/shop.dart';
import 'package:provider/provider.dart';
import 'package:fudie_ui_flutter/ui/theme_switch.dart';

class UIExtra extends StatefulWidget {

  final String title;
  final String price;
  final List<Extra> extras;
  final String extraId;
  final bool selected;
  Function(List<Extra>) callback;

  UIExtra({
    @required this.title,
    @required this.price,
    this.callback,
    @required this.extras,
    @required this.extraId,
    @required this.selected
  });

  @override
  _UIExtraState createState() => _UIExtraState();
}

class _UIExtraState extends State<UIExtra> {
  bool selected;
  @override
  void initState(){
    super.initState();
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: (){
//        print('toggle');
//        widget.callback([Extra(name: 'Updated Item', price: 999, selected: true)]);
        int index = widget.extras.indexWhere((extra)=> extra.extraId == widget.extraId);
//        print('extraId index is'+index.toString());
        widget.extras[index].selected = !widget.extras[index].selected;
        widget.callback(widget.extras);
        setState(() {
          if(selected){
            selected = false;
          }
          else{
            selected = true;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? primaryColor : (themeProvider.isLight ? Colors.white : darkThemeElevation8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Extra', style: TextStyle(
                    color: selected ? Colors.white : (themeProvider.isLight ? flatBlack : flatWhite),
                    fontFamily: primaryFont,
                    fontSize: MediaQuery.of(context).size.width * 0.035
                ),),
                Spacer(),
                Icon(selected ? Icons.check : Icons.check_box_outline_blank, color: selected ? Colors.white : (themeProvider.isLight ? flatBlack : flatWhite), size: 15,)
              ],
            ),
            SizedBox(height: 15,),
            Text('${widget.title}', maxLines: 2, style: TextStyle(
                color: selected ? Colors.white : (themeProvider.isLight ? flatBlack : flatWhite),
                fontFamily: primaryFont,
                fontSize: MediaQuery.of(context).size.width * 0.05,
                height: 1
            ),),
            Spacer(),
            Text('${widget.price}', style: TextStyle(
                color: selected ? Colors.white : (themeProvider.isLight ? flatBlack : flatWhite),
                fontFamily: primaryFont,
                fontSize: MediaQuery.of(context).size.width * 0.035
            ),),
          ],
        ),
      ),
    );
  }
}

