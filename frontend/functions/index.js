const functions = require('firebase-functions');
const nuxtServer = require('./nuxt-server');
const express = require('express');
const app = express();
const cors = require('cors')({origin: true});
app.use(cors);

exports.nuxtServer = functions.https.onRequest(nuxtServer)

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//