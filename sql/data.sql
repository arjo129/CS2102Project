--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users VALUES ('bob@gmail.com', 'bob', '$2b$12$dSgbUa/mkAxucjIb3xGh0eUH4Ccjmj.RfBbxQIfwA/zLO8YaI805G', 'user');
INSERT INTO users VALUES ('arjo@u.nus.edu', 'arjo', '$2b$12$WOF/cBpqxjPbmCUhsUhoxuQzzQs9.0.O7G19F.yM/TFg4wE8n1im2', 'admin');
INSERT INTO users VALUES ('jim@live.com', 'jimmy123', '$2b$12$P2jUQZRsbrlU7t4C10SIne9sk0GDSXiYA06VaW9dcqd.EtTVK9Dsq', 'user');
INSERT INTO users VALUES ('winson@u.nus.edu', 'winson', '$2b$12$k8pAAWeull3E9tW34/yVFugmvp0lR7snP/jEA6tosDOPBbVlfBGI.', 'user');
INSERT INTO users VALUES ('rudolf@reindeers.io', 'rudolf', '$2b$12$qaHVaKmmkAstCVC359b56ubie/UuVaYeg2lQ4SbSd8WbKyzQaZqxW', 'user');
INSERT INTO users VALUES ('xiaoming@gmail.com', 'xiezuowen', '$2b$12$pEEPNdJYLG1ymTO01xRuXOUIVmrb556XhDArtODdoBJgLYFkjnfrG', 'user');
INSERT INTO users VALUES ('jason@example.com', 'jason1996', '$2b$12$oEGqOJHehtw7beGaiLdvI.Mp2UKYQ/mXKfT9hcxZhpx6fOOz/1rJi', 'user');
INSERT INTO users VALUES ('12359867@qq.com', 'lightning101', '$2b$12$c8IUz8t.XKsUNyvKGQmEterDdvzZfzbJrTnzlxXHiMz3gg1WqOqvy', 'user');
INSERT INTO users VALUES ('jane@yahoo.com', 'jane123', '$2b$12$mXO5hAzQlT7SQhcaDXADNOdY3SKNevhGo3PctcVkug6D88eh/hSHW', 'user');
INSERT INTO users VALUES ('ongyekun@moe.gov.sg', 'oyk', '$2b$12$bhH1GCpAIUJ0/K3hY/Z0QuyWOX/BxoF8GsMTQaXHe7mrKngMfGwcC', 'user');
INSERT INTO users VALUES ('kawboonwan@pap.gov.sg', 'MRTAlwaysWorks', '$2b$12$9LVicC5VtelKJufpf8NjreoCEoGZ67ZNDaa1l9bZmDStdK/ZEmzU.', 'user');
INSERT INTO users VALUES ('xiaohua@hotmail.com', 'xiaohua121', '$2b$12$i0TywPM001JwX8PZvqobAOjcAJDI8VPVr97NLOpYlpHSeRaDbwlRG', 'user');
INSERT INTO users VALUES ('chelsey@fakeemail.com', 'chelsey321', '$2b$12$Kb9aoscLnx.k8u4DmJO52ezcwaOb74NmcIMBCYMoQNMRzJ54Mwpwi', 'user');
INSERT INTO users VALUES ('parksoohyun@naver.com', 'psyk521', '$2b$12$yV/nowV2mmyQPEnIolKjIO5jYiVTFuRv9yEllt10FWxhcE0xVX.ii', 'user');
INSERT INTO users VALUES ('donaldtrump@trump.com', 'cnnfakenews', '$2b$12$Zg8fs5HJorL0ALqOPFzT9.S0mxD2.NbKilCexAlQQqZCNzW5bcW4y', 'user');
INSERT INTO users VALUES ('kimjongun@dprk.ko', 'ihazinternet', '$2b$12$fV3yY0xcfwpaO5Mi3bseh.xnDwJ4rOVm1A/xrYbkfxehRKd2Eb3Jq', 'user');
INSERT INTO users VALUES ('xuyongping@gmail.com', 'bestnuslecturer', '$2b$12$s4nBi64oFV0Alql7MWYDuO30dhi7arlaG/Fp7IfnFZiRohFdsH/W2', 'user');
INSERT INTO users VALUES ('stephenbressan@email.com', 'frenchaccent', '$2b$12$U0os4q748JphOMcfzJSkFOboUOd.fAS0KI6Oi.LbpG6bh64mWHLce', 'user');
INSERT INTO users VALUES ('rajesh@fake.com', 'sheshraj', '$2b$12$XJZc5rNoknRCIOWcsxsKseKiUvpgtdY2bLdpetJ/xNvvU3cMC1nNq', 'user');
INSERT INTO users VALUES ('nozomi@yahoo.co.jp', 'nozomi', '$2b$12$7dNdOrXaGgS9Xma9BZdM0em6ZEAjOVNkqHexZUZtM.4ufgkb8FhLe', 'user');

--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO category VALUES ('Furniture');
INSERT INTO category VALUES ('Transport');
INSERT INTO category VALUES ('Books');
INSERT INTO category VALUES ('School-related Items');
INSERT INTO category VALUES ('Sports Equipment');
INSERT INTO category VALUES ('Electronics');
INSERT INTO category VALUES ('Musical Instruments');
INSERT INTO category VALUES ('Photography');
INSERT INTO category VALUES ('Outdoor Equipment');


--
-- Data for Name: forgot_password; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: item_belongs_to_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO item_belongs_to_category VALUES (1, 'Furniture');
INSERT INTO item_belongs_to_category VALUES (2, 'Sports Equipment');
INSERT INTO item_belongs_to_category VALUES (3, 'Musical Instruments');
INSERT INTO item_belongs_to_category VALUES (4, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (5, 'Books');
INSERT INTO item_belongs_to_category VALUES (5, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (6, 'Photography');
INSERT INTO item_belongs_to_category VALUES (7, 'Sports Equipment');
INSERT INTO item_belongs_to_category VALUES (7, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (7, 'Photography');
INSERT INTO item_belongs_to_category VALUES (8, 'Outdoor Equipment');
INSERT INTO item_belongs_to_category VALUES (9, 'Outdoor Equipment');
INSERT INTO item_belongs_to_category VALUES (10, 'Books');
INSERT INTO item_belongs_to_category VALUES (10, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (11, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (12, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (12, 'Books');
INSERT INTO item_belongs_to_category VALUES (13, 'Outdoor Equipment');
INSERT INTO item_belongs_to_category VALUES (14, 'Transport');
INSERT INTO item_belongs_to_category VALUES (15, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (15, 'Photography');
INSERT INTO item_belongs_to_category VALUES (16, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (17, 'Furniture');
INSERT INTO item_belongs_to_category VALUES (18, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (18, 'Photography');
INSERT INTO item_belongs_to_category VALUES (19, 'Books');
INSERT INTO item_belongs_to_category VALUES (19, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (20, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (21, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (22, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (23, 'Furniture');
INSERT INTO item_belongs_to_category VALUES (24, 'Furniture');
INSERT INTO item_belongs_to_category VALUES (25, 'Furniture');
INSERT INTO item_belongs_to_category VALUES (26, 'Furniture');
INSERT INTO item_belongs_to_category VALUES (27, 'Furniture');
INSERT INTO item_belongs_to_category VALUES (28, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (29, 'Books');
INSERT INTO item_belongs_to_category VALUES (29, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (30, 'Transport');
INSERT INTO item_belongs_to_category VALUES (30, 'Sports Equipment');
INSERT INTO item_belongs_to_category VALUES (31, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (32, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (33, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (33, 'Photography');
INSERT INTO item_belongs_to_category VALUES (34, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (34, 'Photography');
INSERT INTO item_belongs_to_category VALUES (35, 'Outdoor Equipment');
INSERT INTO item_belongs_to_category VALUES (36, 'Outdoor Equipment');
INSERT INTO item_belongs_to_category VALUES (37, 'Outdoor Equipment');
INSERT INTO item_belongs_to_category VALUES (38, 'Outdoor Equipment');
INSERT INTO item_belongs_to_category VALUES (39, 'Outdoor Equipment');
INSERT INTO item_belongs_to_category VALUES (40, 'Photography');
INSERT INTO item_belongs_to_category VALUES (41, 'Photography');
INSERT INTO item_belongs_to_category VALUES (42, 'Photography');
INSERT INTO item_belongs_to_category VALUES (43, 'Books');
INSERT INTO item_belongs_to_category VALUES (44, 'Photography');
INSERT INTO item_belongs_to_category VALUES (45, 'Furniture');
INSERT INTO item_belongs_to_category VALUES (46, 'Furniture');
INSERT INTO item_belongs_to_category VALUES (46, 'Sports Equipment');
INSERT INTO item_belongs_to_category VALUES (47, 'Sports Equipment');
INSERT INTO item_belongs_to_category VALUES (48, 'Photography');
INSERT INTO item_belongs_to_category VALUES (49, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (50, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (51, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (52, 'Photography');
INSERT INTO item_belongs_to_category VALUES (53, 'Outdoor Equipment');
INSERT INTO item_belongs_to_category VALUES (54, 'Transport');
INSERT INTO item_belongs_to_category VALUES (55, 'Sports Equipment');
INSERT INTO item_belongs_to_category VALUES (56, 'Outdoor Equipment');
INSERT INTO item_belongs_to_category VALUES (57, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (58, 'Furniture');
INSERT INTO item_belongs_to_category VALUES (59, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (59, 'Photography');
INSERT INTO item_belongs_to_category VALUES (60, 'Photography');
INSERT INTO item_belongs_to_category VALUES (61, 'Photography');
INSERT INTO item_belongs_to_category VALUES (62, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (62, 'Photography');
INSERT INTO item_belongs_to_category VALUES (63, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (63, 'Photography');
INSERT INTO item_belongs_to_category VALUES (64, 'Outdoor Equipment');
INSERT INTO item_belongs_to_category VALUES (65, 'Books');
INSERT INTO item_belongs_to_category VALUES (65, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (66, 'Books');
INSERT INTO item_belongs_to_category VALUES (66, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (67, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (68, 'Sports Equipment');
INSERT INTO item_belongs_to_category VALUES (69, 'Sports Equipment');
INSERT INTO item_belongs_to_category VALUES (70, 'Sports Equipment');
INSERT INTO item_belongs_to_category VALUES (71, 'Sports Equipment');
INSERT INTO item_belongs_to_category VALUES (71, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (72, 'Sports Equipment');
INSERT INTO item_belongs_to_category VALUES (72, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (72, 'Photography');
INSERT INTO item_belongs_to_category VALUES (73, 'Sports Equipment');
INSERT INTO item_belongs_to_category VALUES (73, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (73, 'Photography');
INSERT INTO item_belongs_to_category VALUES (74, 'Transport');
INSERT INTO item_belongs_to_category VALUES (75, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (75, 'Photography');
INSERT INTO item_belongs_to_category VALUES (76, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (77, 'Furniture');
INSERT INTO item_belongs_to_category VALUES (78, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (79, 'Transport');
INSERT INTO item_belongs_to_category VALUES (80, 'Books');
INSERT INTO item_belongs_to_category VALUES (81, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (81, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (82, 'Furniture');
INSERT INTO item_belongs_to_category VALUES (82, 'Sports Equipment');
INSERT INTO item_belongs_to_category VALUES (83, 'Transport');
INSERT INTO item_belongs_to_category VALUES (83, 'Sports Equipment');
INSERT INTO item_belongs_to_category VALUES (84, 'Books');
INSERT INTO item_belongs_to_category VALUES (84, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (85, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (85, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (86, 'Photography');
INSERT INTO item_belongs_to_category VALUES (87, 'Photography');
INSERT INTO item_belongs_to_category VALUES (88, 'Photography');
INSERT INTO item_belongs_to_category VALUES (89, 'Books');
INSERT INTO item_belongs_to_category VALUES (89, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (90, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (90, 'Photography');
INSERT INTO item_belongs_to_category VALUES (91, 'Photography');
INSERT INTO item_belongs_to_category VALUES (92, 'Furniture');
INSERT INTO item_belongs_to_category VALUES (93, 'Transport');
INSERT INTO item_belongs_to_category VALUES (93, 'Sports Equipment');
INSERT INTO item_belongs_to_category VALUES (94, 'Photography');
INSERT INTO item_belongs_to_category VALUES (95, 'Photography');
INSERT INTO item_belongs_to_category VALUES (96, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (96, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (97, 'Transport');
INSERT INTO item_belongs_to_category VALUES (97, 'Sports Equipment');
INSERT INTO item_belongs_to_category VALUES (98, 'Electronics');
INSERT INTO item_belongs_to_category VALUES (99, 'Books');
INSERT INTO item_belongs_to_category VALUES (99, 'School-related Items');
INSERT INTO item_belongs_to_category VALUES (100, 'Furniture');
INSERT INTO item_belongs_to_category VALUES (101, 'Electronics');

--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO items VALUES (1, 'Wooden Desk', 'arjo@u.nus.edu', 'Hougang, Singapore', 103.98999999999999, 2.9990000000000001, 'A small wooden desk', '2018-11-01', '2018-12-03');
INSERT INTO items VALUES (2, 'Go Pro Hero 5', 'arjo@u.nus.edu', 'Bishan, Singapore', 103.98999999999999, 2.9900000000000002, 'A high quality go pro. Water proof. Pls dont take diving.', '2018-12-01', '2018-12-03');
INSERT INTO items VALUES (3, 'French Horn', 'arjo@u.nus.edu', 'Hougang, Singapore', 102.98999999999999, 2.9900000000000002, 'A french horn. ', '2018-12-01', '2018-12-03');
INSERT INTO items VALUES (4, 'Velodyne VLP-16', 'arjo@u.nus.edu', 'LIDAR', 103.98999999999999, 2.9900000000000002, 'A high end lidar', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (5, 'CS1231 Textbook', 'arjo@u.nus.edu', 'Hougang, Singapore', 103.98999999999999, 2.9990000000000001, 'Will get you through group therapy.', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (6, 'Miku Costume', 'arjo@u.nus.edu', 'NUS, Singapore', 102.98999999999999, 2.9900000000000002, 'For cosplay', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (7, 'Go Pro Hero 7', 'bob@gmail.com', 'Bishan, Singapore', 102.98999999999999, 2.9900000000000002, 'Comes with dive housing', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (8, 'Tent', 'bob@gmail.com', 'Bishan, Singapore', 103.98999999999999, 2.9900000000000002, 'A tent large enough for 2 people.', '2018-11-01', '2018-12-03');
INSERT INTO items VALUES (9, 'Sleeping bag', 'bob@gmail.com', 'Bishan, Singapore', 102.98999999999999, 2.9900000000000002, 'A sleeping bage for tropical climates', '2018-11-01', '2018-12-03');
INSERT INTO items VALUES (10, 'GES1002 Textbook', 'bob@gmail.com', 'Bishan, Singapore', 103.98999999999999, 2.9900000000000002, 'NUS GES1002 Textbook', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (11, 'GES1002 notes', 'bob@gmail.com', 'Bishan, Singapore', 103.98999999999999, 2.9900000000000002, 'NUS GES1002 Textbook', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (12, 'Textbook (GES1002)', 'bob@gmail.com', 'Bishan, Singapore', 103.98999999999999, 2.9900000000000002, 'NUS GES1002 Textbook', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (13, 'Jacket', 'bob@gmail.com', 'Bishan, Singapore', 103.98999999999999, 2.9900000000000002, 'Winter jacket', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (14, 'BMW Car', 'jim@live.com', 'Dakota, USA', 45.659999999999997, 96.329999999999998, 'A good car for travelling in', '2018-11-01', '2018-12-03');
INSERT INTO items VALUES (15, 'Cannon D960', 'jim@live.com', 'North Dakota, USA', 45.960000000000001, 96.989999999999995, 'A good quality cannon DSLR', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (16, 'Outdoor Speaker', 'jim@live.com', 'North Dakota, USA', 45.659999999999997, 96.989999999999995, 'Good for parties', '2018-12-01', '2019-12-03');
INSERT INTO items VALUES (17, 'Outdoor Chairs', 'jim@live.com', 'North Dakota, USA', 45.960000000000001, 96.989999999999995, 'Outdoor chairs useful for camping', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (18, 'Cannon D960', 'winson@u.nus.edu', 'Jurong, Singapore`', 102.98999999999999, 2.9900000000000002, 'A good quality cannon DSLR', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (19, 'CS2102 Textbook', 'winson@u.nus.edu', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'CS2102 database textbook', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (20, 'Bluetooth Speaker', 'winson@u.nus.edu', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'A portable bloototh speaker good for travel', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (21, 'Raspberry Pi', 'winson@u.nus.edu', 'NUS, Singapore', 103.98999999999999, 2.9990000000000001, 'A small sbc.', '2018-11-01', '2018-12-03');
INSERT INTO items VALUES (22, '36" Monitor', 'winson@u.nus.edu', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'A monitor good for exhibitions', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (23, 'Christmas Tree', 'rudolf@reindeers.io', 'Jurong, Singapore`', 103.98999999999999, 2.9900000000000002, 'A small christmass tree to make your house look nice.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (24, 'Holiday Lights', 'rudolf@reindeers.io', 'Jurong, Singapore', 103.98999999999999, 2.9900000000000002, 'Holiday lights to light up your house', '2018-12-01', '2019-01-16');
INSERT INTO items VALUES (25, 'Christmas Bells', 'rudolf@reindeers.io', 'Jurong, Singapore', 103.98999999999999, 2.9900000000000002, 'Christmas bells to put on your tree.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (26, 'Christmas Stockings', 'rudolf@reindeers.io', 'Jurong, Singapore', 103.98999999999999, 2.9900000000000002, 'Christmas stockings to put stuff in ', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (27, 'Santa Clause Statue', 'rudolf@reindeers.io', 'Jurong, Singapore', 103.98999999999999, 2.9900000000000002, 'A life size santa statue', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (28, 'Chinese MagiPen', 'xiaoming@gmail.com', 'Jurong, Singapore', 103.98999999999999, 102.98999999999999, 'Use this to pass your zuowens. You will never need pinyin again.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (29, 'Chinese Dictionary', 'xiaoming@gmail.com', 'Jurong, Singapore', 103.98999999999999, 2.9900000000000002, 'Chinese dictionary for your next zuowen', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (30, 'Bicycle', 'xiaoming@gmail.com', 'Jurong, Singapore', 103.98999999999999, 2.9900000000000002, 'Bicycle to get around.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (31, 'Microphone system', 'xiaoming@gmail.com', 'Jurong, Singapore', 103.98999999999999, 2.9900000000000002, 'Microphone system for audio.', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (32, 'Speaker', 'xiaoming@gmail.com', 'Jurong, Singapore', 103.98999999999999, 2.9990000000000001, 'A speaker used for outdoors.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (33, 'Go Pro Hero 5', 'jason@example.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'A small portable camera', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (34, 'Go Pro Gimbal', 'jason@example.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'A gimbal for you go pro', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (35, 'Dive housing', 'jason@example.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'A dive housing for gopro', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (36, 'Suitcase', 'jason@example.com', 'NUS, Singapore', 103.98999999999999, 2.9990000000000001, 'A large suitcase you can travel around it.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (37, 'Tent', 'jason@example.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'A tent large enough for 2 people.', '2018-12-01', '2019-12-03');
INSERT INTO items VALUES (38, 'Rubber Dinghi', '12359867@qq.com', 'Jurong, Singapore', 103.98999999999999, 2.9900000000000002, 'A rubber dinghi to be used for outdoors.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (39, 'Rucksack', '12359867@qq.com', 'Jurong, Singapore', 103.98999999999999, 2.9900000000000002, 'A rucksack suitable for hiking', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (40, 'Telephoto lens', '12359867@qq.com', 'Jurong, Singapore', 103.98999999999999, 2.9900000000000002, 'A telephot lens for Nikon cameras', '2018-12-01', '2019-01-16');
INSERT INTO items VALUES (41, 'Macro lens', '12359867@qq.com', 'Jurong, Singapore', 103.98999999999999, 2.9900000000000002, 'A macro photography lens', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (42, 'Photography Tripod', '12359867@qq.com', 'Jurong, Singapore', 103.98999999999999, 2.9900000000000002, 'Tripod for photographs', '2018-12-01', '2019-01-16');
INSERT INTO items VALUES (43, 'CS2113T textbook', '12359867@qq.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'CS2113T textbook for NUS students', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (44, '12" Telescope', 'jane@yahoo.com', 'NUS, Singapore', 103.98999999999999, 2.9990000000000001, 'A 12" reflector telescope', '2018-12-01', '2019-01-16');
INSERT INTO items VALUES (45, 'Folding table', 'jane@yahoo.com', 'Jurong, Singapore', 103.98999999999999, 2.9900000000000002, 'A folding table for outdoor use', '2018-12-01', '2018-12-03');
INSERT INTO items VALUES (46, 'Table tennis table', 'jane@yahoo.com', 'Jurong, Singapore', 102.98999999999999, 2.9900000000000002, 'A small table tennis table', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (47, 'Table tennis paddles', 'jane@yahoo.com', 'Jurong, Singapore', 102.98999999999999, 2.9900000000000002, 'Paddles to play table tennis with', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (48, 'Camera Monopod', 'jane@yahoo.com', 'Jurong, Singapore', 102.98999999999999, 2.9900000000000002, 'Camera monopod', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (49, 'PSLE answer machine', 'ongyekun@moe.gov.sg', 'Bishan, Singapore', 103.98999999999999, 2.9900000000000002, 'A PSLE answering machine', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (50, 'Tape recorder', 'ongyekun@moe.gov.sg', 'Bishan, Singapore', 102.98999999999999, 2.9900000000000002, 'For recording notes and replaying ', '2018-12-01', '2019-01-16');
INSERT INTO items VALUES (51, 'Karaoke Machine', 'ongyekun@moe.gov.sg', 'Bishan, Singapore', 102.98999999999999, 2.9900000000000002, 'Can disturb your neighbours any time!', '2018-12-01', '2019-12-03');
INSERT INTO items VALUES (52, 'Canon Telephoto', 'ongyekun@moe.gov.sg', 'Bishan, Singapore', 103.98999999999999, 2.9900000000000002, 'A canon telephoto lens', '2018-12-01', '2019-01-16');
INSERT INTO items VALUES (53, 'Binoculars', 'ongyekun@moe.gov.sg', 'Bishan, Singapore', 103.98999999999999, 2.9900000000000002, 'Binoculars for birdwatching and experiential learning', '2018-12-01', '2019-01-16');
INSERT INTO items VALUES (54, 'MRT Breakdown Charm', 'kawboonwan@pap.gov.sg', 'Jurong, Singapore', 103.98999999999999, 2.9900000000000002, 'This charm will gaurantee that the north south line will break down if you are on the train.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (55, 'Badminton Net', 'kawboonwan@pap.gov.sg', 'Bishan, Singapore', 103.98999999999999, 2.9900000000000002, 'Portable badminton net.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (56, 'Sleeping bag', 'kawboonwan@pap.gov.sg', 'Bishan, Singapore', 103.98999999999999, 2.9900000000000002, 'A sleeping bag for cold climates.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (57, 'Outdoor Speaker', 'kawboonwan@pap.gov.sg', 'Bishan, Singapore', 103.98999999999999, 2.9900000000000002, 'Camping outdoors', '2018-12-01', '2019-01-16');
INSERT INTO items VALUES (58, 'Folding table', 'kawboonwan@pap.gov.sg', 'Jurong, Singapore', 102.98999999999999, 2.9900000000000002, 'A small table good for outdoor use.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (59, 'Canon D900', 'xiaohua@hotmail.com', 'Hougang, Singapore', 103.98999999999999, 2.9900000000000002, 'A good quality canon DSLR', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (60, 'Telephoto lens', 'xiaohua@hotmail.com', 'Hougang, Singapore', 103.98999999999999, 2.9900000000000002, 'A telephoto lens for Canon cameras', '2018-11-01', '2018-12-03');
INSERT INTO items VALUES (61, 'Photography Tripod', 'xiaohua@hotmail.com', 'Hougang, Singapore', 103.98999999999999, 2.9900000000000002, 'Tripod for photographs', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (62, 'Canon EOS50', 'xiaohua@hotmail.com', 'Hougang, Singapore', 103.98999999999999, 2.9900000000000002, 'A good quality canon DSLR', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (63, 'Go Pro Hero 5', 'xiaohua@hotmail.com', 'Hougang, Singapore', 103.98999999999999, 2.9900000000000002, 'A good camera for sports.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (64, 'Camping Tent', 'chelsey@fakeemail.com', 'Hougang, Singapore', 102.98999999999999, 2.9900000000000002, 'A tent large enough for 2 people.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (65, 'CS1231 Textbook', 'chelsey@fakeemail.com', 'NUS, Singapore', 103.29000000000001, 2.9900000000000002, 'NUS CS1231 Textbook', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (66, 'CP3 textbook', 'chelsey@fakeemail.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'Stephen Halim''s CP3', '2018-11-01', '2018-12-03');
INSERT INTO items VALUES (67, 'Microphone system', 'chelsey@fakeemail.com', 'Jurong, Singapore', 102.98999999999999, 2.9900000000000002, 'A high quality microphone for audio recordings.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (68, 'Badminton Net', 'chelsey@fakeemail.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'Portable badminton net.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (69, 'SCUBA set', 'parksoohyun@naver.com', 'Bishan, Singapore', 103.98999999999999, 2.9900000000000002, 'A full scuba set for diving.', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (70, 'Flippers', 'parksoohyun@naver.com', 'Bishan, Singapore', 103.98999999999999, 2.9900000000000002, 'Flippers for use when diving or snorkelling.', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (71, 'Dive Computer', 'parksoohyun@naver.com', 'Bishan, Singapore', 102.98999999999999, 2.9900000000000002, 'A dive computer.', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (72, 'Go Pro Hero 5', 'parksoohyun@naver.com', 'Bishan, Singapore', 102.98999999999999, 2.9900000000000002, 'A Go Pro Hero 5. Comes with dive housing and filter', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (73, 'Go Pro red filter', 'parksoohyun@naver.com', 'Bishan, Singapore', 103.98999999999999, 2.9900000000000002, 'A red filter for go pro', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (74, 'Air Force One', 'donaldtrump@trump.com', 'Washington, USA', 102.98999999999999, 2.9900000000000002, 'My private jet is better.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (75, 'Sony Handycam', 'donaldtrump@trump.com', 'Washington, USA', 102.98999999999999, 2.9900000000000002, 'Take better news videos than cnn.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (76, 'Loudspeaker', 'donaldtrump@trump.com', 'Washington, USA', 103.98999999999999, 2.9900000000000002, 'Make the world great again by blasting my voice through these speakers.', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (77, 'Flag', 'donaldtrump@trump.com', 'Washington, USA', 102.98999999999999, 2.9900000000000002, 'A huuuge flag for display', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (78, 'Trump Soft Toy', 'donaldtrump@trump.com', 'Washington, USA', 102.98999999999999, 2.9900000000000002, 'Soft toys of myself. Cause Im making myself great again. Please return them.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (79, 'Nuclear Missiles', 'kimjongun@dprk.ko', 'Democratic People''s Republic of Korea', 102.98999999999999, 2.9900000000000002, 'Capable of long range strikes against evil capitalist nations.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (80, 'Little Red Book', 'kimjongun@dprk.ko', 'Democratic People''s Republic of Korea', 102.98999999999999, 2.9900000000000002, 'A veru good book.', '2018-11-01', '2019-12-03');
INSERT INTO items VALUES (81, 'TI84 calculator', 'kimjongun@dprk.ko', 'Democratic People''s Republic of Korea', 102.98999999999999, 2.9900000000000002, 'A generic calculator.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (82, 'Table tennis table', 'kimjongun@dprk.ko', 'Democratic People''s Republic of Korea', 103.98999999999999, 2.9900000000000002, 'A small table tennis table', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (83, 'Canoe', 'kimjongun@dprk.ko', 'Democratic People''s Republic of Korea', 103.98999999999999, 2.9900000000000002, 'A small canoe for 1 person to go out into a lake', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (84, 'EE Textbook', 'xuyongping@gmail.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'A very good EE textbook', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (85, 'TI83 calculator', 'xuyongping@gmail.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'A graphing calculator that can be used for A levels, IB and SAT', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (86, 'Canon EOS5', 'xuyongping@gmail.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'A good quality canon DSLR', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (87, 'Camera Tripod', 'xuyongping@gmail.com', 'NUS, Singapore', 102.98999999999999, 2.9900000000000002, 'Sturdy tripod for high quality shots.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (88, 'Macro lens', 'xuyongping@gmail.com', 'NUS, Singapore', 102.98999999999999, 2.9900000000000002, 'A macro photography lens', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (89, 'Database Textbook', 'stephenbressan@email.com', 'NUS, Singapore', 102.98999999999999, 2.9900000000000002, 'CS2102 database textbook', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (90, 'Go Pro Hero 5', 'stephenbressan@email.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'A good camera for sports.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (91, 'Gimbal for Go pro', 'stephenbressan@email.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'Use this to auto stabilize your shots.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (92, 'Outdoor Chairs', 'stephenbressan@email.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'Outdoor chairs useful for camping', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (93, 'Mountain bike', 'stephenbressan@email.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'Take this bike out during the weekend.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (94, 'Telephoto lens', 'rajesh@fake.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'A telephoto lens for Canon cameras', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (95, 'Macro lens', 'rajesh@fake.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'A tmacro lens for Canon cameras', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (96, 'TI-95 Calculator', 'rajesh@fake.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'An over powered calculator.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (97, 'Surf board', 'rajesh@fake.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'A surf board.', '2018-12-01', '2019-01-16');
INSERT INTO items VALUES (98, 'Ebike', 'rajesh@fake.com', 'NUS, Singapore', 103.98999999999999, 2.9900000000000002, 'An ebike', '2018-12-01', '2019-01-16');
INSERT INTO items VALUES (99, 'Susanna Epp. Book', 'nozomi@yahoo.co.jp', 'NUS, Singapore', 102.98999999999999, 2.9900000000000002, 'Use for CS1231.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (100, 'Barbeque Pit', 'nozomi@yahoo.co.jp', 'NUS, Singapore', 102.98999999999999, 2.9900000000000002, 'A barbeque cooker for parties.', '2018-11-01', '2019-01-16');
INSERT INTO items VALUES (101, 'Loadspeaker', 'nozomi@yahoo.co.jp', 'NUS, Singapore', 103.98999999999999, 102.98999999999999, 'A loud speaker with portable battery', '2018-11-01', '2019-01-16');




--
-- Data for Name: bid_for; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO bid_for VALUES ('nozomi@yahoo.co.jp', 2, 20.00, 'unknown');
INSERT INTO bid_for VALUES ('bob@gmail.com', 2, 100.00, 'unknown');





