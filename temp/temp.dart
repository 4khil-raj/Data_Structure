import 'dart:collection';

class Graph {
  HashMap<int, List<int>> graph = HashMap();
  void insert(int vertex, int edge, bool isBidirectional) {
    if (!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }
    if (!graph.containsKey(edge)) {
      graph[edge] = [];
    }
    graph[vertex]!.add(edge);
    if (isBidirectional) {
      graph[edge]!.add(vertex);
    }
  }

  void dfsTraversal(int startVertex) {
    Set<int> visited = Set();
    void dfsRecursive(int currentVertex) {
      print(currentVertex);
      visited.add(currentVertex);
      List<int>? neighbor = graph[currentVertex];
      if (neighbor != null) {
        for (int n in neighbor) {
          if (!visited.contains(n)) {
            dfsRecursive(n);
          }
        }
      }
    }

    dfsRecursive(startVertex);
    graph.keys.forEach((element) {
      if (!visited.contains(element)) {
        dfsRecursive(element);
      }
    });
  }

  void bfsTraversal(int startVertex) {
    Queue<int> queue = Queue();
    Set<int> visited = Set();
    queue.add(startVertex);
    visited.add(startVertex);
    while (queue.isNotEmpty) {
      int currentVertex = queue.removeFirst();
      print(currentVertex);
      List<int>? list = graph[currentVertex];
      if (list != null) {
        for (int neighbor in list) {
          if (!visited.contains(neighbor)) {
            queue.add(neighbor);
            visited.add(neighbor);
          }
        }
      }
    }
    graph.keys.forEach((element) {
      if (!visited.contains(element)) {
        print('dsconnectd :$element');
      }
    });
  }

  void remove(int data) {
    if (graph.containsKey(data)) {
      graph.remove(data);
      graph.forEach((key, value) {
        value.remove(data);
      });
    }
  }

  void display() {
    graph.forEach((key, value) {
      print('$key : $value');
    });
  }
}
