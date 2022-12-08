const admin = require('firebase-admin');
const functions = require("firebase-functions");
const plusOne = 1;
const minusOne = -1;
const config = functions.config();
admin.initializeApp(config.firebase);

const fireStore = admin.firestore();
//cloudfunctionsはrulesを無視することができる

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

exports.onPostLikeCreate = functions.firestore.document('users/{uid}/posts/{postId}/postLikes/{activeUid}').onCreate(
  async (snap,_) => {
    const newValue = snap.data();
    await newValue.postRef.update({
      "likeCount": admin.firestore.FieldValue.increment(plusOne),
    });
  }
);

exports.onPostLikeDelete = functions.firestore.document('users/{uid}/posts/{postId}/postLikes/{activeUid}').onDelete(
  async (snap,_) => {
    const newValue = snap.data();
    await newValue.postRef.update({
      "likeCount": admin.firestore.FieldValue.increment(minusOne),
    });
  }
);

exports.onPostCommentLikeCreate = functions.firestore.document('users/{uid}/posts/{postId}/postComments/{id}/postCommentLikes/{activeUid}').onCreate(
  async (snap,_) => {
    const newValue = snap.data();
    await newValue.postCommentRef.update({
      "likeCount": admin.firestore.FieldValue.increment(plusOne),
    });
  }
);

exports.onPostCommentLikeDelete = functions.firestore.document('users/{uid}/posts/{postId}/postComments/{id}/postCommentLikes/{activeUid}').onDelete(
  async (snap,_) => {
    const newValue = snap.data();
    await newValue.postCommentRef.update({
      "likeCount": admin.firestore.FieldValue.increment(minusOne),
    });
  }
);

exports.onPostCommentCreate = functions.firestore.document('users/{uid}/posts/{postId}/postComments/{id}').onCreate(
  async (snap,_) => {
    const newValue = snap.data();
    await newValue.postRef.update({
      "postCommentCount": admin.firestore.FieldValue.increment(plusOne),
    });
  }
);

exports.onPostCommentDelete = functions.firestore.document('users/{uid}/posts/{postId}/postComments/{id}').onDelete(
  async (snap,_) => {
    const newValue = snap.data();
    await newValue.postRef.update({
      "postCommentCount": admin.firestore.FieldValue.increment(minusOne),
    });
  }
);

exports.onPostCommentReplyLikeCreate = functions.firestore.document('users/{uid}/posts/{postId}/postComments/{postCommentId}/postCommentReplies/{postCommentReplyId}/postCommentReplyLikes/{activeUid}').onCreate(
  async (snap,_) => {
    //リプライのlikeCountを増やしたい
    const newValue = snap.data();
    await newValue.postCommentReplyRef.update({
      "likeCount": admin.firestore.FieldValue.increment(plusOne),
    });
  }
);

exports.onPostCommentReplyLikeDelete = functions.firestore.document('users/{uid}/posts/{postId}/postComments/{postCommentId}/postCommentReplies/{postCommentReplyId}/postCommentReplyLikes/{activeUid}').onDelete(
  async (snap,_) => {
    //リプライのlikeCountを減らしたい
    const newValue = snap.data();
    await newValue.postCommentReplyRef.update({
      "likeCount": admin.firestore.FieldValue.increment(minusOne),
    });
  }
);

exports.onPostCommentReplyCreate = functions.firestore.document('users/{uid}/posts/{postId}/postComments/{postCommentId}/postCommentReplies/{postCommentReplyId}').onCreate(
  async (snap,_) => {
    //コメントのpostCommentReplyCountを増やしたい
    const newValue = snap.data();
    await newValue.postCommentRef.update({
      "postCommentReplyCount": admin.firestore.FieldValue.increment(plusOne),
    });
  }
);

exports.onPostCommentReplyDelete = functions.firestore.document('users/{uid}/posts/{postId}/postComments/{postCommentId}/postCommentReplies/{postCommentReplyId}').onDelete(
  async (snap,_) => {
    //コメントのpostCommentReplyCountを減らしたい
    const newValue = snap.data();
    await newValue.postCommentRef.update({
      "postCommentReplyCount": admin.firestore.FieldValue.increment(minusOne),
    });
  }
);