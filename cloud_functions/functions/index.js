// const { default: algoliasearch } = require('algoliasearch');
// const { firestore } = require('firebase-admin');
// const { user } = require('firebase-functions/v1/auth');


const admin = require('firebase-admin');
const functions = require("firebase-functions");
const plusOne = 1;
const minusOne = -1;
const config = functions.config();
admin.initializeApp(config.firebase);

//algolia
const algoliasearch = require("algoliasearch");//algoliaとデータ同期
const algoliaConfig = config.algolia;
const ALGOLIA_APP_ID = algoliaConfig.app_id;
const ALGOLIA_ADMIN_KEY = algoliaConfig.admin_key;
const ALGOLIA_POSTS_INDEX_NAME = "posts";
const client = algoliasearch(ALGOLIA_APP_ID,ALGOLIA_ADMIN_KEY);

//AWS
const AWS = require("aws-sdk")
const aws_config = config.aws;
const AWS_ACCESS_KEY = aws_config.access_key;
const AWS_SECRET_ACCESS_KEY = aws_config.secret_access_key;
const AWS_REGION = "ap-southeast-1";

//IAM
AWS.config.update({
  accessKeyId: AWS_ACCESS_KEY,
  secretAccessKey: AWS_SECRET_ACCESS_KEY,
  region: AWS_REGION
});

//comprehend
const comprehend = new AWS.Comprehend({apiVersion: "2017-11-27"});

//sendgrid
const sgMail = require("@sendgrid/mail");
const SENDGRID_API_KEY = config.sendgrid.api_key;

const fireStore = admin.firestore();
const batchLimit = 500;
//cloudfunctionsはrulesを無視することができる

function mul100AndRoundingDown(num) {
  const mul100 = num * 100;
  const result = Math.floor(mul100);
  return result;
}

function sendMail(text, subject) {
  //関数を呼び出すたびにAPIKEYをセットする必要がある
  sgMail.setApiKey(SENDGRID_API_KEY);
  const msg = {
    to: 'haru.03002@gmail.com',
    from: 'haru.03002@gmail.com',
    subject: subject,
    text: text,
  };
  sgMail.send(msg).then(
    (ref) => {
      console.log(ref);
    }).catch(e => {
      console.log(e);
    });
}

function sendReport(data, contentType) {
  const stringData = JSON.stringify(data); // Map<String,dynamic> map.toString();
  const result = stringData.replace(/,/g, ",\n"); //,を,改行コードに置き換えしている
  sendMail(result, `${contentType}を報告`);
}

exports.onUserCreate = functions.firestore.document('users/{uid}').onCreate(
  async (snap,_) => {
    const newValue = snap.data();
    const ref = snap.ref
    const text = newValue.userName; //解析したい値
    const dDparams = {
      Text: text,
    };
    //主要な言語のコードを取得
    let lCode = "";
    comprehend.detectDominantLanguage(
      dDparams,
      async (dDerr, dDdata) => {
        if (dDerr) {
          console.log(dDerr);
        } else {
          //dDDataは複数のLanguageCodeを返すため、一番割合の高い値のみを返す
          lCode = dDdata.Languages[0]["LanguageCode"];
          if (lCode) {
            const dSparams = {
              LanguageCode: lCode,
              Text: text,
            };
            comprehend.detectSentiment(
              dSparams,
              async (dSerr, dSdata) => {
                if (dSerr) {
                  console.log(dSerr);
                } else {
                  await ref.update({
                    "userNameLanguageCode": lCode,
                    "userNameNegativeScore":mul100AndRoundingDown(dSdata.SentimentScore.Negative),
                    "userNamePositiveScore": mul100AndRoundingDown(dSdata.SentimentScore.Positive),
                    "userNameSentiment": dSdata.Sentiment,
                  });
                }
              }
              );
          }
        }
      }
      );
  }
);

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

exports.onPostReportCreate = functions.firestore.document('users/{uid}/posts/{postId}/postReports/{postReport}').onCreate(
  async (snap,_) => {
    const newValue = snap.data();
    await newValue.postDocRef.update({
      "reportCount": admin.firestore.FieldValue.increment(plusOne),
    });
    sendReport(newValue, "投稿");
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
    const newValue = snap.data();const ref = snap.ref
    const text = newValue.comment; //解析したい値
    const dDparams = {
      Text: text,
    };
    //主要な言語のコードを取得
    let lCode = "";
    comprehend.detectDominantLanguage(
      dDparams,
      async (dDerr, dDdata) => {
        if (dDerr) {
          console.log(dDerr);
        } else {
          //dDDataは複数のLanguageCodeを返すため、一番割合の高い値のみを返す
          lCode = dDdata.Languages[0]["LanguageCode"];
          if (lCode) {
            const dSparams = {
              LanguageCode: lCode,
              Text: text,
            };
            comprehend.detectSentiment(
              dSparams,
              async (dSerr, dSdata) => {
                if (dSerr) {
                  console.log(dSerr);
                } else {
                  await ref.update({
                    "commentLanguageCode": lCode,
                    "commentNegativeScore":mul100AndRoundingDown(dSdata.SentimentScore.Negative),
                    "commentPositiveScore": mul100AndRoundingDown(dSdata.SentimentScore.Positive),
                    "commentSentiment": dSdata.Sentiment,
                  });
                }
              }
              );
          }
        }
      }
      );
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

exports.onPostMuteCreate = functions.firestore.document('users/{uid}/posts/{postId}/postMutes/{activeUid}').onCreate(
  async (snap,_) => {
    const newValue = snap.data();
    await newValue.postRef.update({
      "muteCount": admin.firestore.FieldValue.increment(plusOne),
    });
  }
);

exports.onPostMuteDelete = functions.firestore.document('users/{uid}/posts/{postId}/postMutes/{activeUid}').onDelete(
  async (snap,_) => {
    const newValue = snap.data();
    await newValue.postRef.update({
      "muteCount": admin.firestore.FieldValue.increment(minusOne),
    });
  }
);

exports.onPostCommentMuteCreate = functions.firestore.document('users/{uid}/posts/{postId}/postComments/{postCommentId}/postCommentMutes/{activeUid}').onCreate(
  async (snap,_) => {
    const newValue = snap.data();
    await newValue.postCommentRef.update({
      "muteCount": admin.firestore.FieldValue.increment(plusOne),
    });
  }
);

exports.onPostCommentMuteDelete = functions.firestore.document('users/{uid}/posts/{postId}/postComments/{postCommentId}/postCommentMutes/{activeUid}').onDelete(
  async (snap,_) => {
    const newValue = snap.data();
    await newValue.postCommentRef.update({
      "muteCount": admin.firestore.FieldValue.increment(minusOne),
    });
  }
);

exports.onPostCommentReplyMuteCreate = functions.firestore.document('users/{uid}/posts/{postId}/postComments/{postCommentId}/postCommentReplies/{postCommentReplyId}/postCommentReplyMutes/{activeUid}').onCreate(
  async (snap,_) => {
    const newValue = snap.data();
    await newValue.postCommentReplyRef.update({
      "muteCount": admin.firestore.FieldValue.increment(plusOne),
    });
  }
);

exports.onPostCommentReplyMuteDelete = functions.firestore.document('users/{uid}/posts/{postId}/postComments/{postCommentId}/postCommentReplies/{postCommentReplyId}/postCommentReplyMutes/{activeUid}').onDelete(
  async (snap,_) => {
    const newValue = snap.data();
    await newValue.postCommentReplyRef.update({
      "muteCount": admin.firestore.FieldValue.increment(minusOne),
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
    const ref = snap.ref
    const text = newValue.reply; //解析したい値
    const dDparams = {
      Text: text,
    };
    //主要な言語のコードを取得
    let lCode = "";
    comprehend.detectDominantLanguage(
      dDparams,
      async (dDerr, dDdata) => {
        if (dDerr) {
          console.log(dDerr);
        } else {
          //dDDataは複数のLanguageCodeを返すため、一番割合の高い値のみを返す
          lCode = dDdata.Languages[0]["LanguageCode"];
          if (lCode) {
            const dSparams = {
              LanguageCode: lCode,
              Text: text,
            };
            comprehend.detectSentiment(
              dSparams,
              async (dSerr, dSdata) => {
                if (dSerr) {
                  console.log(dSerr);
                } else {
                  await ref.update({
                    "replyLanguageCode": lCode,
                    "replyNegativeScore":mul100AndRoundingDown(dSdata.SentimentScore.Negative),
                    "replyPositiveScore": mul100AndRoundingDown(dSdata.SentimentScore.Positive),
                    "replySentiment": dSdata.Sentiment,
                  });
                }
              }
              );
          }
        }
      }
      );
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
    const searchToken = newValue.searchToken;
    const userName = newValue.userName;
    const userImageURL = newValue.userImageURL;
    const introduction = newValue.introduction;
    const now = admin.firestore.Timestamp.now();
    const text = newValue.userName; //解析したい値
    const dDparams = {
      Text: text,
    };
    //主要な言語のコードを取得
    let lCode = "";
    comprehend.detectDominantLanguage(
      dDparams,
      async (dDerr, dDdata) => {
        if (dDerr) {
          console.log(dDerr);
        } else {
          //dDDataは複数のLanguageCodeを返すため、一番割合の高い値のみを返す
          lCode = dDdata.Languages[0]["LanguageCode"];
          if (lCode) {
            const dSparams = {
              LanguageCode: lCode,
              Text: text,
            };
            comprehend.detectSentiment(
              dSparams,
              async (dSerr, dSdata) => {
                if (dSerr) {
                  console.log(dSerr);
                } else {
                  await newValue.userRef.update({
                    "searchToken": searchToken,
                    'userName': userName,
                    "userNameLanguageCode": lCode,
                    "userNameNegativeScore":mul100AndRoundingDown(dSdata.SentimentScore.Negative),
                    "userNamePositiveScore": mul100AndRoundingDown(dSdata.SentimentScore.Positive),
                    "userNameSentiment": dSdata.Sentiment,
                    'userImageURL': userImageURL,
                    'introduction': introduction,
                    //updatedAtは改ざんされないようにcloud Functionsで制限する
                    'updatedAt': now,
                    });
                }
              }
              );
          }
        }
      }
      );
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
      'introduction': introduction,
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
      'introduction': introduction,
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
      'introduction': introduction,
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

exports.onPostCreate = functions.firestore.document('users/{uid}/posts/{postId}').onCreate(
  async (snap,_) => {
    const newValue = snap.data();
    //detectSentiment
    const ref = snap.ref
    const text = newValue.text; //解析したい値
    const dDparams = {
      Text: text,
    };
    //主要な言語のコードを取得
    let lCode = "";
    comprehend.detectDominantLanguage(
      dDparams,
      async (dDerr, dDdata) => {
        if (dDerr) {
          console.log(dDerr);
        } else {
          //dDDataは複数のLanguageCodeを返すため、一番割合の高い値のみを返す
          lCode = dDdata.Languages[0]["LanguageCode"];
          if (lCode) {
            const dSparams = {
              LanguageCode: lCode,
              Text: text,
            };
            comprehend.detectSentiment(
              dSparams,
              async (dSerr, dSdata) => {
                if (dSerr) {
                  console.log(dSerr);
                } else {
                  await ref.update({
                    "textLanguageCode": lCode,
                    "textNegativeScore":mul100AndRoundingDown(dSdata.SentimentScore.Negative),
                    "textPositiveScore": mul100AndRoundingDown(dSdata.SentimentScore.Positive),
                    "textSentiment": dSdata.Sentiment,
                  });
                }
              }
              );
          }
        }
      }
      );
    //algolia
    newValue.objectID = snap.id;//objectIDはalgoliaのID
    const index = client.initIndex(ALGOLIA_POSTS_INDEX_NAME);
    index.saveObject(newValue);
    //myBatchは2回しか使用されない
    //postCountのupdateとtimelineのset
    const myBatch = fireStore.batch();
    const myRef = fireStore.collection("users").doc(newValue.uid);
    myBatch.update(myRef, {
      "postCount": admin.firestore.FieldValue.increment(plusOne),
    });
    const timeline = {
      "createdAt": newValue.createdAt,
      "isRead": false,
      "postCreatorUid": newValue.uid,
      "postId": newValue.postId,
    };
    // 自分のタイムラインんいも自分の投稿をセットする
    myBatch.set(myRef.collection("timelines").doc(newValue.postId), timeline);
    await myBatch.commit();
  }
  );
  
  exports.onPostDelete = functions.firestore.document('users/{uid}/posts/{postId}').onDelete(
  async (snap,_) => {
    const newValue = snap.data();
    const objectID = snap.id;//objectIDはalgoliaのID
    const index = client.initIndex(ALGOLIA_POSTS_INDEX_NAME);
    index.deleteObject(objectID);
    const myRef = fireStore.collection("users").doc(newValue.uid);
    await myRef.update({
      "postCount": admin.firestore.FieldValue.increment(minusOne),
    });
  }
  );
  //   //followersをゲット
  //   const followers = await fireStore.collection("users").doc(newValue.uid).collection("followers").get();
  //   let count = 0;
  //   let batch = fireStore.batch();
  //   for (const follower of followers.docs) {
  //     const data = follower.data();
  //     const ref = fireStore.collection("users").doc(data.followerUid).collection("timelines").doc(newValue.postId);
  //     batch.set(ref, timeline);
  //     count++;
  //     if (count == batchLimit) {
  //       await batch.commit();
  //       batch = fireStore.batch();
  //       count = 0;
  //     }
  //   }
  //   if (count > 0) {
  //     await batch.commit();
  //   }
  // }