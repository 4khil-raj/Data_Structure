import 'dart:collection';

class Graph {
  HashMap<int, List<int>> graph = HashMap();
  void insert(int vertex, int edge, bool isBidirect) {
    if (!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }
    graph[vertex]!.add(edge);
    if (isBidirect) {
      graph[edge]?.add(vertex);
    }
  }

  void display() {
    graph.forEach((key, value) {
      print("$key : $value");
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
        print('Disconnected Vertex : $element');
      }
    });
  }

  void dfs(int startVertex) {
    Set<int> visited = Set();

    void dfsRecursive(int currentVertex) {
      print(currentVertex);
      visited.add(currentVertex);

      List<int>? neighbours = graph[currentVertex];
      if (neighbours != null) {
        for (int n in neighbours) {
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
}

void main(List<String> args) {
  Graph g = Graph();
  g.insert(10, 2, true);
  g.insert(2, 4, true);
  g.insert(4, 8, true);
  g.insert(18, 8, false);
  g.insert(23, 4, false);

  g.display();

  // print("");
  // g.dfs(10);
  // g.bfsTraversal(10);
}
