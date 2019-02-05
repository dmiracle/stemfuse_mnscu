## Graph traversal

  - Traversal begins with any vertex – the "origin" vertex
  - Visiting a vertex in a graph does not entail processing its data.
  - Only vertices that are connected can be traversed. 
  - Methods include Depth First Search and Breadth First Search

Depth first search and breadth first search methods:

  - Find all neighbors of a vertex.
  - Find all paths between an origin and destination vertex.

Depth first search (DFS): Visit a neighbor of the origin, a neighbor of
the neighbor, and so on, advancing as far as possible from the origin.
Then go back to the first neighbor and repeat this procedure from there,
traversing to unvisited neighbors. Sometimes a stack data structure is
used to ensure that each path of neighbors is traversed in reverse to
get back to the origin. DFS is also used for a topological sort (see
below).

In Python, we have the following depth first and breadth first search
functions, as popularized by Guido van Rossum, the creator of Python
(<https://www.python.org/doc/essays/graphs.html> … link is now defunct).

A recursive DFS algorithm:
```python
def dfs(graph, start, path=[]):
  path += [start]
  for vertex in graph[start]:
    if not vertex in path:
      path = dfs(graph, vertex, path)

  return path
```

An iterative DFS algorithm:

```python
def dfs(graph, start, path=[]):
  front = [start]

  while front:
    vertex = front.pop(0)

    if vertex not in path: # versus bfs... if not vertex in path
      path += [vertex]
      front += graph[vertex]

return path
```

The aforementioned algorithms can be tested on a graph of the following
adjacency list form:
```
graph = {
  'A': ['B', 'C'], 
  'B': ['D', 'E'],
  'C': ['E'], 
  'D': ['F'], 
  'E': ['F'],
  'F': ['G', 'D'],
  'G': []
}
```
Breadth first search (BFS): Visit each neighbor, then each neighbor's
neighbor, and so on. Sometimes a queue data structure is used to ensure
that no neighbor is visited more than once. DFS can additionally yield
the minimum edge accumulation in a path (shortest path). 

In Python:
```python
def bfs(graph, start, path=[]):
  front = [start]

  while front:
    vertex = front.pop(0)

  if not vertex in path:# versus iterative dfs... if vertex not in path
    path += [vertex]
    front += graph[vertex]

  return path
```

Note how the above algorithm is almost identical to the iterative DFS
function above.

### Shortest path problems

Graph traversal methods for finding the shortest path entail adding up
the connecting edges in the chain of neighbors between the origin vertex
and destination vertex. The solution to an unweighted shortest path
problem will be the path having minimum number of edges.

Recall that edges can be weighted. That is, associated values vary over
some range, such as distance, correlation, or time. A path can represent
a sum of decisions and have an associated cost. A solution will have a
"total distance" or "total cost."

total vertices in shortest path \< n – 1

Some shortest path methods:  

  - Dijkstra's algorithm
  - All pairs (Floyd-Warshall) algorithm
  - Topological ordering
  - Minimum spanning tree

Dijkstra:

  - Set origin distance to 0. 
  - Set all vertex distances to max possible distance.
  - Select unvisited vertex V1 having minimum distance from origin V0.
    (some use a queue)
  - Select unvisited vertex V2 having minimum distance from vertex V1.
  -  . . . Repeat until at destination vertex.

The Dijkstra algorithm exhaustively finds the shortest path between the
origin vertex and every other of the graph's vertices. 

All pairs:

  - Set origin distance to 0. 
  - Set all vertex distances to max possible distance.
  - For every vertex, accumulate the minimum distance to every neighbor.
  - Given distance\[i\]\[j\] == 0 where i and j represent the origin,
    the destination distance depends on specified i,j 

The all-pairs (Floyd-Warshall) method computes the shortest path between
all vertex pairs. The method is relatively straight forward:
```
for (int i = 0; i < n; i++) {
  for (int j = 0; j < n; j++) {
    for (int k = 0; k < n; k++) {
      distance[i][k] = min(distance[i][k], distance[i][j] + distance[j][k]);
    }
  }
}
```
Given a weighted adjacency matrix, using a dictionary of form... 
```
g[1,1] = 2
g[1,3] = 4
g[1,5] = 6
```
In Python we can have:
```python
def all_pairs(g, n):
  dist = {0: g}

  for i in range(1, n + 1):
    dist[i] = {}

    for j in range(1, n + 1):
      for k in range(1, n + 1):
      dist[i][j, k] = min(dist[i - 1][j, k], dist[i - 1][i, j] + dist[i - 1][i, k])

  return dist[n]
```
Topological sort:

For modeling systems wherein there are subsets of required sequence or
dependencies, we can use a topological sort. In the context of a
directed graph, the vertices of subgraphs or paths are queried with
respect to edge weights. Another term for this is "precedence graph." 

Formally, a topological sort of a directed acyclic graph G = (V, E) is a
linear ordering of vertices such that if an edge (u, v) exists in G,
then u is listed before v in the linear sequence.

For the shortest path problem of a weighted acyclic graph G with
vertices V, the topological sort can be used as follows:

- Initialize collections:
  ```
  for i 1 to n of G:
  dist[i] = maxint
  ```
- Initialize the origin vertex:
  ```
  dist[Vo] = 0 . . . the origin vertex
  ```
- Topologically sort all vertices:
  ```
  for every vertex V[i]:
    for every vertex V[j]:
      if(V[j] is adjacent to V[i]):
        if(dist[j] > dist[i] + weight(i, j)):
        dist[j] = dist[i] + weight(i, j) 
  ```
Minimum spanning tree:

A tree is an acyclic graph that is connected. When that tree connects
all vertices in an undirected weighted graph at minimum distance, we
have a minimum spanning tree (MST). 

Formally, given an undirected weighted graph G = (V, E), an MST is the
set T of edges in E that connect all vertices with a minimum total
distance. These edges form a tree because each vertex has only one
parent apart from the root vertex.

MST algorithm:

1.  Rank the graph edges from least to most weight, storing the results
    in list ranked\_edges.
2.  Traverse ranked\_edges, removing those that do not disconnect the
    graph.

Or:

1.  Rank the edges from most to least weight, storing the results in
    list ranked\_edges.
2.  Traverse ranked\_edges, summing the weights of edges that do not
    create a cycle.

Based on the second version of this algorithm, find the MST of a graph
of vertices A, B, C, D, E, and F. 
| | | | | | | | | | |
|--|--|--|--|--|--|--|--|--|--|
|Edges: | B-D | A-E | D-F | B-F | C-E | A-C | A-F | B-E | B-C  |      
|Weight: | 2   |   4   |  5  |  6  |  7    | 8  |   8   |   9  |   9    |      
|Add?  | Yes | Yes |  Yes | No | Yes  | No | Yes |  No | No|

|  | |  |  |  |  | ||||||
|--|--|--|--|--|--|--|-|-|-|-|-|-|
|Edges of MST: | B-D | | A-E | | D-F |  | C-E | | A-F | | 
| Sum of edges:  |  2 |+ | 4 |+ |5  |+ |7 |+ | 8 | == | 26 

### Exercises

For the following tasks, submit tested code and and related output.

Tasks:

1. Devise a function to determine if a graph is strictly a tree.  
2. Given any two random vertices in a connected graph, write a Python
program to compare Dijkstra and MST approaches for computing the
shortest path. See that you get the same results. How doe there
processing times compare? 
3. Write an algorithm to topologically sort a graph. Test your
algorithm on graphs that contain a cycle and those that don't. Compare
the run times and output of these two scenarios. What do you find most
remarkable? 
4. Euler theorized that the "Eulerian graph" exists if and only if each
vertex has an even numbered degree. Write a Python program to prove
Euler correct, or not.

### Traveling salesman problem (summation of paths)

Consider a cyclic and connected graph that permits every node to be
visited at least once. Such a graph is also called a "Hamiltonian
circuit." Unlike a Eulerian circuit, which must traverse each edge
exactly once (and can repeat vertex visits), the Hamiltonian circuit
must visit each vertex exactly once (and can re-traverse edges). 

Like a Hamiltonian circuit, the traveling salesman problem entails a
visit to locations. The challenge is to determine the path that
minimizes total distance, for multiple locations. As the number of
cities increases, there is a combinatorial explosion in the number of
possible routes. 

Total possible routes (Hamiltonian circuits) in a complete graph having
n vertices:

\[
H = \frac{(n – 1)!}{2}
\]

Solutions put forth in the programming communuity have included the
following techniques:

  - Brute force nearest neighbor assessment
  - Simulated annealing
  - Genetic algorithms
  - Minimum spanning trees
  - Neural networks
  - Implementation of constraints
  - Other exotic and sophisticated methods.

A somewhat naive approach using the nearest neighbor method:

  - For every targeted vertex, compute the distance to each of the other
    targeted vertices
  - For each target vertex, sort the other targeted vertices by distance
  - Move to the nearest target vertice that has not been visited.
  - Repeat, until circuit is complete

TSP makes for an interesting exploration of computation that might suit
a distinct competency module in its own right. Look for working examples
in the Big Data Analytics course module.