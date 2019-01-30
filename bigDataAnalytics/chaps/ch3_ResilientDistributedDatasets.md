## Resilient Distributed Dataset (RDD)

Spark's architecture is designed around a data structure called the
Resilient Distributed Dataset (RDD).

RDDs may be considered as specialized collections in the Java sense.
Like a hash map in Java, RDDs can store primitive and object data,
including other lists, and can be stored to disk as serialized object
files.

As a key-value data structure, the RDDs are partitioned according to the
number of distribution targets. You can think of each partition as
representing a sublist from a master list of data. If you are unfamiliar
with HashMap or key-value oriented data structures, consider these like
parallel arrays (associative arrays) with one array used to stored the
index (or key) and the other array used to store the value per the same
index.

Each data set in the RDD may be considered a record, or it might be
another object.

The RDD is immutable. That means that any transformation entails a new
RDD; the original is maintained. And since each node maintains the full
original RDD, the failure of one node means that its RDD partition can
be applied to other nodes. Hence, the notion of “Resilient.”

RDDs accommodate map and reduce operations. The an RDD key can be used
for a search or to accumulate a series of values from worker nodes. 

For reduce operations, Spark has combine functions. Combine functions
include sum, but exclude other that do not correctly evaluate
mathematics after data is aggregated from nodes. 

RDD operations:

- Transformations − create a new RDD from an existing RDD. Ex: map,
filter, groupBy, join

- Action − effect RDD elements and return result to driver. Ex: collect

Here is an example of join:
```
a = sc.parallelize([("goat", 1), ("pig", 3), ("cow", 5)])
b = sc.parallelize([("goat", 2), ("pig", 4), ("cow", 6)])

ab = a.join(b)
ab_here = ab.collect()
print "Set a joined to set b: %s" % (ab_here)
→ ('Set a joined to set b: %s', [('goat', (1, 2)), ('cow', (5, 6)),
('pig', (3, 4))])
```
Important notes regarding these RDDs: 

- Have a key-value structure. 
- Join occurs on common keys. 

Therefore, if the sets have no commond keys, the RDD resulting from a
join will be empty. For example, if we had a third set with only one
common key, observe the join:
```
c = sc.parallelize([("goat", 7), ("lamb", 1), ("chicken", 3)])
a.join(c).collect()        →        [('goat', (1, 7))]
```
Check that the RDD is cached:
```
ab.persist().is_cached       →       True
```
More:


<https://spark.apache.org/docs/latest/api.html>

<https://spark.apache.org/docs/latest/api/java/org/apache/spark/rdd/RDD.html>

### RDD partitioning

Partitioning of RDDs can be done using HashPartitioner or
CustomPartitioner.

HashPartitioner:

- Spark's defaut partitioner
- The key is from Java’s Object.hashcode() method. This will provide
each element of an RDD with a distinct hash if the associated object is
distinct. Objects that are the same will have the same hash (Java
example: `“key”.hashCode().equals(“key”.hashCode()) → true`)

RangePartitioner:

- Creates equally sized partitions on sortable records.
- Initially sorts according key. 

CustomPartitioner:

- Just extend Spark's Partitioner class.

### Python dictionaries versus RDDs

An efficient way to compute modes is using associative-arrays, also
known as dictionaries. Dictionaries are associated (key : value) pairs.
Unlike strings and lists, dictionaries are a group of Python collections
known as non-sequential collections (as opposed to sequential). Like
lists, dictionaries are mutable.

For example:
```
times = {'Owens' : 10.1, 'Smith' : 10.5, 'Franks' : 10.7 }
```
Or a string that concatenates two strings for a string-int pair:
```
>>> prices[“Fall” + “, Boston”] = 21
>>> prices[“Spring” + “, Chicago”] = 23
>>> prices[“Summer” + “, NYC”] = 22
>>> prices[“Fall” + “, Boston”] 
21
```
RDDs, like Python dictionaries, have their own methods. Of particular
note are the methods to get the keys and values. In Python there is the
form dName.keys() and dName.values(). \[equiv in Spark \]

The method items() returns a tuple from a dictionary. Tuples are similar
to lists, but are immutable. They can have various data types.    
```
>>> times.items()
dict_items([('Franks', 10.7), ('Owens', 10.1), ('Smith', 10.5)]) 

>>> times.get("Owens") 
10.1 
```
Suppose there are multiple values in a dictionary having the same key.
Can you devise a way to compute the average of these values? Here is an
example that combines two “associative arrays” with dictionaries. Based
on this example, it may come as no surprise that dictionaries are also
referred to as associative arrays.

```
import decimal 

# some times 
times = [ "Owens:10.1", "Smith:10.5", "Owens:10.8", \
        "Frank:10.7", "Owens:10.2", "Lewis:10.4" ]   

# define some more dictionaries for holding stats 
total = { } 
mode = { }

# useful key and value arrays 
key = [] 
value = [] 

# initialize the keys of the stat dictionaries 

for i in times: 
    pair = i.split(":") 
    key = pair[0] 
    total[key] = 0 
    mode[key] = 0 

for i in times:
    pair = i.split(":")        
    key = pair[0]              
    value = pair[1]              

    total[key] += decimal.Decimal(value)            
    mode[key] = mode[key] + 1 

# output average time for Owens only 
mean = total['Owens'] / mode['Owens'] 
print(mean) 

print "Owen's average time is: %0.2f seconds over %i races." % (mean, mode\['Owens'\])  

→ Owen's average time is: 10.37 and number of races is 3
```
Converting the above program to PySpark, we use map and groupByKey
operations. For example:
```
times = [('Owens',10.1), ('Smith',10.5), ('Owens',10.8), ('Frank',10.7), ('Owens',10.2), ('Lewis',10.4)]

sc.parallelize(times).groupByKey().mapValues(lambda a: sum(a) / len(a)).collect()
→
[('Smith', 10.5), ('Frank', 10.7), ('Lewis', 10.4), ('Owens', 10.36)]
```
As you can see, the PySpark code is brief relative to regular Python.

RDD APIs:

<https://spark.apache.org/docs/latest/api/>

<https://spark.apache.org/docs/latest/rdd-programming-guide.html>
