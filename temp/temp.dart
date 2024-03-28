import 'dart:collection';

class Graphrevice {
  HashMap<int, List<int>> graph = HashMap();
  void insert(int vertex, int edge, bool isBidirection) {
    if (!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }
    if (!graph.containsKey(edge)) {
      graph[edge] = [];
    }
    graph[vertex]!.add(edge);
    if (isBidirection) {
      graph[vertex]!.add(edge);
    }
  }
}
