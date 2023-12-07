import 'package:http/http.dart' as http;

class forward {
  static String baseUrl = "http://112.219.28.28:3000";
  static String subUrl = "move/?movements=F";

  static gg() async {
    try {
      final url = Uri.parse('$baseUrl/$subUrl');
      http.get(url);
    } catch (e) {
      // 네트워크 오류나 기타 예외 처리
      throw Exception('Error occurred: $e');
    }
  }
}

class right {
  static String baseUrl = "http://112.219.28.28:3000";
  static String subUrl = "move/?movements=R";

  static gg() async {
    try {
      final url = Uri.parse('$baseUrl/$subUrl');
      http.get(url);
    } catch (e) {
      // 네트워크 오류나 기타 예외 처리
      throw Exception('Error occurred: $e');
    }
  }
}

//http://112.219.28.28:3000/move/?movements=FRFRFFRFRF
class left {
  static String baseUrl = "http://112.219.28.28:3000";
  static String subUrl = "move/?movements=L";

  static gg() async {
    try {
      final url = Uri.parse('$baseUrl/$subUrl');
      http.get(url);
    } catch (e) {
      // 네트워크 오류나 기타 예외 처리
      throw Exception('Error occurred: $e');
    }
  }
}

class stop {
  static String baseUrl = "http://112.219.28.28:3000";
  static String subUrl = "stop";

  static gg() async {
    try {
      final url = Uri.parse('$baseUrl/$subUrl');
      http.get(url);
    } catch (e) {
      // 네트워크 오류나 기타 예외 처리
      throw Exception('Error occurred: $e');
    }
  }
}

// class Post {
//   static String baseUrl = "http://112.219.28.28:3000";
//   static String subUrl = "user";

//   static gg() async {
//     try {
//       final url = Uri.parse('$baseUrl/$subUrl');
//       http.post(url{});
//     } catch (e) {
//       // 네트워크 오류나 기타 예외 처리
//       throw Exception('Error occurred: $e');
//     }
//   }
// }
