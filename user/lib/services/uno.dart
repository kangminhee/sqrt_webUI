import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;

class Come {
  static String baseUrl = "http://112.219.28.28:3000";
  // static const String baseUrl = "http://127.0.0.1:5050";
  static const String subUrl = "return";

  static Future<http.Response> postOrder() async {
    Uri url = Uri.parse('$baseUrl/$subUrl');

    //qrId 받아오기
    var wholeUrl = window.location.href;
    var uri = Uri.parse(wholeUrl);
    var qrId = uri.queryParameters['qr_id'];
    if (qrId != null) {
      // 여기서 qrId 변수를 사용하여 필요한 작업을 수행
      print('qr_id 값: $qrId');
    } else {
      print('qr_id 파라미터가 URL에 없습니다.');
    }
    print("url: $wholeUrl");
    String jsonBody = jsonEncode(
      {
        'qrId': qrId,
      },
    );

    return http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonBody,
    );
  }
}

class Return {
  static String baseUrl = "http://112.219.28.28:3000";
  // static const String baseUrl = "http://127.0.0.1:5050";
  static const String subUrl = "return_return";

  // static const String subUrl = "order";

  static Future<http.Response> postOrder() async {
    Uri url = Uri.parse(baseUrl); //$subUrl');

    //qrId 받아오기
    var wholeUrl = window.location.href;
    var uri = Uri.parse(wholeUrl);
    var qrId = uri.queryParameters['qr_id'];
    if (qrId != null) {
      // 여기서 qrId 변수를 사용하여 필요한 작업을 수행
      print('qr_id 값: $qrId');
    } else {
      print('qr_id 파라미터가 URL에 없습니다.');
    }
    print("url: $wholeUrl");
    String jsonBody = jsonEncode(
      {
        'qrId': qrId,
      },
    );

    return http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonBody,
    );
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

// class forward {
//   static String baseUrl = "http://112.219.28.28:3000";
//   static String subUrl = "move/?movements=F";

//   static gg() async {
//     try {
//       final url = Uri.parse('$baseUrl/$subUrl');
//       http.get(url);
//     } catch (e) {
//       // 네트워크 오류나 기타 예외 처리
//       throw Exception('Error occurred: $e');
//     }
//   }
// }

// class right {
//   static String baseUrl = "http://112.219.28.28:3000";
//   static String subUrl = "move/?movements=R";

//   static gg() async {
//     try {
//       final url = Uri.parse('$baseUrl/$subUrl');
//       http.get(url);
//     } catch (e) {
//       // 네트워크 오류나 기타 예외 처리
//       throw Exception('Error occurred: $e');
//     }
//   }
// }

// //http://112.219.28.28:3000/move/?movements=FRFRFFRFRF
// class left {
//   static String baseUrl = "http://112.219.28.28:3000";
//   static String subUrl = "move/?movements=L";

//   static gg() async {
//     try {
//       final url = Uri.parse('$baseUrl/$subUrl');
//       http.get(url);
//     } catch (e) {
//       // 네트워크 오류나 기타 예외 처리
//       throw Exception('Error occurred: $e');
//     }
//   }
// }

// class stop {
//   static String baseUrl = "http://112.219.28.28:3000";
//   static String subUrl = "stop";

//   static gg() async {
//     try {
//       final url = Uri.parse('$baseUrl/$subUrl');
//       http.get(url);
//     } catch (e) {
//       // 네트워크 오류나 기타 예외 처리
//       throw Exception('Error occurred: $e');
//     }
//   }
// }
