INSERT INTO library.role VALUES ('STUDENT');
INSERT INTO library.role VALUES ('ADMIN');
INSERT INTO library.role VALUES ('TEACHER');
INSERT INTO library.role VALUES ('REGISTERED');

INSERT INTO library.user (username, created_timestamp, email, password, status, updated_timestamp) VALUES ('STU-ONE-9A',  current_timestamp, 'student1@shs.com', '$2y$12$yKHewWpeogSWTKGrflTc9OPBWTCjW4G7C7Qio35K5WzAQUvmPyMB6', 'active', current_timestamp);
INSERT INTO library.user (username, created_timestamp, email, password, status, updated_timestamp) VALUES ('STU-SEC-10B',  current_timestamp, 'student2@shs.com', '$2y$12$yKHewWpeogSWTKGrflTc9OPBWTCjW4G7C7Qio35K5WzAQUvmPyMB6', 'active', current_timestamp);
INSERT INTO library.user (username, created_timestamp, email, password, status, updated_timestamp) VALUES ('ADMIN',  current_timestamp, 'admin@shs.com', '$2y$12$yKHewWpeogSWTKGrflTc9OPBWTCjW4G7C7Qio35K5WzAQUvmPyMB6', 'active', current_timestamp);
INSERT INTO library.user (username, created_timestamp, email, password, status, updated_timestamp) VALUES ('TEA-STA',  current_timestamp, 'teacher@shs.com', '$2y$12$yKHewWpeogSWTKGrflTc9OPBWTCjW4G7C7Qio35K5WzAQUvmPyMB6', 'active', current_timestamp);


INSERT INTO library.userdetails (id, address, division, firstname, lastname, parent_name, phone, standard, user_username) VALUES ('54325235234', '', 'A', 'Student', 'One', '', '', 9, 'STU-ONE-9A');
INSERT INTO library.userdetails (id, address, division, firstname, lastname, parent_name, phone, standard, user_username) VALUES ('54325235235', '', 'B', 'Student', 'Second', '', '', 10, 'STU-SEC-10B');
INSERT INTO library.userdetails (id, address, division, firstname, lastname, parent_name, phone, standard, user_username) VALUES ('54325235236', '', '', 'Admin', 'User', '', '', 0, 'ADMIN');
INSERT INTO library.userdetails (id, address, division, firstname, lastname, parent_name, phone, standard, user_username) VALUES ('54325235237', '', '', 'Teaching', 'Staff', '', '', 0, 'TEA-STA');

INSERT INTO library.role_user (roles_role, user_username) VALUES ('STUDENT', 'STU-ONE-9A');
INSERT INTO library.role_user (roles_role, user_username) VALUES ('STUDENT', 'STU-SEC-10B');
INSERT INTO library.role_user (roles_role, user_username) VALUES ('ADMIN', 'ADMIN');
INSERT INTO library.role_user (roles_role, user_username) VALUES ('TEACHER', 'TEA-STA');

INSERT INTO library.author VALUES ('1001', 'M T Vasudevan Nair', 'MT', current_timestamp);
INSERT INTO library.author VALUES ('1002', 'Benyamin', 'Benyamin', current_timestamp);
INSERT INTO library.author VALUES ('1003', 'Basheer', 'Basheer', current_timestamp);

INSERT INTO library.bookdetails  (id, category, created_timestamp, language, name, publication, author_id) VALUES ('1001', 'Novel', current_timestamp, 'Malayalam', 'Manjaveyil maranangal', 'Current books', '1002');
INSERT INTO library.bookdetails  (id, category, created_timestamp, language, name, publication, author_id) VALUES ('1002', 'Novel', current_timestamp, 'Malayalam', 'Kaalam', 'Current books', '1001');
INSERT INTO library.bookdetails  (id, category, created_timestamp, language, name, publication, author_id) VALUES ('1003', 'Novel', current_timestamp, 'Malayalam', 'Randamoozham', 'Current books', '1001');

INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('2345', 'def', current_timestamp, 200, 'Rack 2', 'AVAILABLE', current_timestamp, 1001, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('6456', 'ghi', current_timestamp, 300, 'Rack 3', 'LENDED', current_timestamp, 1002, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('1324', 'jkl', current_timestamp, 400, 'Rack 1', 'AVAILABLE', current_timestamp, 1003, current_timestamp);

INSERT INTO library.book_users (id, books_id, users_username, status) VALUES ('1002', '2345', 'STU-ONE-9A', 'LENDED');
INSERT INTO library.book_users (id, books_id, users_username, status) VALUES ('1003', '6456', 'STU-SEC-10B', 'RETURNED');