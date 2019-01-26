# README

Turn out some codeblocks with pandoc md -> html
```sql
CREATE TABLE courses(
    courseId INT PRIMARY KEY NOT NULL,
    courseName CHAR(9) NOT NULL,
    courseFee REAL NOT NULL,
    maximumLimit INT NOT NULL,
    enrollment BOOLEAN
);

```
```sql
CREATE TABLE courses (
    courseId INT NOT NULL AUTO_INCREMENT,
    courseName CHAR(9) NOT NULL,
    courseFee FLOAT(20) NOT NULL,
    maximumLimit INTEGER(20) NOT NULL,
    enrollment BOOLEAN NOT NULL,
    PRIMARY KEY (courseId),
    UNIQUE INDEX courseName (courseName)
);

```
pandoc README.md -o readme.html