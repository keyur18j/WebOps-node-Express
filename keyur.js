const express = require("express")

quotes = ['That\'s one small step for a man, a giant leap for mankind',
'The love of money is the root of all evil',
'The only thing we have to fear is fear itself',
'The truth will set you free.',
'A rose by any other name would smell as sweet.', 
'All that glitters is not gold.', 
'All the world’s a stage, and all the men and women merely players.', 
'Ask not what your country can do for you; ask what you can do for your country.', 
'Eighty percent of success is showing up.', 
'For those to whom much is given, much is required.']



const app = express();

PORT = 3001;
app.get("/get-quote",async(req,res)=>{
    let x = Math.floor((Math.random() * 10) + 1);
    res.send(quotes[x]);
})

app.listen(PORT, () => {
    console.log(`Server is running on port localhost:${PORT}`);
  });