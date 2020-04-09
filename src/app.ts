import bodyParser from 'body-parser';
import express from 'express';

const app = express();
const port = process.env.PORT || 8080;

app.use(bodyParser.json());

// CORS should be restricted.
app.use((req, res, next) => {
  // res.header("Access-Control-Allow-Origin": "http://localhost:8100");
  res.header(
    'Access-Control-Allow-Headers',
    'Origin, X-Requested-With, Content-Type, Accept, Authorization',
  );
  next();
});

app.get('/', (req, res) => {
  res.send('Hello World');
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
