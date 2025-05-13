// Scenario 1: Course Conflict Checker
MATCH (c1:Course)-[s1:SCHEDULED_IN { time_slot: slot }]->(room:Classroom),
(c2:Course)-[s2:SCHEDULED_IN { time_slot: slot }]->(room)
WHERE c1 <> c2 AND id(c1) < id(c2)
RETURN DISTINCT c1.title AS course1, c2.title AS course2, room.room_no AS classroom, slot
 ORDER BY room.room_no, slot;

// Scenario 2: Department Load Analysis
MATCH (p:Professor)<-[:TAUGHT_BY]-(c:Course)
WHERE c.semester = "Fall2024"
WITH p, COUNT(c) AS num_courses
WHERE num_courses > 1
RETURN p.name AS professor, num_courses
 ORDER BY num_courses DESC;

// Scenario 3: Identify Overloaded Professors
MATCH (p:Professor { name: "Imran Usman" }), (c:Course {code: "CS202"})
CREATE (c)-[:TAUGHT_BY]->(p);

// Scenario 4: Student Course Network
MATCH (s1:Student)-[:KNOWS]-(s2:Student)
WHERE s1.name < s2.name
RETURN DISTINCT s1.name AS student1, s2.name AS student2
 ORDER BY student1;

// Scenario 5: Classroom Utilization
MATCH (c:Course)-[:SCHEDULED_IN]->(room:Classroom)
RETURN room.room_no AS classroom, COUNT(c) AS course_count
 ORDER BY classroom;

MATCH (c:Course)-[:SCHEDULED_IN]->(room:Classroom)
WITH room, COUNT(c) AS course_count
WHERE course_count < 2
RETURN room.room_no AS classroom, course_count;

// Scenario 6: Multi-department Courses
// First, make CS101 belong to both departments
MATCH (c:Course { code: "CS101" }), (d:Department {name: "Civil Engineering"})
CREATE (c)-[:BELONGS_TO]->(d);

// Now query multi-department courses
MATCH (c:Course)<-[:BELONGS_TO]-(d:Department)
WITH c, COLLECT(d.name) AS departments
WHERE SIZE(departments) > 1
RETURN c.title AS course_title, departments;

// Scenario 7: Course Completion Mapping
MATCH (s:Student)-[r:COMPLETED { grade: "A" }]->(c:Course)
RETURN s.name AS student, c.title AS course;

// Scenario 8: Recommend Elective Courses
MATCH (s:Student { name: "Ahmed Yar" })-[:ENROLLED_IN]->(c:Course)-[:BELONGS_TO]->(d:Department)
WITH s, d
MATCH (d)<-[:BELONGS_TO]-(elective:Course)
WHERE NOT (s)-[:ENROLLED_IN]->(elective)
WITH elective, s
MATCH (elective)-[:TAUGHT_BY]->(p:Professor)
WHERE NOT (s)-[:KNOWS]-(p)
RETURN DISTINCT elective.title AS recommended_course, p.name AS professor;
