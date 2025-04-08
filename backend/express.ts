import express from 'express';
import bodyParser from 'body-parser';

const app = express();
app.use(bodyParser.json());

const port = 8080;

app.all("/{*splat}", (req, res) => {
  res.send('Hello World!');
  console.dir(req.method);

  if (req.method === 'POST') {
    console.log('POST request received');
    console.dir(req.body);
  }
})

app.listen(port, () => {
  console.log(`Example app listening on http://localhost:${port}`)
});