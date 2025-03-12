// const express = require('express');
// const app = express();
// const port = 3000;

// app.get('/', (req, res) => {
//   res.send('Hello from Backend!');
// });

// app.listen(port, () => {
//   console.log(`Backend running on port ${port}`);
// });

const express = require('express');
const { Client } = require('pg');
const app = express();
const port = 3000;

const client = new Client({
  host: 'postgres',
  user: 'postgres',
  password: 'password',
  database: 'testdb'
});

client.connect()
  .then(() => console.log('Connected to PostgreSQL'))
  .catch(err => console.error('Connection error', err.stack));

app.get('/', async (req, res) => {
  const result = await client.query('SELECT NOW()');
  res.send(`Hello from Backend! Database time: ${result.rows[0].now}`);
});

app.listen(port, () => {
  console.log(`Backend running on port ${port}`);
});