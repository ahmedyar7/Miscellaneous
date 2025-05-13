// Students
CREATE
(s1:Student { name:"Ahmed Yar", roll_no:"001", semester: "Fall2024" }),
(s2:Student { name:"Sameer Talrej", roll_no:"002", semester: "Fall2024" }),
(s3:Student { name:"Ayaan", roll_no:"003", semester: "Fall2024" }),
(s4:Student { name:"Azizullah", roll_no:"004", semester: "Fall2024" }),
(s5:Student { name:"M Khizer", roll_no:"005", semester: "Fall2024" });

// Professors
CREATE
(p1:Professor { name:"Imran Usman", department:"Computer Science" }),
(p2:Professor { name:"Zakir Khan", department:"Computer Science" }),
(p3:Professor { name:"Adnan Idrees", department:"Computer Science" }),
(p4:Professor { name:"Kausar Sultan", department:"Civil Engineering" }),
(p5:Professor { name:"Saladin", department:"Civil Engineering" });

// Courses
CREATE
(c1:Course { title:"Fundamental of Programming", code:"CS101", creditHours:3, semester: "Fall2024" }),
(c2:Course { title:"Advanced DBMS", code:"CS402", creditHours:3, semester: "Fall2024" }),
(c3:Course { title:"Data Structure Algorithms", code:"CS202", creditHours:3, semester: "Fall2024" }),
(c4:Course { title:"Steel Structures", code:"CE305", creditHours:3, semester: "Fall2024" }),
(c5:Course { title:"Mechanics of Solids", code:"CE203", creditHours:3, semester: "Fall2024" });

// Departments
CREATE
(d1:Department { name:"Computer Science" }),
(d2:Department { name:"Civil Engineering" }),
(d3:Department { name:"English" }),
(d4:Department { name:"Cybersecurity" }),
(d5:Department { name:"Artificial Intelligence" });

// Classrooms
CREATE
(cr1:Classroom { room_no:1, building:"A" }),
(cr2:Classroom { room_no:2, building:"A" }),
(cr3:Classroom { room_no:3, building:"B" }),
(cr4:Classroom { room_no:4, building:"B" }),
(cr5:Classroom { room_no:5, building:"C" });

// ENROLLMENT RELATIONSHIPS
MATCH (s1:Student { roll_no:"001" }), (c1:Course {code:"CS101"})
CREATE (s1)-[:ENROLLED_IN]->(c1);

MATCH (s3:Student { roll_no:"003" }), (c1:Course {code:"CS101"})
CREATE (s3)-[:ENROLLED_IN]->(c1);

MATCH (s1:Student { roll_no:"001" }), (c4:Course {code:"CE305"})
CREATE (s1)-[:ENROLLED_IN]->(c4);

MATCH (s3:Student { roll_no:"003" }), (c4:Course {code:"CE305"})
CREATE (s3)-[:ENROLLED_IN]->(c4);

MATCH (s2:Student { roll_no:"002" }), (c3:Course {code:"CS202"})
CREATE (s2)-[:ENROLLED_IN]->(c3);

MATCH (s5:Student { roll_no:"005" }), (c3:Course {code:"CS202"})
CREATE (s5)-[:ENROLLED_IN]->(c3);

MATCH (s4:Student { roll_no:"004" }), (c2:Course {code:"CS402"})
CREATE (s4)-[:ENROLLED_IN]->(c2);

MATCH (s1:Student { roll_no:"001" }), (c2:Course {code:"CS402"})
CREATE (s1)-[:ENROLLED_IN]->(c2);

MATCH (s4:Student { roll_no:"004" }), (c5:Course {code:"CE203"})
CREATE (s4)-[:ENROLLED_IN]->(c5);

MATCH (s5:Student { roll_no:"005" }), (c5:Course {code:"CE203"})
CREATE (s5)-[:ENROLLED_IN]->(c5);

// TEACHING RELATIONSHIPS
MATCH (p1:Professor { name:"Imran Usman" }), (c1:Course {code:"CS101"})
CREATE (c1)-[:TAUGHT_BY]->(p1);

MATCH (p2:Professor { name:"Zakir Khan" }), (c2:Course {code:"CS402"})
CREATE (c2)-[:TAUGHT_BY]->(p2);

MATCH (p3:Professor { name:"Adnan Idrees" }), (c3:Course {code:"CS202"})
CREATE (c3)-[:TAUGHT_BY]->(p3);

MATCH (p4:Professor { name:"Kausar Sultan" }), (c4:Course {code:"CE305"})
CREATE (c4)-[:TAUGHT_BY]->(p4);

MATCH (p5:Professor { name:"Saladin" }), (c5:Course {code:"CE203"})
CREATE (c5)-[:TAUGHT_BY]->(p5);

// BELONGS_TO RELATIONSHIPS
MATCH (c1:Course { code:"CS101" }), (d1:Department {name:"Computer Science"})
CREATE (c1)-[:BELONGS_TO]->(d1);

MATCH (c2:Course { code:"CS402" }), (d1:Department {name:"Computer Science"})
CREATE (c2)-[:BELONGS_TO]->(d1);

MATCH (c3:Course { code:"CS202" }), (d1:Department {name:"Computer Science"})
CREATE (c3)-[:BELONGS_TO]->(d1);

MATCH (c4:Course { code:"CE305" }), (d2:Department {name:"Civil Engineering"})
CREATE (c4)-[:BELONGS_TO]->(d2);

MATCH (c5:Course { code:"CE203" }), (d2:Department {name:"Civil Engineering"})
CREATE (c5)-[:BELONGS_TO]->(d2);

// SCHEDULED_IN RELATIONSHIPS WITH time_slot
MATCH (c1:Course { code:"CS101" }), (cr1:Classroom {room_no:1})
CREATE (c1)-[:SCHEDULED_IN { time_slot: "MWF-10AM" }]->(cr1);

MATCH (c2:Course { code:"CS402" }), (cr2:Classroom {room_no:2})
CREATE (c2)-[:SCHEDULED_IN { time_slot: "MWF-10AM" }]->(cr2);

MATCH (c3:Course { code:"CS202" }), (cr3:Classroom {room_no:3})
CREATE (c3)-[:SCHEDULED_IN { time_slot: "TTH-11AM" }]->(cr3);

MATCH (c4:Course { code:"CE305" }), (cr4:Classroom {room_no:4})
CREATE (c4)-[:SCHEDULED_IN { time_slot: "TTH-11AM" }]->(cr4);

MATCH (c5:Course { code:"CE203" }), (cr5:Classroom {room_no:5})
CREATE (c5)-[:SCHEDULED_IN { time_slot: "MWF-10AM" }]->(cr5);

// COMPLETED RELATIONSHIPS
MATCH (s1:Student { roll_no:"001" }), (c1:Course {code:"CS101"})
CREATE (s1)-[:COMPLETED { grade: "A" }]->(c1);

MATCH (s2:Student { roll_no:"002" }), (c3:Course {code:"CS202"})
CREATE (s2)-[:COMPLETED { grade: "A" }]->(c3);

MATCH (s4:Student { roll_no:"004" }), (c2:Course {code:"CS402"})
CREATE (s4)-[:COMPLETED { grade: "B" }]->(c2);
