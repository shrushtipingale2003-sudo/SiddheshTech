

use social_media


db.users.insertMany([
{
  _id: 1,
  username: "amit",
  email: "amit@gmail.com",
  followers: [2,3,4],
  following: [2],
  createdAt: new Date("2024-01-10")
},
{
  _id: 2,
  username: "riya",
  email: "riya@gmail.com",
  followers: [1],
  following: [1,3],
  createdAt: new Date("2024-02-15")
},
{
  _id: 3,
  username: "karan",
  email: "karan@gmail.com",
  followers: [1,2],
  following: [],
  createdAt: new Date("2024-03-20")
}
]);



db.posts.insertMany([
{
  _id: 101,
  user_id: 1,
  content: "My first post!",
  createdAt: new Date("2024-06-01"),
  likes: [
    { user_id: 2 },
    { user_id: 3 }
  ],
  comments: [
    { user_id: 2, text: "Nice post!" },
    { user_id: 3, text: "Great!" }
  ]
},
{
  _id: 102,
  user_id: 2,
  content: "MongoDB is awesome!",
  createdAt: new Date("2024-06-05"),
  likes: [
    { user_id: 1 }
  ],
  comments: []
}
]);

// ==========================
// QUERIES
// ==========================

// User with Most Followers
db.users.aggregate([
  {
    $project: {
      username: 1,
      totalFollowers: { $size: "$followers" }
    }
  },
  { $sort: { totalFollowers: -1 } },
  { $limit: 1 }
]);

// Post with Most Likes
db.posts.aggregate([
  {
    $project: {
      content: 1,
      totalLikes: { $size: "$likes" }
    }
  },
  { $sort: { totalLikes: -1 } },
  { $limit: 1 }
]);

// Post with Most Comments
db.posts.aggregate([
  {
    $project: {
      content: 1,
      totalComments: { $size: "$comments" }
    }
  },
  { $sort: { totalComments: -1 } },
  { $limit: 1 }
]);

// Activity Over Time
db.posts.aggregate([
  {
    $group: {
      _id: {
        year: { $year: "$createdAt" },
        month: { $month: "$createdAt" }
      },
      totalPosts: { $sum: 1 }
    }
  },
  { $sort: { "_id.year": 1, "_id.month": 1 } }
]);
