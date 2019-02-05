
## Graph quantification and comparison

### Quantification of graphs:

- Total degrees in a graph: 2 * edgeCount
- Density of graph of n vertices: 2 * edgeCount / n * (n - 1)
    - Maximum density is 1, or 100%. 
    - Minimum density is 0 (isolated graph).
- Number of edges in a graph of n vertices:
  - Complete directed graph: n - 1
  - Complete undirected graph: n \* (n - 1) / 2
  - Directed graph: n \* (n – 1)
- Edge weight: may be assigned or computed, as below
- Distance (see shortest path discussion below)

### Edge weight:

A weighted graph gives values to its edges, such as weight, cost, time,
or distance. This is unlike an unweighted graph that represents
relationships simply as true or false, or as 0 or 1. 

It may be the case that weights must be derived by your program. One
method to compute distance is to assign Cartesian (x, y) coordinates to
each vertex and then to compute the sum of distances between each vertex
from the origin and the destination vertex. Between any two vertices in
an XY plane, the distance, or Euclidean distance is:

\[
\left( (x_1 - x_2)^2 + (y_1 - y_2)^2\right)^{1/2}
\]

The advantage of having weights based on Euclidean distance is that it
affords representing graphs beyond two or even three dimensions, such
that the distance between any vertex pairs can be determined as:

\[
\left((x1 - x2)^2 + (y1 - y2)^2 + … + (z1 -
z2)^2 )\right)^{1/2} 
\]

Such coordinates can be useful for highly dimensional factor analytics.

Graph density example:

Using Python, density may be computed as follows. Suppose we have a
graph represent be the following adjacency list G (more about adjacency
lists below):

```python
G = { 
  "a" : ["b", "d"],
  "b" : ["a", "b", "c", "d"],
  "c" : ["a", "b"],
  "d" : ["a", "b"]
}
```

Populate a data structure:
```python
edges = []
for vertex in G:
  for neighbor in G[vertex]:
    if {neighbor, vertex} not in edges:
      edges.append({vertex, neighbor})
```

A density algorithm:
```python
def density(G):
  n = len(G.keys())
  edgeCount = len(G.edges())
  return 2.0 * edgeCount / (n * (n - 1))
```
Comparing of graphs:

  - Equality: same structure, data and order; equal objects are
    identical
  - Identity: same data and order; maybe different structure (identical
    may be equal)
  - Isomorphism: same number of vertices, edges and degrees at each
    level (data irrelevant) 

Two graphs are isomorphic if they can be mapped one-to-one to each other
and preserve the relationships between vertices. These are essentially
the same graphs though they may look different.

Applications of graph comparison include analysis of fingerprints and
social networks.  

Incidentally, a connected undirected graph can be equivalent to a
directed graph if each of the vertex pairs of the former connect by two
directed edges, one going in each direction between nodes.

### Exercise

Write a Python program that generates two undirected graphs G1 and G2,
each with vertices A to Z, and each with randomly connected vertices (no
more than one connection to a pair of vertices). The connection weights
should be random integers from 1 to 10. Determine if G1 and G2 are
equal, identical and isomorphic.

Submit your code and your tested output.
