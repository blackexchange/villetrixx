import 'package:get/get.dart';
import '../pages/pages.dart';
import '../constants/matrix.dart';

class ResultController extends GetxController {
  int feat = 99;
  int und = 99;

  RxList p = RxList();
  RxList q = RxList();
  RxList notResult = RxList();

  List principleList = [];
  List principleListA = [];

  String? txtFeature;
  String? txtUndesired;

  ResultController() {
    _addList();
  }

  void getResult() {
    var sol = solutions[und]![feat];
    var arrSol = sol.split(",").map((e) => principles[int.parse(e)]).toList();
  }

  List questions = Matrix.questions;
  List questionsFeature = Matrix.questions;

  var principles = Matrix.principles;

  var solutions = Matrix.data;
  var solutionsA = Matrix.solutionsA;
  var solutionsB = Matrix.solutionsB;
  var solutionsC = Matrix.solutionsC;

  void onChangeSearch(String search) {
    if (search.trim().isEmpty) {
      p = RxList.from(Matrix.questions);
    } else {
      p.clear();
      p = _filter(search.trim());
    }
  }

  void onChangeSearchFeat(String search) {
    if (search.trim().isEmpty) {
      q = RxList.from(Matrix.questions);
    } else {
      q.clear();
      q = _filter(search.trim());
    }
  }

  void _addList() {
    p = RxList.from(Matrix.questions);
    q = RxList.from(Matrix.questions);
  }

  RxList _filter(String search) {
    RxList filtered = RxList.from(Matrix.questions);

    filtered.retainWhere(
        (element) => element.toUpperCase().contains(search.toUpperCase()));
    return filtered;
  }

  goToFeature(String undesired) {
    notResult.clear();
    und = questions.indexWhere((e) => e == undesired);
    txtUndesired = questions[und];
    var index = 0;
    questions.forEach((element) {
      if (solutions[und]![index].isEmpty || und == index) {
        notResult.add(index);
      }
      index++;
    });
  }

  goToResult(String feature) {
    feat = questions.indexWhere((e) => e == feature);

    //   feat = feature;
    txtFeature = questionsFeature[feat];
    var sol = solutions[und]![feat];
    var arrSol = sol.split(",");
    principleList = arrSol.map((e) {
      if (!e.isEmpty && e != "+") {
        var id = int.parse(e.trim());
        principleListA.add(
            solutionsA[id] + "\n\n" + solutionsB[id] + "\n\n" + solutionsC[id]);

        return (principles[id]);
      }
    }).toList();

    Get.to(() => ResultPage());
  }

  goToUndesired() => Get.to(() => UndesiredPage());
}
