const express = require("express");
const app = express();
const { Pool } = require("pg");

const connection = new Pool({
  user: "postgres",
  host: "localhost",
  database: "hotels_cyf_inclass",
  password: "Migracode",
  port: "5432",
});
// app.get("/hotels", (request, response) => {
//     connection.query("select * from hotels", (error, result) => {
//       response.json(result.rows);
//     });
app.get("/customers", (req, res) => {
  connection.query("select * from customers", (error, result) => {
    res.json(result.rows);
  });
});
app.get("/hotels", (req, res) => {
  connection.query("select * from hotels", (error, result) => {
    res.json(result.rows);
  });
});
app.get("/bookings", (req, res) => {
  connection.query("select * from bookings", (error, result) => {
    res.json(result.rows);
  });
});

const port = 5000;
app.listen(port, () =>
  console.log(`Server is listening on ${port}. Ready to accept requests!`)
);
