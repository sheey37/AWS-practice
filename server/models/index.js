var db = require("../db");

module.exports = {
    get: function(callback) {
      // fetch all messages
      // text, username, roomname, id
      var queryStr = 
        `SELECT orders.id, orders.created_at, items.name, items.price, items.image, order_items.order_quantity, users.name
        FROM items INNER JOIN order_items ON (order_items.item_id = items.id)
        INNER JOIN orders ON (orders.id = order_items.order_id)
        INNER JOIN users ON (orders.user_id = users.id)
        WHERE (users.id = ${id})`
      db.query(queryStr, function(err, results) {
        callback(err, results);
      });
    },
    post: function(params, callback) {
      // create a message for a user id based on the given username
      var queryStr = ``
      db.query(queryStr, params, function(err, results) {
        callback(err, results);
      });
    }
};