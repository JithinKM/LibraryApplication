INSERT INTO library.author VALUES ('304892962153036', 'M T Vasudevan Nair', 'MT', current_timestamp);
INSERT INTO library.author VALUES ('304900806036524', 'Benyamin', 'Benyamin', current_timestamp);
INSERT INTO library.author VALUES ('310238036652519', 'Basheer', 'Basheer', current_timestamp);

INSERT INTO library.role VALUES ('STUDENT');
INSERT INTO library.role VALUES ('ADMIN');
INSERT INTO library.role VALUES ('TEACHER');

INSERT INTO library.user (username, created_timestamp, email, password, status, updated_timestamp) VALUES ('IXA22',  current_timestamp, 'student1@shs.com', '$2y$12$yKHewWpeogSWTKGrflTc9OPBWTCjW4G7C7Qio35K5WzAQUvmPyMB6', 'active', current_timestamp);
INSERT INTO library.user (username, created_timestamp, email, password, status, updated_timestamp) VALUES ('XB21',  current_timestamp, 'student2@shs.com', '$2y$12$yKHewWpeogSWTKGrflTc9OPBWTCjW4G7C7Qio35K5WzAQUvmPyMB6', 'active', current_timestamp);
INSERT INTO library.user (username, created_timestamp, email, password, status, updated_timestamp) VALUES ('ADMIN',  current_timestamp, 'admin@shs.com', '$2y$12$yKHewWpeogSWTKGrflTc9OPBWTCjW4G7C7Qio35K5WzAQUvmPyMB6', 'active', current_timestamp);

INSERT INTO library.userdetails (id, address, division, firstname, lastname, parent_name, phone, standard, user_username) VALUES ('54325235234', '', 'A', 'abc', 'def', '', '', 9, 'IXA22');
INSERT INTO library.userdetails (id, address, division, firstname, lastname, parent_name, phone, standard, user_username) VALUES ('54325235235', '', 'B', 'abc', 'def', '', '', 10, 'XB21');
INSERT INTO library.userdetails (id, address, division, firstname, lastname, parent_name, phone, standard, user_username) VALUES ('54325235236', '', '', 'abc', 'def', '', '', 0, 'ADMIN');

INSERT INTO library.role_user (roles_role, user_username) VALUES ('STUDENT', 'IXA22');
INSERT INTO library.role_user (roles_role, user_username) VALUES ('STUDENT', 'XB21');
INSERT INTO library.role_user (roles_role, user_username) VALUES ('ADMIN', 'ADMIN');
INSERT INTO library.role_user (roles_role, user_username) VALUES ('TEACHER', 'ADMIN');

INSERT INTO library.bookdetails  (id, category, created_timestamp, language, name, publication, author_id) VALUES ('1', 'Novel', current_timestamp, 'Malayalam', 'Manjaveyil maranangal', 'Current books', '304900806036524');
INSERT INTO library.bookdetails  (id, category, created_timestamp, language, name, publication, author_id) VALUES ('2', 'Novel', current_timestamp, 'Malayalam', 'Kaalam', 'Current books', '304892962153036');
INSERT INTO library.bookdetails  (id, category, created_timestamp, language, name, publication, author_id) VALUES ('3', 'Novel', current_timestamp, 'Malayalam', 'Randamoozham', 'Current books', '304892962153036');

INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('2345', 'def', current_timestamp, 200, 'Rack 2', 'available', current_timestamp, 1, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('6456', 'ghi', current_timestamp, 300, 'Rack 3', 'available', current_timestamp, 2, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('1324', 'jkl', current_timestamp, 400, 'Rack 1', 'available', current_timestamp, 3, current_timestamp);

INSERT INTO library.book_users (id, books_id, users_username, status) VALUES ('3102380364552523', '2345', 'IXA22', 'LENDED');
INSERT INTO library.book_users (id, books_id, users_username, status) VALUES ('3102380364552524', '6456', 'XB21', 'RETURNED');