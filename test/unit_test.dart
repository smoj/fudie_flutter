import 'package:flutter_test/flutter_test.dart';
import 'package:fudie_ui_flutter/ui/widgets/title.dart';

void main(){
  final title = UITitle(text: 'Samson',);
  
  group('Basic tests', (){
    test('Should not be null', (){
      expect(title.text, isNot(null));
    });

    test('Should be Samson', (){
      expect(title.text, 'Samson');
    });
  });
}