# Overview

The problem, or What is Big Data?

One definition of Big Data, according to Jack Pope: *when the value of
your data needs exceeds the value of your local processing resources.*

By this definition, Big Data processing cannot take place on a single
machine. Instead, many machines, a “cluster,” must be used in tandem.
These machines can be local or virtual machines in the cloud.

For our big data analytics in this course module we will emphasize
Apache Spark. Spark makes for distributed in-memory computing and can
write to local as well as networked file systems. A distributed file
system called the Hadoop Distributed File System (HDFS) is typically
installed with Apache Spark in the enterprise. We will not use HDFS in
this module. 

Spark essentially allows us to process large data sets faster by
employing more than one machine. Spark also easily integrates with
popular programming languages, databases and other tools for ensuring
high availability.

A few points of information need to be made to distinguish Big Data
Systems from Big Data Analytics.  Big Data Systems are platforms. Before
installing and configuring a Big Data System, the analytical problem
should be understood. This is because a lot of effort and time can go
into building a particular Big Data System that is not suitable for the
problem, and sometimes we just don't need a sledgehammer to drive a
tack. We cover Big Data Systems in another course module. 

Big Data Analytics deals with the commands and logic that we can employ,
often in the form of a functional programming language, to extract
intelligence from large data sets. The analytics yielded may be in text
of graphical format. 

We are using PySpark (Python) for programming applications for a Spark
cluster. PySpark is included in the installation of Apache Spark 2.3.1
and it works with GraphX, MLlib and Spark SQL libraries that come with
Apache Spark. You must separately install Python (version 2). Please see
“installation and configuration” in the Big Data Systems module.

PySpark is part of the Spark Core library in Apache Spark. 

Spark libraries include:

- Spark Core – provides task distributions, scheduling, basic I/O, and
    an API for Java, Python, Scala and R.
- Spark SQL – relies on JDBC and treats tables as RDDs so that queries
    are Spark operations.
- MLlib (deprecated to ML) – machine learning algorithms.
- GraphX – graph algorithms.
- Spark Streaming – real-time stream data processing.
