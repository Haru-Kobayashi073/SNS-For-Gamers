const { firestore } = require('firebase-admin');
const admin = require('firebase-admin');
const functions = require("firebase-functions");
const { user } = require('firebase-functions/v1/auth');
const plusOne = 1;
const minusOne = -1;
const config = functions.config();
admin.initializeApp(config.firebase);

const fireStore = admin.firestore();
const batchLimit = 500;
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

exports.onUserMutesCreate = functions.firestore.document('users/{uid}/userMutes/{activeUid}').onCreate(
  async (snap,_) => {
    const newValue = snap.data();
    await newValue.passiveUserRef.update({
      'muteCount': admin.firestore.FieldValue.increment(plusOne),
    });
  }
);

exports.onUserMutesDelete = functions.firestore.document('users/{uid}/userMutes/{activeUid}').onDelete(
  async (snap,_) => {
    const newValue = snap.data();
    await newValue.passiveUserRef.update({
      'muteCount': admin.firestore.FieldValue.increment(minusOne),
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

exports.onUserUpdateLogCreate = functions.firestore.document('users/{uid}/userUpdateLogs/{userUpdateLogId}').onCreate(
  async (snap,_) => {
    ///newValueにUserUpdateLogの情報が入っている
    const newValue = snap.data();
    const userRef = newValue.userRef;
    const uid = newValue.uid;
    const userName = newValue.userName;
    const userImageURL = newValue.userImageURL;
    const now = admin.firestore.Timestamp.now();
    await newValue.userRef.update({
      'userName': userName,
      'userImageURL': userImageURL,
      //updatedAtは改ざんされないようにcloud Functionsで制限する
      'updatedAt': now,
    });
    // const commentsQshot = await fireStore.collectionGroup('comments').where('uid', '==' uid)
    //複数の投稿をupdateするのでbatchが必要
    const postQshot = await fireStore.collection('users').doc(uid).collection('posts').get();
    //一回のbatchにつき、500回までしか処理できないから
    let postCount = 0;
    let postBatch = fireStore.batch();
    for (const post of postQshot.docs) {
      postBatch.update(post.ref, {
        'userName': userName,
      'userImageURL': userImageURL,
      'updatedAt': now,
      });
      postCount += 1;
      if (postCount == batchLimit) {
        //500行ったらcommit
        await postBatch.commit();
        //batchを新しく取得
        postBatch = fireStore.batch();
      }
    }
    if (postCount > 0) {
      await postBatch.commit();
    }

    //commentの処理
    //collectionGroupを使用し、、fieldで制限する(uidとか)場合は除外が必要
    const commentQshot = await fireStore.collectionGroup('postComments').where('uid', '==', uid).get();
    let commentCount = 0;
    let commentBatch = fireStore.batch();
    for (const comment of commentQshot.docs) {
      commentBatch.update(comment.ref, {
        'userName': userName,
      'userImageURL': userImageURL,
      'updatedAt': now,
      });
      commentCount += 1;
      if (commentCount == batchLimit) {
        //500行ったらcommit
        await commentBatch.commit();
        //batchを新しく取得
        commentBatch = fireStore.batch();
      }
    }
    if (commentCount > 0) {
      await commentBatch.commit();
    }

    //replyの処理
    const replyQshot = await fireStore.collectionGroup('postCommentReplies').where('uid', '==', uid).get();
    let replyCount = 0;
    let replyBatch = fireStore.batch();
    for (const reply of replyQshot.docs) {
      replyBatch.update(reply.ref, {
        'userName': userName,
      'userImageURL': userImageURL,
      'updatedAt': now,
      });
      replyCount += 1;
      if (replyCount == batchLimit) {
        //500行ったらcommit
        await replyBatch.commit();
        //batchを新しく取得
        replyBatch = fireStore.batch();
      }
    }
    if (replyCount > 0) {
      await replyBatch.commit();
    }
  }
);