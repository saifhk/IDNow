const express = require('express');
const app = express();
const port = 3000;
var i = 0
app.use(express.json());

const treasureTypes = ['Diamond', 'Silver', 'Gold', 'Bronze','Empty'];

app.get('/startHunt', (req, res) => {
   const randomDelay = Math.floor(Math.random() * (8000 - 3000 + 1) + 3000);
   const randomType = treasureTypes[Math.floor(Math.random() * treasureTypes.length)]; // Random treasure type
   setTimeout(() => {
       i = i + 1
       const treasureResponse = {
           id: Math.floor(Math.random() * 1000), // Random ID
           message: `You found a treasure number ${i}`,
           type: randomType
       };
       res.json(treasureResponse);
   }, randomDelay);
});

app.listen(port, () => {
   console.log(`Server is running on port ${port}`);
});