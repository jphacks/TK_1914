const functions = require('firebase-functions');
const nuxtServer = require('./nuxt-server');

exports.nuxtServer = functions.https.onRequest(nuxtServer)

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
