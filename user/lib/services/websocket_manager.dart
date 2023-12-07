// import 'package:web_socket_channel/web_socket_channel.dart';

// class WebSocketManager {
//   final channel = WebSocketChannel.connect(
//     Uri.parse('http://112.219.28.28:3000'),
//   );

//   // 메시지 수신 및 처리
//   void listenToMessages(Function(String) onMessageReceived) {
//     channel.stream.listen(
//       onMessageReceived:, 
//       onError: (error) {
//         // 에러 처리
//         print('웹소켓 에러: $error');
//       },
//     );
//   }

//   // 메시지 전송
//   void sendMessage(String message) {
//     channel.sink.add(message);
//   }

//   // 연결 종료 메서드
//   void dispose() {
//     channel.sink.close();
//   }

//   // 여기에 다른 웹소켓 관련 메서드 추가
// }
