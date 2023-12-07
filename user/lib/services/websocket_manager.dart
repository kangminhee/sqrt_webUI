// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class WebSocketManager {
//   final channel = WebSocketChannel.connect(
//     Uri.parse('http://112.219.28.28:3000'),
//   );

//   IO.Socket socket = IO.io(
//     'http://112.219.28.28:3000',
//     <String, dynamic>{
//       'transports': ['websocket'],
//       'autoConnect': false,
//     },
//   );

//   void sendMessage() {
//     socket.emit('ping', 'message');
//   }

//   void listMessage() {
//     socket.on(
//       'chat_message',
//       (data) {
//         print(data);
//       },
//     );
//   }
// }
