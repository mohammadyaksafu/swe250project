const express =require('express');
const mongoose =require('mongoose');
const userRoute=require("./routes/users.route");

const app=express();

mongoose.connect("mongodb+srv://mohammadyaksafu:o0c4RfdtLP5MXMhO@cluster0.udj0g.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0");

const connection_status = mongoose.connection;

connection_status.once("open", () => {
        console.log("MongoDB is Connected");
    });
const PORT =process.env.port || 5000;



app.route("/").get((req,res)=>res.json("Your first api"));

app.listen(PORT,()=>
    console.log(`Your Port is running on ${PORT}`)
);