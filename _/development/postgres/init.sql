CREATE USER chat WITH PASSWORD 'chat';
CREATE DATABASE chat;
CREATE DATABASE chat_test;

GRANT ALL PRIVILEGES ON DATABASE chat TO chat;
GRANT ALL PRIVILEGES ON DATABASE chat_test TO chat;