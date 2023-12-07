import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class GraphView extends StatefulWidget {
  const GraphView({super.key});

  @override
  _GraphViewState createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  final String baseUrl = "http://112.219.28.28:3000";
  late IOWebSocketChannel channel;
  GraphInfo? graphInfo;
  int? robotPosition;

  @override
  void initState() {
    super.initState();
    channel = IOWebSocketChannel.connect("ws://112.219.28.28:3000");
    fetchGraphInfo();
  }

  Future<void> fetchGraphInfo() async {
    final response = await http.get(Uri.parse("$baseUrl/graph"));
    if (response.statusCode == 200) {
      setState(() {
        graphInfo = GraphInfo.fromJson(json.decode(response.body));
        robotPosition = graphInfo!.nodes[4].id; // 예시로 4번 노드 설정
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return graphInfo == null
        ? const Center(child: CircularProgressIndicator())
        : CustomPaint(
            painter: GraphPainter(graphInfo!, robotPosition),
            size: Size.infinite,
          );
  }
}

class GraphPainter extends CustomPainter {
  final GraphInfo graphInfo;
  final int? robotPosition;

  GraphPainter(this.graphInfo, this.robotPosition);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    // Edges
    for (final edge in graphInfo.edges) {
      final firstNode = graphInfo.nodesMap[edge.firstNodeId]!;
      final secondNode = graphInfo.nodesMap[edge.secondNodeId]!;
      canvas.drawLine(
        Offset(firstNode.x, firstNode.y),
        Offset(secondNode.x, secondNode.y),
        paint,
      );
    }

    // Nodes
    for (final node in graphInfo.nodes) {
      paint
        ..color = (robotPosition == node.id) ? Colors.red : Colors.blue
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(node.x, node.y), 10, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GraphInfo {
  final List<Node> nodes;
  final List<Edge> edges;
  Map<int, Node> nodesMap = {};

  GraphInfo({required this.nodes, required this.edges}) {
    for (var node in nodes) {
      nodesMap[node.id] = node;
    }
  }

  factory GraphInfo.fromJson(Map<String, dynamic> json) {
    var nodesJson = json['nodes'] as List;
    var edgesJson = json['edges'] as List;

    List<Node> nodes = nodesJson.map((i) => Node.fromJson(i)).toList();
    List<Edge> edges = edgesJson.map((i) => Edge.fromJson(i)).toList();

    return GraphInfo(nodes: nodes, edges: edges);
  }
}

class Node {
  final int id;
  final String rfid;
  final double x;
  final double y;

  Node(
      {required this.id, required this.rfid, required this.x, required this.y});

  factory Node.fromJson(Map<String, dynamic> json) {
    return Node(
      id: json['id'],
      rfid: json['rfid'],
      x: json['x'].toDouble(),
      y: json['y'].toDouble(),
    );
  }
}

class Edge {
  final int id;
  final int firstNodeId;
  final int secondNodeId;

  Edge(
      {required this.id,
      required this.firstNodeId,
      required this.secondNodeId});

  factory Edge.fromJson(Map<String, dynamic> json) {
    return Edge(
      id: json['id'],
      firstNodeId: json['firstNodeId'],
      secondNodeId: json['secondNodeId'],
    );
  }
}
