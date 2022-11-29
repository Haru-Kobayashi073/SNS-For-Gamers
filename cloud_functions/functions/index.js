const admin = require('firebase-admin');
const functions = require("firebase-functions");
const plusOne = 1;
const minusOne = -1;
const config = functions.config();
admin.initializeApp(config.firebase);

const fireStore = admin.firestore();

exports.onFollowerCreate = functions.firestore.document('users/{uid}/followers/{followerUid}').onCreate(
  async (snap,_) => {
    const newValue = snap.data();
    await fireStore.collection('users').doc(newValue.followedUid).update({
      'followerCount': admin.firestore.FieldValue.increment(plusOne),
    });
    await fireStore.collection('users').doc(newValue.followerUid).update({
      'followingCount': admin.firestore.FieldValue.increment(plusOne),
    });
  }
);

exports.onFollowerDelete = functions.firestore.document('users/{uid}/followers/{followerUid}').onDelete(
  async (snap,_) => {
    const newValue = snap.data();
    await fireStore.collection('users').doc(newValue.followedUid).update({
      'followerCount': admin.firestore.FieldValue.increment(minusOne),
    });
    await fireStore.collection('users').doc(newValue.followerUid).update({
      'followingCount': admin.firestore.FieldValue.increment(minusOne),
    });
  }
);