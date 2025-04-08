import express from 'express';
import bodyParser from 'body-parser';
import pg from 'pg';

const app = express();
app.use(bodyParser.json());

const port = 8080;

const client = new pg.Client("postgres://postgres:postgres@localhost:5432/postgres");

app.all("/{*splat}", (req, res) => {
  console.dir(req.method);

  if (req.method === 'POST') {
    console.log('POST request received');
    console.dir(req.body);

    client.query('INSERT INTO values (key, name) VALUES ($1, $2)', [req.body.key, req.body.name]).then(() => {
      console.log('Data inserted successfully');
      res.status(200).send('Data inserted successfully');
    });
  } else {
    res.send('Hello World!');
  }
})

client.connect().then(() => {
  console.log('Connected to the database');
});

app.listen(port, () => {
  console.log(`Example app listening on http://localhost:${port}`)
});