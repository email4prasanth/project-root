const express = require('express');
// const { Client } = require('pg');
const app = express();
const port = 3000;

// // PostgreSQL client configuration
// const client = new Client({
//   host: 'postgres', // Matches the service name in docker-compose.yml
//   user: 'postgres',
//   password: 'password',
//   database: 'testdb'
// });

// // Function to connect to PostgreSQL with retry logic
// const connectWithRetry = async () => {
//   try {
//     await client.connect();
//     console.log('Connected to PostgreSQL');
//   } catch (err) {
//     console.error('Connection error, retrying in 5 seconds...', err.stack);
//     setTimeout(connectWithRetry, 5000); // Retry after 5 seconds
//   }
// };

// // Start the connection attempt
// connectWithRetry();

// Route to handle the root endpoint
app.get('/', async (req, res) => {
  try {
    const result = await client.query('SELECT NOW()');
    res.send(`Hello from Backend! Database time: ${result.rows[0].now}`);
  } catch (err) {
    console.error('Database query error', err.stack);
    res.status(500).send('Internal Server Error');
  }
});

// Start the Express server
app.listen(port, () => {
  console.log(`Backend running on port ${port}`);
});