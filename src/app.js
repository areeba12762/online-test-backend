const express = require("express");
const bodyParser = require("body-parser");
const pool = require("./db");
const PDFDocument = require("pdfkit");

const app = express();
app.use(bodyParser.json());

app.get("/", (req, res) => {
  res.send("Online Test Backend Running");
});

app.listen(3000, () => {
  console.log("Server running on port 3000");
});


app.post("/submit-test", async (req, res) => {
  try {
    const { test_id, candidate_id, score } = req.body;

    // simple pass/fail logic
    const status = score >= 40 ? "PASS" : "FAIL";

    const query = `
      INSERT INTO test_results (test_id, candidate_id, score, status)
      VALUES ($1, $2, $3, $4)
      RETURNING id
    `;

    const result = await pool.query(query, [
      test_id,
      candidate_id,
      score,
      status,
    ]);

    res.json({
      message: "Test result saved successfully",
      resultId: result.rows[0].id,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Database error" });
  }
});




app.get("/result-pdf/:resultId", async (req, res) => {
  try {
    const { resultId } = req.params;

    const query = `
      SELECT 
        c.name,
        c.email,
        t.test_name,
        tr.score,
        tr.status,
        tr.created_at
      FROM test_results tr
      JOIN candidates c ON tr.candidate_id = c.id
      JOIN tests t ON tr.test_id = t.id
      WHERE tr.id = $1
    `;

    const { rows } = await pool.query(query, [resultId]);

    if (rows.length === 0) {
      return res.status(404).json({ message: "Result not found" });
    }

    const result = rows[0];
    const PDFDocument = require("pdfkit");
    const doc = new PDFDocument();

    res.setHeader("Content-Type", "application/pdf");
    res.setHeader(
      "Content-Disposition",
      `attachment; filename=test-result-${resultId}.pdf`
    );

    doc.pipe(res);

    doc.fontSize(18).text("Online Test Result", { align: "center" });
    doc.moveDown();

    doc.fontSize(12);
    doc.text(`Candidate Name: ${result.name}`);
    doc.text(`Email: ${result.email}`);
    doc.text(`Test Name: ${result.test_name}`);
    doc.text(`Score: ${result.score}`);
    doc.text(`Status: ${result.status}`);
    doc.text(`Date: ${result.created_at}`);

    doc.end();
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "PDF generation failed" });
  }
});

