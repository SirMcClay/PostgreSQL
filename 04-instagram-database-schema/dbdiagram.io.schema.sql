-- dbdiagram.io schema for instagram database model

table users {
  id SERIAL [pk, increment]
  created_at TIMESTAMP
  updated_at TIMESTAMP
  username VARCHAR(30)
}

table posts {
  id SERIAL [pk, increment]
  created_at TIMESTAMP
  updated_at TIMESTAMP
  url VARCHAR(200)
  user_id INTEGER [ref: > users.id]
}

table comments {
  id SERIAL [pk, increment]
  user_id INTEGER [ref: > users.id]
  post_id INTEGER [ref: > posts.id]
  created_at TIMESTAMP
  updated_at TIMESTAMP
  contents VARCHAR(240)
}