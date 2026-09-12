import 'package:flutter_test/flutter_test.dart';
import 'package:qeyd_app/main.dart';
void main(){testWidgets('Splash opens',(t)async{await t.pumpWidget(const QeydApp());expect(find.text('Qeyd App'),findsOneWidget);expect(find.text('Yüklənir...'),findsOneWidget);});}
