INSERT INTO library.role VALUES ('STUDENT');
INSERT INTO library.role VALUES ('ADMIN');
INSERT INTO library.role VALUES ('TEACHER');
INSERT INTO library.role VALUES ('REGISTERED');

INSERT INTO library.user (username, created_timestamp, email, password, status, updated_timestamp) VALUES ('studentone_b2022',  current_timestamp, 'student1@shs.com', '$2y$12$yKHewWpeogSWTKGrflTc9OPBWTCjW4G7C7Qio35K5WzAQUvmPyMB6', 'active', current_timestamp);
INSERT INTO library.user (username, created_timestamp, email, password, status, updated_timestamp) VALUES ('studentsec_b2021',  current_timestamp, 'student2@shs.com', '$2y$12$yKHewWpeogSWTKGrflTc9OPBWTCjW4G7C7Qio35K5WzAQUvmPyMB6', 'active', current_timestamp);
INSERT INTO library.user (username, created_timestamp, email, password, status, updated_timestamp) VALUES ('libraryadmin',  current_timestamp, 'admin@shs.com', '$2y$12$yKHewWpeogSWTKGrflTc9OPBWTCjW4G7C7Qio35K5WzAQUvmPyMB6', 'active', current_timestamp);
INSERT INTO library.user (username, created_timestamp, email, password, status, updated_timestamp) VALUES ('teachingstaff',  current_timestamp, 'teacher@shs.com', '$2y$12$yKHewWpeogSWTKGrflTc9OPBWTCjW4G7C7Qio35K5WzAQUvmPyMB6', 'active', current_timestamp);


INSERT INTO library.userdetails (id, address, division, firstname, lastname, parent_name, phone, parent_phone, standard, user_username) VALUES ('54325235234', '', 'A', 'Student', 'One', '', '', '', 9, 'studentone_b2022');
INSERT INTO library.userdetails (id, address, division, firstname, lastname, parent_name, phone, parent_phone, standard, user_username) VALUES ('54325235235', '', 'B', 'Student', 'Second', '', '', '', 10, 'studentsec_b2021');
INSERT INTO library.userdetails (id, address, division, firstname, lastname, parent_name, phone, parent_phone, standard, user_username) VALUES ('54325235236', '', '', 'Admin', 'User', '', '', '', 0, 'libraryadmin');
INSERT INTO library.userdetails (id, address, division, firstname, lastname, parent_name, phone, parent_phone, standard, user_username) VALUES ('54325235237', '', '', 'Teaching', 'Staff', '', '', '', 0, 'teachingstaff');

INSERT INTO library.role_user (roles_role, user_username) VALUES ('STUDENT', 'studentone_b2022');
INSERT INTO library.role_user (roles_role, user_username) VALUES ('STUDENT', 'studentsec_b2021');
INSERT INTO library.role_user (roles_role, user_username) VALUES ('ADMIN', 'libraryadmin');
INSERT INTO library.role_user (roles_role, user_username) VALUES ('TEACHER', 'teachingstaff');

INSERT INTO library.author VALUES ('1001', 'M T Vasudevan Nair', 'MT', current_timestamp);
INSERT INTO library.author VALUES ('1002', 'Benyamin', 'Benyamin', current_timestamp);
INSERT INTO library.author VALUES ('1003', 'Basheer', 'Basheer', current_timestamp);
INSERT INTO library.author VALUES ('1004', 'Hector Garcia', 'Hector Garcia', current_timestamp);
INSERT INTO library.author VALUES ('1005', 'Yuval Noah Harari', 'Harari', current_timestamp);
INSERT INTO library.author VALUES ('1006', 'Balachandran Chullikkad', 'Chullikkad', current_timestamp);
INSERT INTO library.author VALUES ('1007', 'S Hareesh', 'S Hareesh', current_timestamp);

INSERT INTO library.bookdetails  (id, category, created_timestamp, language, name, publication, author_id) VALUES ('1001', 'Novel', current_timestamp, 'Malayalam', 'Manjaveyil maranangal', 'Current books', '1002');
INSERT INTO library.bookdetails  (id, category, created_timestamp, language, name, publication, author_id) VALUES ('1002', 'Novel', current_timestamp, 'Malayalam', 'Kaalam', 'Current books', '1001');
INSERT INTO library.bookdetails  (id, category, created_timestamp, language, name, publication, author_id) VALUES ('1003', 'Novel', current_timestamp, 'Malayalam', 'Randamoozham', 'Current books', '1001');
INSERT INTO library.bookdetails  (id, category, created_timestamp, language, name, publication, author_id) VALUES ('1004', 'Novel', current_timestamp, 'English', 'Ikigai', 'FSC', '1004');
INSERT INTO library.bookdetails  (id, category, created_timestamp, language, name, publication, author_id) VALUES ('1005', 'Novel', current_timestamp, 'English', 'Sapiens', 'Vintage', '1005');
INSERT INTO library.bookdetails  (id, category, created_timestamp, language, name, publication, author_id) VALUES ('1006', 'Novel', current_timestamp, 'Malayalam', 'Homo Deus', 'Vintage', '1005');
INSERT INTO library.bookdetails  (id, category, created_timestamp, language, name, publication, author_id) VALUES ('1007', 'Novel', current_timestamp, 'Malayalam', 'Varanasi', 'DC', '1001');
INSERT INTO library.bookdetails  (id, category, created_timestamp, language, name, publication, author_id) VALUES ('1008', 'Novel', current_timestamp, 'Malayalam', 'Chidambarasmarana', 'DC', '1006');
INSERT INTO library.bookdetails  (id, category, created_timestamp, language, name, publication, author_id) VALUES ('1009', 'Novel', current_timestamp, 'Malayalam', 'Meesha', 'DC', '1007');

INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('2345', 'def', current_timestamp, 200, 'Rack 2', 'AVAILABLE', current_timestamp, 1001, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('6456', 'ghi', current_timestamp, 300, 'Rack 3', 'LENDED', current_timestamp, 1002, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('1324', 'jkl', current_timestamp, 400, 'Rack 1', 'AVAILABLE', current_timestamp, 1003, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('1356', 'jkl', current_timestamp, 400, 'Rack 1', 'AVAILABLE', current_timestamp, 1004, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('1357', 'jkl', current_timestamp, 400, 'Rack 1', 'AVAILABLE', current_timestamp, 1004, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('1456', 'asdgasdgs', current_timestamp, 500, 'Rack 3', 'AVAILABLE', current_timestamp, 1005, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('1457', 'asdgasdgs', current_timestamp, 500, 'Rack 3', 'AVAILABLE', current_timestamp, 1005, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('1458', 'asdgasdgs', current_timestamp, 500, 'Rack 3', 'AVAILABLE', current_timestamp, 1005, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('1459', 'asdgasdgs', current_timestamp, 500, 'Rack 3', 'AVAILABLE', current_timestamp, 1006, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('1011', 'asdgasdgs', current_timestamp, 500, 'Rack 2', 'AVAILABLE', current_timestamp, 1007, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('1012', 'asdgasdgs', current_timestamp, 500, 'Rack 2', 'AVAILABLE', current_timestamp, 1007, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('1232', 'fwefw', current_timestamp, 100, 'Rack 2', 'AVAILABLE', current_timestamp, 1008, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('1233', 'ewfwe', current_timestamp, 100, 'Rack 2', 'AVAILABLE', current_timestamp, 1008, current_timestamp);
INSERT INTO library.book (id, contributed_by, created_timestamp, price, rack, status, updated_timestamp, book_details_id, purchased_date) VALUES ('1278', 'gregtewg', current_timestamp, 200, 'Rack 2', 'AVAILABLE', current_timestamp, 1009, current_timestamp);

INSERT INTO library.book_users (id, books_id, users_username, status) VALUES ('1002', '2345', 'studentone_b2022', 'LENDED');
INSERT INTO library.book_users (id, books_id, users_username, status) VALUES ('1003', '6456', 'studentsec_b2021', 'RETURNED');