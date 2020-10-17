--
-- THis script is for development env only. This creates some dummy data for testing the application.
--

--
-- TOC entry 2143 (class 0 OID 16394)
-- Dependencies: 187
-- Data for Name: author; Type: TABLE DATA; Schema: library; Owner: shslibraryadmin
--

INSERT INTO library.author VALUES ('304892962153036', 'M T Vasudevan Nair', 'MT');
INSERT INTO library.author VALUES ('304900806036524', 'Benyamin', 'Benyamin');
INSERT INTO library.author VALUES ('310238036652519', 'Basheer', 'Basheer');


--
-- TOC entry 2144 (class 0 OID 16399)
-- Dependencies: 188
-- Data for Name: book; Type: TABLE DATA; Schema: library; Owner: shslibraryadmin
--

INSERT INTO library.book VALUES ('3456', 'Randamoozham', '304892962153036', 'Rack 1', 'DC', 'Malayalam', 400.0000, '2015-05-10 18:30:00', 'Novel', true);
INSERT INTO library.book VALUES ('5443', 'Manjaveyil maranangal', '304900806036524', 'Rack 2', 'Current books', 'Malayalam', 300.0000, '2018-07-10 18:30:00', 'Novel', true);
INSERT INTO library.book VALUES ('K343', 'Kalam', '304892962153036', 'Rack 3', 'DC', 'Malayalam', 200.0000, '2015-05-10 18:30:00', 'Novel', true);
INSERT INTO library.book VALUES ('6498', 'Balyakala sakhi', '310238036652519', 'Rack 4', 'DC', 'Malayalam', 200.0000, '2020-10-21 18:30:00', 'Novel', true);
INSERT INTO library.book VALUES ('5324', 'Aadujeevitham', '304900806036524', 'Rack 1', 'DC', 'Malayalam', 200.0000, '2018-07-10 18:30:00', 'Novel', true);
INSERT INTO library.book VALUES ('1234', 'Randamoozham', '304892962153036', 'Rack 1', 'DC', 'Malayalam', 450.0000, '2015-10-06 00:00:00', 'Novel', true);
