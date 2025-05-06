// Making the Nodes
// Students
CREATE (s1:student { name:"Ahmed Yar", roll_no:"001", semester: 1 }),
(s2:student { name:"Sameer Talrej", roll_no:"002", semester: 1 }),
(s3:student { name:"Ayaan", roll_no:"003", semester: 1 }),
(s4:student { name:"Azizullah", roll_no:"004", semester: 1 }),
(s5:student { name:"M Khizer", roll_no:"005", semester: 1 });

// Professors
CREATE (p1:professor { name:"Imran Usman", department:"Computer Science" }),
(p2:professor { name:"Zakir Khan", department:"Computer Science" }),
(p3:professor { name:"Adnan Idrees", department:"Computer Science" }),
(p4:professor { name:"Kausar Sultan", department:"Civil Engineering" }),
(p5:professor { name:"Saladin", department:"Civil Engineering" });

// Courses
CREATE (c1:course { title:"Fundamental of Programming", code:"CS101", creditHours:3 }),
(c2:course { title:"Advanced DBMS", code:"CS402", creditHours:3 }),
(c3:course { title:"Data Structure Algorithms", code:"CS202", creditHours:3 }),
(c4:course { title:"Steel Structures", code:"CE305", creditHours:3 }),
(c5:course { title:"Mechanics of Solids", code:"CE203", creditHours:3 });

// Departments
CREATE (d1:department { name:"Computer Science" }),
(d2:department { name:"Civil Engineering" }),
(d3:department { name:"English" }),
(d4:department { name:"Cybersecurity" }),
(d5:department { name:"Artificial Intelligence" });

// Classrooms
CREATE (cr1:classroom { room_no:1, building:"A" }),
(cr2:classroom { room_no:2, building:"A" }),
(cr3:classroom { room_no:3, building:"B" }),
(cr4:classroom { room_no:4, building:"B" }),
(cr5:classroom { room_no:5, building:"C" });

//  * MAKING THE RELATIONSHIPS
// ●	(:Student)-[:ENROLLED_IN]->(:Course)
// Ahmed Yar, Azizullah -> Advanced DBMS
MATCH (s1:student { roll_no:"001" }), (s4:student { roll_no:"004" }), (c2:course { code:"CS402" })
CREATE (s1)-[:ENROLLED_IN]->(c2),
(s4)-[:ENROLLED_IN]->(c2);

// Khizer, Sameer -> DSA
MATCH (s2:student { roll_no:"002" }), (s5:student { roll_no:"005" }), (c3:course { code:"CS202" })
CREATE (s2)-[:ENROLLED_IN]->(c3),
(s5)-[:ENROLLED_IN]->(c3);

// Ahmed, Ayaan -> Steel Structures, FOP
MATCH (s1:student { roll_no:"001" }), (s3:student { roll_no:"003" }),
(c1:course { code:"CS101" }), (c4:course { code:"CE305" })
CREATE (s1)-[:ENROLLED_IN]->(c1),
(s3)-[:ENROLLED_IN]->(c1),
(s1)-[:ENROLLED_IN]->(c4),
(s3)-[:ENROLLED_IN]->(c4);

// Aziz, Khizer -> MOS
MATCH (s4:student { roll_no:"004" }), (s5:student { roll_no:"005" }), (c5:course { code:"CE203" })
CREATE (s4)-[:ENROLLED_IN]->(c5),
(s5)-[:ENROLLED_IN]->(c5);

// Professors teaching their courses
MATCH (p1:professor { name: "Imran Usman" }), (c1:course { code: "CS101" })
CREATE (p1)-[:TEACHES]->(c1);

MATCH (p2:professor { name: "Zakir Khan" }), (c2:course { code: "CS402" })
CREATE (p2)-[:TEACHES]->(c2);

MATCH (p3:professor { name: "Adnan Idrees" }), (c3:course { code: "CS202" })
CREATE (p3)-[:TEACHES]->(c3);

MATCH (p4:professor { name: "Kausar Sultan" }), (c4:course { code: "CE305" })
CREATE (p4)-[:TEACHES]->(c4);

MATCH (p5:professor { name: "Saladin" }), (c5:course { code: "CE203" })
CREATE (p5)-[:TEACHES]->(c5);

// Courses belonging to their departments
MATCH (c1:course { code: "CS101" }), (d1:department { name: "Computer Science" })
CREATE (c1)-[:BELONGS_TO]->(d1);

MATCH (c2:course { code: "CS402" }), (d1:department { name: "Computer Science" })
CREATE (c2)-[:BELONGS_TO]->(d1);

MATCH (c3:course { code: "CS202" }), (d1:department { name: "Computer Science" })
CREATE (c3)-[:BELONGS_TO]->(d1);

MATCH (c4:course { code: "CE305" }), (d2:department { name: "Civil Engineering" })
CREATE (c4)-[:BELONGS_TO]->(d2);

MATCH (c5:course { code: "CE203" }), (d2:department { name: "Civil Engineering" })
CREATE (c5)-[:BELONGS_TO]->(d2);

// Scheduling courses in classrooms
MATCH (c1:course { code: "CS101" }), (cr1:classroom { room_no: 1 })
CREATE (c1)-[:SCHEDULED_IN]->(cr1);

MATCH (c2:course { code: "CS402" }), (cr2:classroom { room_no: 2 })
CREATE (c2)-[:SCHEDULED_IN]->(cr2);

MATCH (c3:course { code: "CS202" }), (cr3:classroom { room_no: 3 })
CREATE (c3)-[:SCHEDULED_IN]->(cr3);

MATCH (c4:course { code: "CE305" }), (cr4:classroom { room_no: 4 })
CREATE (c4)-[:SCHEDULED_IN]->(cr4);

MATCH (c5:course { code: "CE203" }), (cr5:classroom { room_no: 5 })
CREATE (c5)-[:SCHEDULED_IN]->(cr5);
