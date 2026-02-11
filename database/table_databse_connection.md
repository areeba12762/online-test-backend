***Step 1:Create Database \& Tables (PostgreSQL)***

***Login to PostgreSQL:***

psql -U postgres

**Create Database(sql):**

CREATE DATABASE online\_test;

\\c online\_test

**Create tables**

***Tests table***:

CREATE TABLE tests (

&nbsp; id SERIAL PRIMARY KEY,

&nbsp; test\_name VARCHAR(100),

&nbsp; company\_id INT,

&nbsp; total\_marks INT

);

***Candidates table:***

CREATE TABLE candidates (

&nbsp; id SERIAL PRIMARY KEY,

&nbsp; name VARCHAR(100),

&nbsp; email VARCHAR(100)

);

***Test results table:***

CREATE TABLE test\_results (

&nbsp; id SERIAL PRIMARY KEY,

&nbsp; test\_id INT REFERENCES tests(id),

&nbsp; candidate\_id INT REFERENCES candidates(id),

&nbsp; score INT,

&nbsp; status VARCHAR(20),

&nbsp; created\_at TIMESTAMP DEFAULT CURRENT\_TIMESTAMP

);



***Step 2:Install Required Node Packages***

npm init -y

npm install express pg body-parser pdfkit



***Step 3:Create PostgreSQL DB Connection (db.js)***

const { Pool } = require("pg");



const pool = new Pool({

&nbsp; user: "postgres",

&nbsp; host: "localhost",

&nbsp; database: "online\_test",

&nbsp; password: "password",

&nbsp; port: 5432,

});



module.exports = pool;



Create Express Server (app.js):

const express = require("express");

const bodyParser = require("body-parser");

const pool = require("./db");

const PDFDocument = require("pdfkit");



const app = express();

app.use(bodyParser.json());



app.get("/", (req, res) => {

&nbsp; res.send("Server is running");

});



app.listen(3000, () => {

&nbsp; console.log("Server running on port 3000");

});



***Step 4:Run the Server***

***Start server:***

**node src/app.js**

**Output:Server running on port 3000**

**Add POST API in app.js**



Open src/app.js and ADD this code below your existing app.get("/"):

app.post("/submit-test", async (req, res) => {

&nbsp; try {

&nbsp;   const { test\_id, candidate\_id, score } = req.body;



&nbsp;   // simple pass/fail logic

&nbsp;   const status = score >= 40 ? "PASS" : "FAIL";



&nbsp;   const query = `

&nbsp;     INSERT INTO test\_results (test\_id, candidate\_id, score, status)

&nbsp;     VALUES ($1, $2, $3, $4)

&nbsp;     RETURNING id

&nbsp;   `;



&nbsp;   const result = await pool.query(query, \[

&nbsp;     test\_id,

&nbsp;     candidate\_id,

&nbsp;     score,

&nbsp;     status,

&nbsp;   ]);



&nbsp;   res.json({

&nbsp;     message: "Test result saved successfully",

&nbsp;     resultId: result.rows\[0].id,

&nbsp;   });

&nbsp; } catch (error) {

&nbsp;   console.error(error);

&nbsp;   res.status(500).json({ error: "Database error" });

&nbsp; }

});

**Restart the Server:node src/app.js**

**Go to PostgreSQL (psql):**

**\\c online\_test**

**Check existing tests:**

SELECT \* FROM tests;

**Insert a test:**

INSERT INTO tests (test\_name, company\_id, total\_marks)

VALUES ('xyz', 1, 100);

**Check candidates:**

SELECT \* FROM candidates;

If empty:



INSERT INTO candidates (name, email)

VALUES ('xyz', 'xyzz@gmail.com');

**Verify IDs:**

SELECT id FROM tests;

SELECT id FROM candidates;

**Call API:**

curl -X POST http://localhost:3000/submit-test ^

-H "Content-Type: application/json" ^

-d "{\\"test\_id\\":1,\\"candidate\_id\\":1,\\"score\\":75}"

**Generate PDF from Saved Test Result:**

**Add PDF API in app.js**



**Open src/app.js and ADD this BELOW /submit-test API:**

app.get("/result-pdf/:resultId", async (req, res) => {

&nbsp; try {

&nbsp;   const { resultId } = req.params;



&nbsp;   const query = `

&nbsp;     SELECT 

&nbsp;       c.name,

&nbsp;       c.email,

&nbsp;       t.test\_name,

&nbsp;       tr.score,

&nbsp;       tr.status,

&nbsp;       tr.created\_at

&nbsp;     FROM test\_results tr

&nbsp;     JOIN candidates c ON tr.candidate\_id = c.id

&nbsp;     JOIN tests t ON tr.test\_id = t.id

&nbsp;     WHERE tr.id = $1

&nbsp;   `;



&nbsp;   const { rows } = await pool.query(query, \[resultId]);



&nbsp;   if (rows.length === 0) {

&nbsp;     return res.status(404).json({ message: "Result not found" });

&nbsp;   }



&nbsp;   const result = rows\[0];

&nbsp;   const PDFDocument = require("pdfkit");

&nbsp;   const doc = new PDFDocument();



&nbsp;   res.setHeader("Content-Type", "application/pdf");

&nbsp;   res.setHeader(

&nbsp;     "Content-Disposition",

&nbsp;     `attachment; filename=test-result-${resultId}.pdf`

&nbsp;   );



&nbsp;   doc.pipe(res);



&nbsp;   doc.fontSize(18).text("Online Test Result", { align: "center" });

&nbsp;   doc.moveDown();



&nbsp;   doc.fontSize(12);

&nbsp;   doc.text(`Candidate Name: ${result.name}`);

&nbsp;   doc.text(`Email: ${result.email}`);

&nbsp;   doc.text(`Test Name: ${result.test\_name}`);

&nbsp;   doc.text(`Score: ${result.score}`);

&nbsp;   doc.text(`Status: ${result.status}`);

&nbsp;   doc.text(`Date: ${result.created\_at}`);



&nbsp;   doc.end();

&nbsp; } catch (err) {

&nbsp;   console.error(err);

&nbsp;   res.status(500).json({ error: "PDF generation failed" });

&nbsp; }

});

**Restart Server**

**Ctrl + C(cmd)**

**node src/app.js**





**Generate PDF (Browser)**



**Open browser and go to:**



**http://localhost:3000/result-pdf/4**













