// =====================================
// E-COMMERCE DATABASE - MONGODB
// =====================================

use ecommerce_db

// ==========================
// PRODUCTS
// ==========================

db.products.insertMany([
{
  _id: 1,
  name: "Laptop",
  category: "Electronics",
  price: 60000,
  stock: 50
},
{
  _id: 2,
  name: "Phone",
  category: "Electronics",
  price: 30000,
  stock: 100
},
{
  _id: 3,
  name: "Shoes",
  category: "Fashion",
  price: 3000,
  stock: 200
}
]);

// ==========================
// CUSTOMERS
// ==========================

db.customers.insertOne({
  _id: 1,
  name: "Amit",
  email: "amit@gmail.com",
  city: "Mumbai"
});

// ==========================
// ORDERS (Embedded Items)
// ==========================

db.orders.insertOne({
  _id: 101,
  customer_id: 1,
  orderDate: new Date("2024-06-01"),
  items: [
    { product_id: 1, name: "Laptop", category: "Electronics", quantity: 1, price: 60000 },
    { product_id: 2, name: "Phone", category: "Electronics", quantity: 1, price: 30000 }
  ],
  totalAmount: 90000
});

// ==========================
// QUERIES
// ==========================

// Top Selling Products Per Category
db.orders.aggregate([
  { $unwind: "$items" },
  {
    $group: {
      _id: { category: "$items.category", product: "$items.name" },
      totalSold: { $sum: "$items.quantity" }
    }
  },
  { $sort: { totalSold: -1 } }
]);

// Customer Purchase Pattern
db.orders.aggregate([
  {
    $group: {
      _id: "$customer_id",
      totalOrders: { $sum: 1 },
      totalSpent: { $sum: "$totalAmount" }
    }
  }
]);

// Monthly Revenue
db.orders.aggregate([
  {
    $group: {
      _id: {
        year: { $year: "$orderDate" },
        month: { $month: "$orderDate" }
      },
      monthlyRevenue: { $sum: "$totalAmount" }
    }
  }
]);

// Yearly Revenue
db.orders.aggregate([
  {
    $group: {
      _id: { year: { $year: "$orderDate" } },
      yearlyRevenue: { $sum: "$totalAmount" }
    }
  }
]);
