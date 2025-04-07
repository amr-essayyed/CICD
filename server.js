console.log("hi");
console.log("hi");

import express from 'express';

const app = express();

app.use(express.static('public'));

const port = process.env.PORT || 8080;
app.listen(port, ()=> console.log(`listening at http://127.0.0.1:${port}...`));