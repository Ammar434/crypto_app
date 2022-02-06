const functions = require("firebase-functions");
const admin = require('firebase-admin');
admin.initializeApp();

const ref = admin.database().ref('users/posts');
ref.once('value').then(snap => {
   snap.forEach(ss => {
      ss.ref.transaction(val => (val||0) + 1);
   });
})
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
