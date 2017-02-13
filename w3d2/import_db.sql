DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  body TEXT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Eddie', 'Lao'),
  ('Claire', 'Wild'),
  ('Elon', 'Musk');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('Why?', 'Why is the sky blue?', 1),
  ('Books', 'What is your favorite book?', 2),
  ('Fail', 'What would you do if you knew you couldn''t fail?', 2),
  ('Mars', 'How can I get to Mars?', 3);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (1, (SELECT id FROM questions WHERE title = 'Books')),
  (2, 3),
  (3, 1);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (2, 2),
  (1, 3),
  (3, 1),
  (2, 3);

INSERT INTO
  replies (user_id, question_id, parent_id, body)
VALUES
  (1, 1, NULL, 'Because it''s daytime'),
  (2, 1, 1, 'But it''s raining'),
  (2, 3, NULL, 'In a giant rocket!');
