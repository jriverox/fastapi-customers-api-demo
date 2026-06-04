-- Seed data from src/repositories/customers_db.json
-- 599 customers

INSERT INTO customers VALUES
  ('1', 'Elena', 'Medina', '2021-01-01', '1HGCM82633A000001', '1234567890', 'elena.medina@outlook.com', '123 Main St, Anytown, USA', 'Maracaibo', 'Maracaibo', '12345', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('2', 'Veronica', 'Moreno', '1968-07-20', 'OIUBPECRIP3EQRSAL', '7586992117', 'veronica.moreno@outlook.com', '5717 Cedar St', 'Buenos Aires', 'Buenos Aires', '24596', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('3', 'Laura', 'Gomez', '1990-08-31', 'HIRWJ0U44JK97JMTH', '7452590490', 'laura.gomez@yahoo.com', '4878 Elm St', 'Encarnacion', 'Encarnacion', '42242', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('4', 'Diego', 'Dominguez', '1961-11-01', 'Q32M48DLJZJLPK5ID', '9108955825', 'diego.dominguez@yahoo.com', '2418 Jefferson St', 'Montevideo', 'Montevideo', '53428', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('5', 'Juan', 'Sanchez', '1960-02-18', 'MEI1L3DC41TC1MISZ', '3344351416', 'juan.sanchez@yahoo.com', '3570 Cedar St', 'Guayaquil', 'Guayaquil', '21288', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('6', 'Felipe', 'Sanz', '1968-02-14', 'VIY65WO2ENSY0ZILG', '9784818771', 'felipe.sanz@outlook.com', '6026 Lincoln St', 'Cali', 'Cali', '85994', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('7', 'Claudia', 'Fernandez', '1971-12-20', '8AYIHM302ZEU9P1OR', '7545150790', 'claudia.fernandez@outlook.com', '5287 Lincoln St', 'Paysandu', 'Paysandu', '79962', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('8', 'Cristina', 'Fernandez', '1986-12-07', 'ABTGZ5HFWCY17OPS6', '9464338144', 'cristina.fernandez@yahoo.com', '9627 Oak St', 'Valencia', 'Valencia', '76329', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('9', 'Carlos', 'Perez', '1983-05-20', 'N9PB0G408ORS6DUTB', '7903666336', 'carlos.perez@yahoo.com', '4771 Pine St', 'Ciudad del Este', 'Ciudad del Este', '42544', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('10', 'Santiago', 'Martinez', '1994-12-20', '06L6KEYYJ6ZPRBUAW', '3662532518', 'santiago.martinez@gmail.com', '7734 Cedar St', 'Sao Paulo', 'Sao Paulo', '41303', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('11', 'Elena', 'Vazquez', '1976-02-20', 'T3OCN2HLDQ2A51CJ0', '8514577969', 'elena.vazquez@gmail.com', '9764 Washington St', 'Rosario', 'Rosario', '42495', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('12', 'Manuel', 'Gonzalez', '1969-11-01', 'I5WDXKD91IR6Y7NIC', '4163676988', 'manuel.gonzalez@gmail.com', '3511 Washington St', 'Ciudad del Este', 'Ciudad del Este', '89774', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('13', 'Antonio', 'Martinez', '1993-10-26', 'HP3399SATPJP3O2CO', '2899429044', 'antonio.martinez@gmail.com', '2291 Elm St', 'Arequipa', 'Arequipa', '19742', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('14', 'Paula', 'Blanco', '1990-10-08', 'E9E864TMA3QLR5QNF', '9257248943', 'paula.blanco@gmail.com', '2144 Maple St', 'Cochabamba', 'Cochabamba', '24135', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('15', 'Juan', 'Gomez', '1974-06-28', '4XDVO8N8953NOFKV7', '9095944260', 'juan.gomez@gmail.com', '9479 Elm St', 'Santa Cruz', 'Santa Cruz', '32865', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('16', 'Luis', 'Moreno', '1963-09-26', '7G6HNH1TNONYJ9J04', '5750324902', 'luis.moreno@outlook.com', '8036 Lincoln St', 'Brasilia', 'Brasilia', '92933', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('17', 'Isabella', 'Martinez', '1971-01-15', '6V0RPL29HD83D3BZM', '6228507524', 'isabella.martinez@gmail.com', '9704 Washington St', 'Santa Cruz', 'Santa Cruz', '42310', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('18', 'Maria', 'Rodriguez', '1955-03-03', 'NJL8CQV6KY04FZBRW', '6184485159', 'maria.rodriguez@yahoo.com', '3808 Cedar St', 'Santa Cruz', 'Santa Cruz', '10166', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('19', 'Silvia', 'Ramirez', '1963-12-06', '1BQV2GIB1MABINZMV', '7391725126', 'silvia.ramirez@yahoo.com', '4464 Cedar St', 'Rosario', 'Rosario', '55564', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('20', 'Juan', 'Gil', '1968-01-23', 'PQZ8W088VS6BE7KQB', '4738000896', 'juan.gil@outlook.com', '7225 Pine St', 'Salto', 'Salto', '50543', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('21', 'Rafael', 'Garcia', '1971-09-27', 'MXQELI68YTCFDPC1E', '6631184742', 'rafael.garcia@outlook.com', '9645 Jefferson St', 'Quito', 'Quito', '91789', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('22', 'Andrea', 'Dominguez', '1973-08-16', 'WOIT1SICQ7D91T13T', '5873561221', 'andrea.dominguez@gmail.com', '8201 Lincoln St', 'Santiago', 'Santiago', '16848', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('23', 'Carlos', 'Romero', '1998-12-12', 'ZKMVOCS3ENZWUTANA', '6296051074', 'carlos.romero@outlook.com', '8290 Pine St', 'Lima', 'Lima', '22335', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('24', 'Cristina', 'Gomez', '1987-12-17', '49DUQ3NO6QRJPJ7QH', '4771332635', 'cristina.gomez@yahoo.com', '2903 Washington St', 'Brasilia', 'Brasilia', '14595', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('25', 'Camila', 'Lopez', '1975-07-17', '69T977Q1250XV66A3', '1921243081', 'camila.lopez@yahoo.com', '9256 Main St', 'Santa Cruz', 'Santa Cruz', '94777', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('26', 'Cristina', 'Navarro', '1973-09-25', '94QPDGODMMGUXG9E4', '1448651675', 'cristina.navarro@gmail.com', '337 Main St', 'Rosario', 'Rosario', '51327', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('27', 'Diego', 'Alvarez', '1978-02-21', 'KG6BY87RTV95KBUGY', '9761497735', 'diego.alvarez@yahoo.com', '3786 Maple St', 'Santa Cruz', 'Santa Cruz', '39957', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('28', 'Maria', 'Gomez', '1981-11-22', '6FQ7J77VDH71YY66S', '3192253602', 'maria.gomez@yahoo.com', '3070 Maple St', 'Sao Paulo', 'Sao Paulo', '63996', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('29', 'Claudia', 'Castro', '1973-01-14', 'WWK17ZKRZL2FCEIEH', '6586189707', 'claudia.castro@yahoo.com', '3792 Cedar St', 'Salto', 'Salto', '68737', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('30', 'Andres', 'Castro', '1962-01-27', '347GLLRC8DGBEJLYG', '1275083172', 'andres.castro@gmail.com', '547 Pine St', 'Encarnacion', 'Encarnacion', '56792', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('31', 'Pablo', 'Fernandez', '1993-06-04', 'CAU9AIGN3BU5H4OX5', '0927773117', 'pablo.fernandez@yahoo.com', '4139 Jefferson St', 'Sao Paulo', 'Sao Paulo', '52775', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('32', 'Valentina', 'Gonzalez', '1968-11-24', 'VAOCLNPEXEJCZ2YXT', '8556307037', 'valentina.gonzalez@yahoo.com', '8977 Oak St', 'Quito', 'Quito', '54743', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('33', 'Santiago', 'Ortiz', '1956-01-30', 'PFZ1WRMDSC6HITHRD', '9561580458', 'santiago.ortiz@outlook.com', '9910 Maple St', 'Cali', 'Cali', '89721', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('34', 'Juan', 'Fernandez', '1977-02-13', '7ML7T8Q5MD2GX7NGJ', '5972149642', 'juan.fernandez@gmail.com', '4807 Main St', 'Cochabamba', 'Cochabamba', '43699', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('35', 'Carolina', 'Sanchez', '1982-03-20', 'JGDA0Q7Z0EX3B5ZFZ', '0272109187', 'carolina.sanchez@gmail.com', '9256 Washington St', 'Santiago', 'Santiago', '45530', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('36', 'Patricia', 'Moreno', '1998-02-27', 'GNVT3H4N5I8VMY76Q', '5795346322', 'patricia.moreno@yahoo.com', '2548 Jefferson St', 'Sao Paulo', 'Sao Paulo', '69549', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('37', 'Andres', 'Martinez', '1980-11-12', 'CT50LQE72FCK6D3O4', '9524772075', 'andres.martinez@gmail.com', '9510 Lincoln St', 'Arequipa', 'Arequipa', '58680', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('38', 'Silvia', 'Vazquez', '1980-11-12', 'ITB6M8RZ2MIO810PB', '9793843895', 'silvia.vazquez@yahoo.com', '7918 Main St', 'Caracas', 'Caracas', '85020', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('39', 'Rafael', 'Perez', '1991-03-06', 'VZ65DQUVAV9DZ129J', '5137568174', 'rafael.perez@outlook.com', '520 Maple St', 'Lima', 'Lima', '79286', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('40', 'Elena', 'Gutierrez', '1994-01-01', 'SIMD98HEMVJWNLKIR', '2397856720', 'elena.gutierrez@outlook.com', '3741 Maple St', 'Rio de Janeiro', 'Rio de Janeiro', '31854', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('41', 'Paula', 'Serrano', '1965-01-02', 'Q2F444SXGJ338KDLL', '0027785037', 'paula.serrano@yahoo.com', '5476 Cedar St', 'Cochabamba', 'Cochabamba', '78745', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('42', 'Alejandro', 'Ruiz', '1977-12-12', '0WCZ8T55LFNGSOAJJ', '3359890834', 'alejandro.ruiz@gmail.com', '1665 Lincoln St', 'Ciudad del Este', 'Ciudad del Este', '36699', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('43', 'Diego', 'Torres', '1959-07-06', '1HLCALH4EGK4XTRK2', '2837229726', 'diego.torres@yahoo.com', '5975 Jefferson St', 'Sao Paulo', 'Sao Paulo', '31703', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('44', 'Luis', 'Suarez', '1973-04-18', '5GHI7ZKU00CASCZV7', '8221472318', 'luis.suarez@yahoo.com', '4792 Oak St', 'Santiago', 'Santiago', '39498', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('45', 'Andrea', 'Alvarez', '1957-04-10', '2U0ZSRMGGWOP9EW48', '8428737332', 'andrea.alvarez@yahoo.com', '8362 Elm St', 'Rio de Janeiro', 'Rio de Janeiro', '35988', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('46', 'Veronica', 'Garcia', '2000-08-15', 'FLYB5EN5ZPG44ZW1G', '9997095942', 'veronica.garcia@yahoo.com', '3228 Washington St', 'Medellin', 'Medellin', '61178', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('47', 'Valentina', 'Castro', '1979-08-01', 'FZ8ZRYDG5DSE8J9I3', '0913258364', 'valentina.castro@outlook.com', '5135 Jefferson St', 'Bogota', 'Bogota', '38636', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('48', 'Claudia', 'Molina', '1961-04-19', '5AGP22VEESIEPVSVD', '0609039638', 'claudia.molina@outlook.com', '3068 Pine St', 'Montevideo', 'Montevideo', '88986', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('49', 'Carolina', 'Gonzalez', '1981-03-23', '6LFJQO0DSQN08RS51', '7157693800', 'carolina.gonzalez@gmail.com', '746 Washington St', 'Ciudad del Este', 'Ciudad del Este', '84495', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('50', 'Javier', 'Lopez', '1966-04-16', 'AM303NA4DU1OZF5Q3', '8387826840', 'javier.lopez@gmail.com', '5649 Main St', 'Cochabamba', 'Cochabamba', '41438', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('51', 'Antonio', 'Gil', '1980-09-09', 'CPJ0SL2TBU2W2IRGH', '0013202948', 'antonio.gil@yahoo.com', '9636 Lincoln St', 'Bogota', 'Bogota', '97715', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('52', 'Diego', 'Ortiz', '1959-09-15', 'UUFNNICX2P4XGDKWT', '9669939850', 'diego.ortiz@outlook.com', '579 Jefferson St', 'Rio de Janeiro', 'Rio de Janeiro', '81261', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('53', 'Miguel', 'Martin', '1967-06-13', 'GEJ9RJQWSXUESF67Z', '0159721236', 'miguel.martin@gmail.com', '3571 Pine St', 'Santiago', 'Santiago', '49973', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('54', 'Maria', 'Martin', '1974-02-18', '8TXSPBIJPC93EJ37B', '4718225200', 'maria.martin@yahoo.com', '8182 Washington St', 'Valencia', 'Valencia', '77671', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('55', 'Rafael', 'Romero', '1975-07-02', 'X4O2UKNRBJCQ9249D', '5607717539', 'rafael.romero@outlook.com', '2434 Maple St', 'Guayaquil', 'Guayaquil', '72653', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('56', 'Jose', 'Ramos', '1991-09-30', '62WXFS4RGRZEWMXVH', '6488785822', 'jose.ramos@yahoo.com', '193 Oak St', 'Cochabamba', 'Cochabamba', '34076', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('57', 'Andres', 'Torres', '1967-09-26', 'M53C9PYBN4FD32AF1', '6837999783', 'andres.torres@outlook.com', '374 Oak St', 'Valencia', 'Valencia', '13059', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('58', 'Manuel', 'Ortiz', '1992-08-19', 'VWT1V2Z58MQX8S2PV', '0241988168', 'manuel.ortiz@gmail.com', '6944 Oak St', 'Cali', 'Cali', '56280', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('59', 'Javier', 'Molina', '1951-08-17', '1EEEMIS07PLHYYFKR', '8875968554', 'javier.molina@outlook.com', '3524 Jefferson St', 'Guayaquil', 'Guayaquil', '28419', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('60', 'Antonio', 'Ruiz', '1950-09-09', 'J7ZVPPM0B0K7AD2SH', '6940553869', 'antonio.ruiz@outlook.com', '2288 Cedar St', 'Santiago', 'Santiago', '20582', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('61', 'Carolina', 'Garcia', '1978-06-21', 'TLC6OU6WFXCIUJJO4', '3653284380', 'carolina.garcia@yahoo.com', '7609 Oak St', 'Concepcion', 'Concepcion', '57226', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('62', 'Isabella', 'Sanchez', '1983-11-01', 'X3E9GJA1M0QNJQOPS', '8278931264', 'isabella.sanchez@outlook.com', '5649 Pine St', 'La Paz', 'La Paz', '50056', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('63', 'Fernando', 'Garcia', '1982-04-24', 'W5LT829B7OMNV7JYS', '8680836600', 'fernando.garcia@outlook.com', '6154 Jefferson St', 'Sao Paulo', 'Sao Paulo', '25475', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('64', 'Alejandro', 'Gil', '1965-08-04', '6CIV3JAUZB2JROUOO', '6715481254', 'alejandro.gil@yahoo.com', '8691 Elm St', 'Valparaiso', 'Valparaiso', '41163', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('65', 'Paula', 'Martinez', '1982-07-27', 'ZVSNDBZ15W45O8SOL', '0444828746', 'paula.martinez@yahoo.com', '4964 Oak St', 'Brasilia', 'Brasilia', '62213', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('66', 'Sofia', 'Sanz', '1999-01-23', 'PMRA8EVAPJJNTQ72Z', '1739080331', 'sofia.sanz@gmail.com', '6872 Cedar St', 'Trujillo', 'Trujillo', '17978', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('67', 'Carlos', 'Rubio', '1987-01-22', 'W9LDNRM02HNSK97BV', '8386888149', 'carlos.rubio@outlook.com', '4996 Washington St', 'Medellin', 'Medellin', '80489', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('68', 'Felipe', 'Gil', '1958-08-13', 'HR4J1N7KC7JYWTU8W', '6474732395', 'felipe.gil@gmail.com', '1122 Lincoln St', 'Concepcion', 'Concepcion', '36804', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('69', 'Ana', 'Medina', '1980-02-29', 'ZS2WSIGA2MUEA4EV1', '3121705420', 'ana.medina@outlook.com', '3761 Cedar St', 'Santiago', 'Santiago', '85576', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('70', 'Isabella', 'Alonso', '1950-12-25', '9NQ1IPLBC3WW4FUWY', '1792629480', 'isabella.alonso@yahoo.com', '3155 Lincoln St', 'Valparaiso', 'Valparaiso', '83108', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('71', 'Natalia', 'Dominguez', '1969-10-01', 'ASLI6U6UW6TB3CW4E', '6488724200', 'natalia.dominguez@yahoo.com', '9789 Main St', 'Lima', 'Lima', '48086', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('72', 'Valentina', 'Serrano', '1977-03-24', 'SS5N8XZLLMI9J7QOE', '5422876500', 'valentina.serrano@gmail.com', '1813 Pine St', 'La Paz', 'La Paz', '24397', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('73', 'Laura', 'Romero', '1993-09-10', 'MQWDN49W7H9IBU3JM', '5251030935', 'laura.romero@yahoo.com', '7956 Lincoln St', 'Maracaibo', 'Maracaibo', '92497', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('74', 'Ricardo', 'Fernandez', '1950-01-31', '14Q40VZXQY7OTUGCE', '5783748390', 'ricardo.fernandez@gmail.com', '8816 Jefferson St', 'La Paz', 'La Paz', '42223', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('75', 'Camila', 'Romero', '1979-12-02', '8MT1TJFQCWQRUGENW', '6997467474', 'camila.romero@outlook.com', '8850 Cedar St', 'Brasilia', 'Brasilia', '99806', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('76', 'Silvia', 'Perez', '1970-07-27', 'NDSFQ2OVP8UXOMIYD', '5005923765', 'silvia.perez@gmail.com', '1140 Washington St', 'Cali', 'Cali', '64867', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('77', 'Veronica', 'Fernandez', '1971-04-25', 'DH2V5PMRBFA4QNIBZ', '0603163969', 'veronica.fernandez@outlook.com', '8381 Maple St', 'Salto', 'Salto', '26200', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('78', 'Javier', 'Gil', '1957-09-05', 'ZHFBVW8Z4JAM2OJ6E', '1676628017', 'javier.gil@gmail.com', '1353 Main St', 'Rosario', 'Rosario', '43684', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('79', 'Rafael', 'Vazquez', '1999-01-21', 'BH9VLN9E4PTA2OBZO', '6828233325', 'rafael.vazquez@outlook.com', '2089 Jefferson St', 'Buenos Aires', 'Buenos Aires', '96578', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('80', 'Monica', 'Vazquez', '1963-04-10', 'DGFDJ9CJVE3GR34KD', '9710557078', 'monica.vazquez@yahoo.com', '6002 Main St', 'Montevideo', 'Montevideo', '62421', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('81', 'Maria', 'Lopez', '1999-10-03', 'UU3GQXWGEOY2MGFDX', '2719292053', 'maria.lopez@gmail.com', '9090 Lincoln St', 'Santa Cruz', 'Santa Cruz', '31654', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('82', 'Eduardo', 'Garcia', '1950-05-18', 'FY07TFZPRSFPOHT95', '3639624595', 'eduardo.garcia@gmail.com', '7878 Elm St', 'Guayaquil', 'Guayaquil', '62767', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('83', 'Carlos', 'Alvarez', '1955-07-20', 'YZXVRJCVPVFCXIT5H', '7650197511', 'carlos.alvarez@yahoo.com', '5017 Oak St', 'Caracas', 'Caracas', '85283', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('84', 'Daniela', 'Ramirez', '1996-01-24', 'HA1QNJ5X8NIWIMAW1', '8024960101', 'daniela.ramirez@gmail.com', '8459 Pine St', 'Rio de Janeiro', 'Rio de Janeiro', '20194', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('85', 'Silvia', 'Vazquez', '1982-11-27', 'AVGPUT4HC72WIH995', '0467138996', 'silvia.vazquez@outlook.com', '2407 Lincoln St', 'La Paz', 'La Paz', '69201', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('86', 'Isabella', 'Medina', '1965-12-03', 'NOKD4F5K9CVQJTIZC', '1075049053', 'isabella.medina@gmail.com', '3810 Cedar St', 'Medellin', 'Medellin', '69217', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('87', 'Isabella', 'Navarro', '1985-08-29', 'J4UQ616E5HB64NE16', '3204603222', 'isabella.navarro@gmail.com', '1709 Lincoln St', 'Brasilia', 'Brasilia', '25296', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('88', 'Ana', 'Sanchez', '1992-03-18', 'OTJF6KM6UELQLY0LA', '3411720397', 'ana.sanchez@yahoo.com', '848 Maple St', 'Quito', 'Quito', '42638', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('89', 'Antonio', 'Delgado', '1996-12-08', 'S5FMSN00P1V43OLYR', '7338594425', 'antonio.delgado@outlook.com', '3396 Maple St', 'Cuenca', 'Cuenca', '39693', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('90', 'Elena', 'Perez', '1988-04-23', 'NK9KM1NPOH4PU5BY5', '3617692637', 'elena.perez@yahoo.com', '7299 Elm St', 'Trujillo', 'Trujillo', '28626', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('91', 'Pedro', 'Marin', '1958-10-15', 'J71BIHTKYR814QVBH', '5559696144', 'pedro.marin@gmail.com', '8460 Oak St', 'Buenos Aires', 'Buenos Aires', '16529', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('92', 'Roberto', 'Sanchez', '1989-08-30', 'ZT4YL5NMKJJPOV9QA', '9562439239', 'roberto.sanchez@gmail.com', '9267 Maple St', 'Salto', 'Salto', '65571', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('93', 'Javier', 'Perez', '1952-08-03', '9CS7QGWQ33HCPO7KN', '0926866791', 'javier.perez@gmail.com', '6041 Oak St', 'Trujillo', 'Trujillo', '18974', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('94', 'Roberto', 'Gomez', '1969-10-06', '4PYH1L2B4JEIQSLNX', '9594525091', 'roberto.gomez@outlook.com', '7667 Cedar St', 'Rio de Janeiro', 'Rio de Janeiro', '37601', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('95', 'Eduardo', 'Romero', '1982-08-25', 'JR4HU7FH012Y35R25', '9752351157', 'eduardo.romero@outlook.com', '8721 Jefferson St', 'Ciudad del Este', 'Ciudad del Este', '25513', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('96', 'Manuel', 'Sanz', '1962-07-14', 'KW4ZL3TGMMFG10AAJ', '5394395061', 'manuel.sanz@yahoo.com', '4792 Elm St', 'Cordoba', 'Cordoba', '24117', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('97', 'Laura', 'Sanchez', '1956-11-25', '3F14Y90D4S9ESTKGX', '8239346748', 'laura.sanchez@gmail.com', '2863 Cedar St', 'Paysandu', 'Paysandu', '24805', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('98', 'Sofia', 'Ramos', '1964-07-12', 'NEW6DOQVE3IO92I8U', '4338982197', 'sofia.ramos@yahoo.com', '1979 Oak St', 'Sao Paulo', 'Sao Paulo', '65886', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('99', 'Andrea', 'Suarez', '1974-01-06', 'LZG3SIA15BOINUY27', '2066702782', 'andrea.suarez@outlook.com', '5022 Cedar St', 'Buenos Aires', 'Buenos Aires', '12042', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('100', 'Javier', 'Ruiz', '1974-11-14', 'ALDOGH5WY37N3KT8Q', '1125052721', 'javier.ruiz@outlook.com', '3793 Washington St', 'Rio de Janeiro', 'Rio de Janeiro', '31935', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('2', 'Andrea', 'Gil', '1985-08-10', 'A5ZKWONA3NKJ36XX9', '7527185712', 'andrea.gil@outlook.com', '4004 Pasaje Regional', 'Trujillo', 'Trujillo', '49896', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('3', 'Antonio', 'Rodriguez', '1956-10-29', 'BV59GWAJKNZ617EU3', '5988331653', 'antonio.rodriguez@outlook.com', '9325 Vereda Norte', 'Asuncion', 'Asuncion', '45966', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('4', 'Ana', 'Sanchez', '1976-10-02', '44XSWAXFN8S30ZWUV', '2213044732', 'ana.sanchez@outlook.com', '6776 Camino Local', 'Asuncion', 'Asuncion', '74297', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('5', 'Eduardo', 'Alonso', '1996-04-04', 'I644IHPZESEC4Q6DN', '4234335445', 'eduardo.alonso@yahoo.com', '7579 Calle Sur', 'Buenos Aires', 'Buenos Aires', '80698', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('6', 'Maria', 'Garcia', '1951-08-13', 'BLRQM5LKBLW9JQJIK', '4652171614', 'maria.garcia@yahoo.com', '1517 Calle Principal', 'Rosario', 'Rosario', '42661', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('7', 'Silvia', 'Serrano', '1952-10-05', 'SHEWXOH6KSVA6TJK2', '6545658864', 'silvia.serrano@yahoo.com', '4368 Diagonal Local', 'Santiago', 'Santiago', '48018', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('8', 'Sofia', 'Gomez', '1998-08-13', '56DNCOTTPLF5VMVBM', '1705420068', 'sofia.gomez@gmail.com', '3666 Vereda Secundaria', 'Cuenca', 'Cuenca', '41486', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('9', 'Monica', 'Diaz', '1982-07-11', 'YB5KANO4FBM29F5YK', '5352280988', 'monica.diaz@yahoo.com', '6094 Calle Secundaria', 'Lima', 'Lima', '32662', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('10', 'Santiago', 'Ruiz', '1997-12-28', 'R2XDAXVNBYK7D8WAI', '7344038958', 'santiago.ruiz@gmail.com', '9896 Circular Norte', 'Bogota', 'Bogota', '35222', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('11', 'Paula', 'Iglesias', '1981-02-18', 'YZ30ZYL8XLHD38JU9', '0529241130', 'paula.iglesias@gmail.com', '8404 Pasaje Regional', 'Asuncion', 'Asuncion', '74707', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('12', 'Camila', 'Ortiz', '1969-12-27', 'FYNZ5NGQ99T6P3X5P', '0883586363', 'camila.ortiz@gmail.com', '4469 Carrera Norte', 'Rio de Janeiro', 'Rio de Janeiro', '17159', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('13', 'Daniela', 'Ruiz', '1981-12-28', 'IHQ2QS0ND0CITIBLZ', '4856294948', 'daniela.ruiz@outlook.com', '281 Carrera Local', 'Bogota', 'Bogota', '77548', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('14', 'Silvia', 'Martinez', '1955-06-12', '2SVSXSZFD3JS65MLD', '4475557722', 'silvia.martinez@outlook.com', '1649 Avenida Sur', 'Concepcion', 'Concepcion', '61258', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('15', 'Eduardo', 'Gil', '1953-10-03', 'ZGBBHNEB7ER388E2D', '1941265499', 'eduardo.gil@gmail.com', '8897 Transversal Principal', 'Trujillo', 'Trujillo', '06967', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('16', 'Maria', 'Gomez', '2000-11-01', 'GJ1BXETDZO869ILU1', '4898324844', 'maria.gomez@gmail.com', '133 Diagonal Norte', 'Cochabamba', 'Cochabamba', '33130', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('17', 'Carolina', 'Moreno', '1965-12-25', 'TEWZM7ERJELEQVYN5', '5726053693', 'carolina.moreno@outlook.com', '7863 Vereda Oeste', 'Concepcion', 'Concepcion', '61571', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('18', 'Rafael', 'Ramos', '1954-03-16', '3JX1EI6Q0CMSG87S4', '2641732936', 'rafael.ramos@yahoo.com', '9081 Circular Central', 'Buenos Aires', 'Buenos Aires', '26800', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('19', 'Daniela', 'Fernandez', '1970-11-14', 'Z9GARNQ1WLWQFD20W', '9440976177', 'daniela.fernandez@yahoo.com', '6297 Circular Local', 'Cuenca', 'Cuenca', '41929', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('20', 'Gabriela', 'Garcia', '1999-02-11', 'FXV8I2HEE8XZEPFH3', '7171354509', 'gabriela.garcia@gmail.com', '4009 Calle Oeste', 'Cuenca', 'Cuenca', '41713', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('21', 'Silvia', 'Rubio', '1965-11-09', 'QN3R99TYOCK25LMMW', '6274885864', 'silvia.rubio@gmail.com', '5661 Diagonal Local', 'Buenos Aires', 'Buenos Aires', '13421', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('22', 'Manuel', 'Lopez', '1961-01-14', 'A0PWW46LN4XO5ZXBK', '3208446364', 'manuel.lopez@outlook.com', '977 Vereda Oeste', 'Valencia', 'Valencia', '42639', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('23', 'Andrea', 'Medina', '1961-02-14', 'RON8WVUZQR7GYVNKU', '2709620064', 'andrea.medina@gmail.com', '9016 Diagonal Oeste', 'Bogota', 'Bogota', '07727', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('24', 'Manuel', 'Gomez', '2000-09-23', 'S9PQ6H46WBHKZDEXZ', '1379401579', 'manuel.gomez@gmail.com', '8319 Avenida Sur', 'Trujillo', 'Trujillo', '82473', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('25', 'Paula', 'Ruiz', '1990-12-24', '3T46TTZAQZH4LI9DJ', '1062146611', 'paula.ruiz@gmail.com', '6940 Camino Central', 'Ciudad del Este', 'Ciudad del Este', '51620', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('26', 'Daniela', 'Perez', '2000-08-20', 'WT8JQIDPKACMNV8KV', '5997747512', 'daniela.perez@yahoo.com', '103 Diagonal Secundaria', 'Rosario', 'Rosario', '39717', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('27', 'Maria', 'Garcia', '1956-10-08', 'RZGER5TS7O7JWGSSB', '5206832164', 'maria.garcia@yahoo.com', '4762 Circular Principal', 'Salto', 'Salto', '89912', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('28', 'Elena', 'Vazquez', '1961-05-05', 'J15BYYA19SPULS2OH', '7618726865', 'elena.vazquez@yahoo.com', '6717 Calle Central', 'Cuenca', 'Cuenca', '81920', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('29', 'Santiago', 'Torres', '1994-11-16', 'YCT5LK6YEOXJMW6PO', '3260570831', 'santiago.torres@yahoo.com', '5308 Calle Norte', 'Bogota', 'Bogota', '68557', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('30', 'Andres', 'Torres', '1979-09-30', '2WN3Z3SI06AZK5SRV', '8162345849', 'andres.torres@outlook.com', '7630 Circular Principal', 'Asuncion', 'Asuncion', '36491', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('31', 'Daniela', 'Morales', '1979-05-01', 'DZ8MZ94CPAPJ67W39', '9429528686', 'daniela.morales@gmail.com', '189 Carrera Principal', 'Asuncion', 'Asuncion', '71098', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('32', 'Miguel', 'Fernandez', '1968-09-05', '8I4EAXBU435KUOWFI', '7979462929', 'miguel.fernandez@yahoo.com', '5015 Calle Sur', 'Buenos Aires', 'Buenos Aires', '27034', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('33', 'Sofia', 'Alonso', '1951-01-01', 'G7018SMOQ670ELIQX', '9869097962', 'sofia.alonso@yahoo.com', '3364 Camino Oeste', 'Bogota', 'Bogota', '23744', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('34', 'Silvia', 'Dominguez', '1988-01-22', 'FAEBUZCZLN3ZBEHY3', '3942265608', 'silvia.dominguez@outlook.com', '8111 Avenida Local', 'Cuenca', 'Cuenca', '41589', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('35', 'Ricardo', 'Gonzalez', '1993-01-29', 'RSB94HQ96YEAMBFLA', '8279284157', 'ricardo.gonzalez@gmail.com', '5671 Carrera Principal', 'Lima', 'Lima', '78840', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('36', 'Paula', 'Blanco', '1983-08-07', 'KMBEUM1EWI37AWWKU', '6808151975', 'paula.blanco@yahoo.com', '7939 Avenida Oeste', 'Rio de Janeiro', 'Rio de Janeiro', '05710', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('37', 'Rafael', 'Martinez', '1950-08-27', 'UTZROZ7V8TA3VFDC4', '4241664352', 'rafael.martinez@yahoo.com', '9648 Carrera Secundaria', 'Arequipa', 'Arequipa', '64510', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('38', 'Andres', 'Morales', '1972-02-02', 'WYH7H3O93J1VLR670', '0516293894', 'andres.morales@outlook.com', '6794 Vereda Sur', 'Buenos Aires', 'Buenos Aires', '95904', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('39', 'Rafael', 'Ramos', '1973-06-17', '7VQXHD2AAURWYPR1T', '3215642929', 'rafael.ramos@outlook.com', '7853 Pasaje Regional', 'Montevideo', 'Montevideo', '43284', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('40', 'Diego', 'Lopez', '1953-09-06', 'ROK0LF8D5VXVTH6O1', '7414101756', 'diego.lopez@outlook.com', '8121 Diagonal Local', 'Paysandu', 'Paysandu', '88915', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('41', 'Sofia', 'Rodriguez', '1993-04-25', 'B00PXOSHYVF5WIL4P', '0370873579', 'sofia.rodriguez@outlook.com', '7605 Vereda Secundaria', 'Buenos Aires', 'Buenos Aires', '51235', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('42', 'Andrea', 'Rubio', '1991-01-08', 'XF0TKAK3KTMDPHXK0', '8439749408', 'andrea.rubio@yahoo.com', '1931 Calle Principal', 'Cochabamba', 'Cochabamba', '64039', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('43', 'Cristina', 'Alvarez', '1989-01-08', '8RFUGA44144PO0K82', '8418693785', 'cristina.alvarez@gmail.com', '6259 Calle Secundaria', 'Rio de Janeiro', 'Rio de Janeiro', '61073', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('44', 'Miguel', 'Martin', '1984-01-12', 'A84F7ZBEXGQ0SICEC', '4721666584', 'miguel.martin@outlook.com', '7975 Carrera Local', 'Ciudad del Este', 'Ciudad del Este', '96445', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('45', 'Fernando', 'Castro', '1999-08-30', 'QFI8W5KDMHXQJRNY7', '2896508538', 'fernando.castro@yahoo.com', '9276 Vereda Secundaria', 'Ciudad del Este', 'Ciudad del Este', '10615', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('46', 'Felipe', 'Diaz', '1966-08-26', 'SO9NZTSH1G269RJ5H', '5586373987', 'felipe.diaz@outlook.com', '1447 Pasaje Regional', 'Cali', 'Cali', '51218', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('47', 'Veronica', 'Medina', '1975-03-29', '66RLBMNSNPFOYHG5X', '6867428315', 'veronica.medina@yahoo.com', '2557 Calle Regional', 'La Paz', 'La Paz', '56110', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('48', 'Luis', 'Ruiz', '1983-06-17', 'EVKZEGFRKNI45FXL5', '0723678047', 'luis.ruiz@yahoo.com', '5518 Camino Oeste', 'Caracas', 'Caracas', '64381', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('49', 'Daniela', 'Ortega', '1953-08-08', '8VXKGM3BRTX9IXI8P', '5663574133', 'daniela.ortega@outlook.com', '9061 Vereda Principal', 'Cordoba', 'Cordoba', '38903', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('50', 'Rafael', 'Diaz', '1982-06-23', 'O06HMGUQ9JMYG41RX', '1843944189', 'rafael.diaz@outlook.com', '1128 Vereda Secundaria', 'Cochabamba', 'Cochabamba', '44470', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('51', 'Javier', 'Rodriguez', '1952-04-06', '9XUPNFA6AQYLGTPI8', '1409872144', 'javier.rodriguez@yahoo.com', '3927 Avenida Secundaria', 'Santiago', 'Santiago', '94164', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('52', 'Ana', 'Gonzalez', '1978-05-13', 'DXFIW9KA6AA967VJQ', '8989762003', 'ana.gonzalez@yahoo.com', '7136 Transversal Secundaria', 'Arequipa', 'Arequipa', '58736', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('53', 'Antonio', 'Torres', '1950-03-13', 'TR73KO6LMYFYIZIVU', '6924004788', 'antonio.torres@yahoo.com', '16 Vereda Local', 'Paysandu', 'Paysandu', '22118', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('54', 'Antonio', 'Rodriguez', '1956-05-11', 'CDO1R92YEU6GIY0P8', '5692325013', 'antonio.rodriguez@yahoo.com', '1342 Transversal Principal', 'Quito', 'Quito', '08522', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('55', 'Valentina', 'Gonzalez', '1982-04-14', 'AAFPCT8E39Z6YX2G3', '8443134371', 'valentina.gonzalez@gmail.com', '7007 Diagonal Oeste', 'Encarnacion', 'Encarnacion', '42321', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('56', 'Valentina', 'Garcia', '1961-08-24', '0LDH23F46GZU7B1EI', '4249580987', 'valentina.garcia@yahoo.com', '9748 Carrera Oeste', 'Guayaquil', 'Guayaquil', '86253', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('57', 'Diego', 'Gonzalez', '1960-01-21', 'E1UBRE56HB1ZVXUBX', '2349560457', 'diego.gonzalez@outlook.com', '3307 Carrera Secundaria', 'Buenos Aires', 'Buenos Aires', '91387', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('58', 'Natalia', 'Romero', '1989-12-16', 'YYJQSSMK5EP2K61PL', '6510665324', 'natalia.romero@gmail.com', '2655 Transversal Oeste', 'Santiago', 'Santiago', '90679', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('59', 'Santiago', 'Vazquez', '1981-09-19', 'D5BN2NG3JRB6GOD4W', '3305773421', 'santiago.vazquez@gmail.com', '9170 Calle Sur', 'Sao Paulo', 'Sao Paulo', '34129', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('60', 'Claudia', 'Sanchez', '1978-05-10', 'J3FDKC9Y4R92H5MCF', '7499188564', 'claudia.sanchez@gmail.com', '387 Carrera Oeste', 'Sao Paulo', 'Sao Paulo', '90066', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('61', 'Gabriela', 'Rodriguez', '1991-04-28', 'TWG09TD9YXTIV411F', '7416563988', 'gabriela.rodriguez@gmail.com', '7917 Vereda Norte', 'Cordoba', 'Cordoba', '99677', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('62', 'Sofia', 'Rodriguez', '1991-01-06', 'V8PQJ8LU3VYKPS9JB', '2490454104', 'sofia.rodriguez@outlook.com', '1956 Carrera Este', 'Valencia', 'Valencia', '73893', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('63', 'Daniela', 'Martin', '1971-08-26', 'ZZ99ZN8C29L3G8FNW', '8962318499', 'daniela.martin@yahoo.com', '9506 Avenida Oeste', 'Lima', 'Lima', '19565', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('64', 'Roberto', 'Martinez', '1960-09-16', 'LXU20THKFK3Z7SP55', '6374171922', 'roberto.martinez@outlook.com', '6876 Pasaje Local', 'Buenos Aires', 'Buenos Aires', '28461', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('65', 'Fernando', 'Iglesias', '1999-09-28', '4527GCF36IR1NMG8C', '7580693853', 'fernando.iglesias@gmail.com', '3293 Carrera Secundaria', 'Bogota', 'Bogota', '74829', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('66', 'Pablo', 'Delgado', '1981-04-20', '20P0ETRB7ZT3FXDHT', '9686496507', 'pablo.delgado@yahoo.com', '5112 Avenida Central', 'Paysandu', 'Paysandu', '08067', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('67', 'Diego', 'Castro', '1972-04-30', 'WZC3SI1NPEK57CSQP', '5156462294', 'diego.castro@yahoo.com', '3408 Pasaje Central', 'Arequipa', 'Arequipa', '11238', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('68', 'Veronica', 'Rubio', '1951-03-13', 'B80RO6Q8FNRF6HF0V', '7667548802', 'veronica.rubio@outlook.com', '6354 Camino Norte', 'Montevideo', 'Montevideo', '12550', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('69', 'Veronica', 'Ramos', '1972-10-27', 'PK1AP3O551DXCGNQM', '7686563491', 'veronica.ramos@gmail.com', '7174 Circular Principal', 'Bogota', 'Bogota', '70649', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('70', 'Miguel', 'Perez', '1998-04-14', 'YTHPAVDWJ8JDYEYCC', '8137456019', 'miguel.perez@outlook.com', '6271 Carrera Secundaria', 'Bogota', 'Bogota', '10750', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('71', 'Ricardo', 'Suarez', '1992-11-27', '4CXAG3S3OTLYRD5DE', '4828586010', 'ricardo.suarez@outlook.com', '653 Transversal Secundaria', 'Sao Paulo', 'Sao Paulo', '20318', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('72', 'Andres', 'Delgado', '2000-07-07', 'NK5OMTLEKR3P3AHPP', '7119611038', 'andres.delgado@outlook.com', '4972 Circular Oeste', 'La Paz', 'La Paz', '17749', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('73', 'Juan', 'Alvarez', '1972-01-16', '9SDXOT38PQV2APU8O', '0551526293', 'juan.alvarez@yahoo.com', '6765 Calle Este', 'Caracas', 'Caracas', '00222', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('74', 'Natalia', 'Diaz', '1971-12-28', '614Z8H103UO1X9VYG', '4989039327', 'natalia.diaz@gmail.com', '7929 Camino Regional', 'Rio de Janeiro', 'Rio de Janeiro', '16061', 'Brazil')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('75', 'Jose', 'Ortiz', '1960-03-31', 'T9Y1O8GIT3RJE5MD7', '6499101885', 'jose.ortiz@yahoo.com', '17 Diagonal Central', 'Arequipa', 'Arequipa', '64712', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('76', 'Andrea', 'Suarez', '1997-04-03', 'N8W9Y9GGCY9FQZQCM', '6065649375', 'andrea.suarez@outlook.com', '2706 Circular Secundaria', 'Cordoba', 'Cordoba', '12695', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('77', 'Fernando', 'Torres', '1961-01-12', 'G6DVLMMS2CAYO0BJN', '8760254136', 'fernando.torres@gmail.com', '6889 Diagonal Secundaria', 'Buenos Aires', 'Buenos Aires', '69417', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('78', 'Daniela', 'Ortega', '1972-07-18', '8YNDM7NU4VGZ6K9O8', '2410729611', 'daniela.ortega@outlook.com', '1962 Camino Oeste', 'Concepcion', 'Concepcion', '38796', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('79', 'Valentina', 'Molina', '1950-03-24', '6XHLGTAYVHJB2FYIF', '5229656528', 'valentina.molina@gmail.com', '4303 Camino Este', 'Medellin', 'Medellin', '21153', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('80', 'Claudia', 'Gil', '1973-05-07', '28E7O5M7XGZI43G8U', '6062020168', 'claudia.gil@yahoo.com', '237 Camino Norte', 'Quito', 'Quito', '09965', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('81', 'Rafael', 'Blanco', '1952-05-07', 'RB8420NQY9LDN7WS2', '5104811699', 'rafael.blanco@yahoo.com', '1901 Camino Regional', 'Arequipa', 'Arequipa', '43695', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('82', 'Ana', 'Dominguez', '1987-12-31', '0A29FJ19DPW6HRYF4', '4214904587', 'ana.dominguez@outlook.com', '874 Transversal Sur', 'Valencia', 'Valencia', '84478', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('83', 'Patricia', 'Dominguez', '1997-10-12', 'S0T0W64HK8I4DAWTH', '1033469282', 'patricia.dominguez@yahoo.com', '4796 Carrera Secundaria', 'Caracas', 'Caracas', '65730', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('84', 'Silvia', 'Gil', '1970-10-23', 'K3PEV8CF00XJCZ6SB', '1129907940', 'silvia.gil@yahoo.com', '9349 Transversal Sur', 'Cochabamba', 'Cochabamba', '03991', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('85', 'Eduardo', 'Torres', '1996-08-25', 'ZB6WTL1WU7279GD9F', '2133610275', 'eduardo.torres@yahoo.com', '7747 Diagonal Secundaria', 'Quito', 'Quito', '42943', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('86', 'Laura', 'Alvarez', '1950-06-18', 'ZBUJCA31J3M0YUO2O', '5367221689', 'laura.alvarez@outlook.com', '7460 Diagonal Regional', 'Ciudad del Este', 'Ciudad del Este', '00191', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('87', 'Jose', 'Torres', '1996-12-15', 'V9HJ2VAN43Y47LPAY', '0998409770', 'jose.torres@gmail.com', '1527 Circular Central', 'Asuncion', 'Asuncion', '96581', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('88', 'Ricardo', 'Romero', '1985-06-05', '4GJHFHA4GIV2GM4I2', '4325293953', 'ricardo.romero@outlook.com', '8484 Transversal Principal', 'Trujillo', 'Trujillo', '04300', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('89', 'Daniela', 'Martinez', '1976-12-26', 'N2R1EIQHEURLVSFTE', '8578841162', 'daniela.martinez@yahoo.com', '6341 Camino Secundaria', 'Concepcion', 'Concepcion', '12634', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('90', 'Veronica', 'Ramirez', '1959-01-09', 'Z7SCO74ZWRWUSDUH2', '6591252156', 'veronica.ramirez@gmail.com', '7625 Camino Regional', 'Santa Cruz', 'Santa Cruz', '00923', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('91', 'Luis', 'Martin', '1981-04-22', 'CMZBTMN5XE1UXQYTV', '4830788972', 'luis.martin@yahoo.com', '1812 Diagonal Principal', 'Cordoba', 'Cordoba', '52698', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('92', 'Veronica', 'Iglesias', '1977-03-27', 'GE8HAY93SOKV5SZ32', '5263871175', 'veronica.iglesias@yahoo.com', '6373 Pasaje Este', 'Encarnacion', 'Encarnacion', '66981', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('93', 'Manuel', 'Rubio', '1997-10-22', 'DDGKYA9AD2DXHW3W3', '0993854139', 'manuel.rubio@outlook.com', '1473 Camino Secundaria', 'Santa Cruz', 'Santa Cruz', '00593', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('94', 'Valentina', 'Castro', '1960-01-08', '0H7QGSNNEIPQH5OV1', '2486151586', 'valentina.castro@gmail.com', '9546 Circular Oeste', 'Buenos Aires', 'Buenos Aires', '44570', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('95', 'Andrea', 'Moreno', '1970-09-26', '3CBAO5Z1ICHBG6ZBV', '6710523675', 'andrea.moreno@gmail.com', '3390 Pasaje Norte', 'Buenos Aires', 'Buenos Aires', '32635', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('96', 'Pablo', 'Marin', '1968-02-09', 'ZRWHZ40D3V0OCJQVY', '9789017701', 'pablo.marin@gmail.com', '9370 Avenida Central', 'Asuncion', 'Asuncion', '23789', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('97', 'Miguel', 'Martinez', '1959-07-16', 'QUATPKU40M455F8T5', '5393207575', 'miguel.martinez@yahoo.com', '2284 Carrera Sur', 'Guayaquil', 'Guayaquil', '07953', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('98', 'Natalia', 'Lopez', '1998-06-12', '56KKN5TO9TJQSNQOK', '5130223568', 'natalia.lopez@outlook.com', '4339 Pasaje Sur', 'Cuenca', 'Cuenca', '28287', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('99', 'Valentina', 'Sanchez', '1971-12-25', '37XCIU2SG4WIR7F6Y', '1125982301', 'valentina.sanchez@yahoo.com', '2543 Circular Regional', 'Valparaiso', 'Valparaiso', '90906', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('100', 'Carlos', 'Gomez', '2000-07-28', 'BWGIKQGIWP3EDM8RT', '7039761744', 'carlos.gomez@yahoo.com', '6980 Transversal Este', 'Rosario', 'Rosario', '84961', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('101', 'Mariana', 'Rodriguez', '1970-01-10', 'FD0TVBDIVUZZPQK51', '2654235116', 'mariana.rodriguez@yahoo.com', '5981 Ruta Principal', 'Guadalajara', 'Guadalajara', '89131', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('102', 'Florencia', 'Martinez', '1961-03-14', '9NT3W5UZBIKCIDKWN', '5534192832', 'florencia.martinez@live.com', '6316 Pasaje San Martin', 'Maracay', 'Maracay', '38785', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('103', 'Natalia', 'Lopez', '1978-04-20', 'OC6UZHR5XFF0T0PVN', '2871012269', 'natalia.lopez@yahoo.com', '6404 Transversal Independencia', 'Quito', 'Quito', '71348', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('104', 'Emilio', 'Vega', '1998-03-05', '11MKFAZZ81SDW4SHN', '2880957015', 'emilio.vega@icloud.com', '4023 Calle Oeste', 'Buenos Aires', 'Buenos Aires', '84364', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('105', 'Isabel', 'Perez', '1997-10-16', '1ERTJ5PHT0HL9XPSE', '3150983930', 'isabel.perez@yahoo.com', '1064 Av. Sur', 'Caracas', 'Caracas', '14117', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('106', 'Oscar', 'Gonzalez', '1974-12-26', 'YHE7UR23GDPPQ0Y9D', '6513338726', 'oscar.gonzalez@outlook.com', '4663 Transversal Oeste', 'Encarnacion', 'Encarnacion', '19880', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('107', 'Esther', 'Vega', '1998-07-01', '4874FRHOCN9J2QP89', '8723430980', 'esther.vega@proton.me', '1036 Calle Independencia', 'Santiago', 'Santiago', '72493', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('108', 'Sofia', 'Lopez', '1966-09-03', 'CC5O7UUBCXULJYLJE', '4751079911', 'sofia.lopez@hotmail.com', '8388 Pasaje Este', 'Asuncion', 'Asuncion', '55745', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('109', 'Gabriela', 'Cruz', '1964-02-26', 'PTK93TYT7D5J60FKH', '5348740164', 'gabriela.cruz@gmail.com', '158 Pasaje Este', 'Trujillo', 'Trujillo', '93507', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('110', 'Florencia', 'Rivera', '1988-05-15', 'UE8YFBNTPBN78BMYY', '5869232260', 'florencia.rivera@outlook.com', '5542 Ruta Regional', 'Maracay', 'Maracay', '97806', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('111', 'Diana', 'Gutierrez', '1984-04-27', '54I3QK2IAGL58KXO9', '8501429401', 'diana.gutierrez@mail.com', '5763 Boulevard Principal', 'Bogota', 'Bogota', '67199', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('112', 'Mariana', 'Castillo', '1972-11-07', 'BPS3Y70HP87WXE6SY', '5648236629', 'mariana.castillo@icloud.com', '6753 Circular Norte', 'Santa Cruz', 'Santa Cruz', '49829', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('113', 'Ignacio', 'Reyes', '2004-06-05', 'XQPHR62GDSWM31YIH', '0037917693', 'ignacio.reyes@mail.com', '8199 Transversal Oeste', 'Rivera', 'Rivera', '29342', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('114', 'Alejandro', 'Guerrero', '1969-08-19', 'G8SBI4Q2Y9V86WZS3', '8727743487', 'alejandro.guerrero@hotmail.com', '4599 Transversal Sur', 'Antofagasta', 'Antofagasta', '47450', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('115', 'Cristian', 'Gutierrez', '1998-06-17', 'CFNFHOLQC3O18A5UR', '5466889373', 'cristian.gutierrez@icloud.com', '7240 Transversal Norte', 'Trujillo', 'Trujillo', '60968', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('116', 'Patricia', 'Pena', '1991-12-07', '79T6VXDP5GJLQM5K8', '6417080531', 'patricia.pena@gmail.com', '608 Av. Oeste', 'Salto', 'Salto', '12671', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('117', 'Ricardo', 'Cruz', '1960-04-06', 'UHZ1GV0E38DALY8OZ', '1931491905', 'ricardo.cruz@mail.com', '6171 Calle San Martin', 'Barranquilla', 'Barranquilla', '94874', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('118', 'Patricia', 'Garcia', '1959-06-21', 'PN6QFGSXW71Q3VLI7', '4737996507', 'patricia.garcia@proton.me', '3079 Transversal Oeste', 'Maldonado', 'Maldonado', '56507', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('119', 'Florencia', 'Medina', '1974-10-14', 'USGIOTIRZQAKOIXNT', '5685574443', 'florencia.medina@yahoo.com', '3255 Pasaje Sur', 'Tijuana', 'Tijuana', '80236', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('120', 'Victor', 'Diaz', '1974-10-22', '09SKDGIGATJ9TZE5R', '0947775204', 'victor.diaz@live.com', '1969 Ruta Sur', 'Ambato', 'Ambato', '62521', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('121', 'Laura', 'Gonzalez', '1963-08-12', 'FUK9E1V2ISQP49KWV', '1334123281', 'laura.gonzalez@outlook.com', '143 Transversal Libertad', 'La Paz', 'La Paz', '87832', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('122', 'Ines', 'Chavez', '1975-11-06', 'ZZQY72WX7PTX63CFL', '9471746488', 'ines.chavez@live.com', '7272 Calle Independencia', 'Cordoba', 'Cordoba', '15224', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('123', 'Diego', 'Valdez', '1972-06-18', 'AIY4VA13U1GSPK9P3', '1756551256', 'diego.valdez@live.com', '4822 Boulevard Regional', 'Chiclayo', 'Chiclayo', '82102', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('124', 'Camila', 'Mendoza', '1972-08-23', 'L8OS9XTOGN1W1HT7P', '7109324808', 'camila.mendoza@mail.com', '1627 Av. Sur', 'Concepcion', 'Concepcion', '70482', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('125', 'Nicolas', 'Acosta', '1976-03-08', 'SJ49ITN7S55J2O7S3', '4499727875', 'nicolas.acosta@proton.me', '9142 Ruta San Martin', 'Barranquilla', 'Barranquilla', '59441', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('126', 'Gloria', 'Herrera', '2001-04-19', 'N4OLR6N92XF8E8LD4', '1870262174', 'gloria.herrera@proton.me', '6612 Boulevard Sur', 'Guayaquil', 'Guayaquil', '53065', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('127', 'Vanessa', 'Herrera', '1953-03-22', 'WIYKID91ZDFKBLCMP', '3869222196', 'vanessa.herrera@hotmail.com', '8253 Circular Este', 'Maracay', 'Maracay', '40433', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('128', 'Hugo', 'Dominguez', '1972-11-27', 'Y6QKTC89K8YQK94DN', '5944064090', 'hugo.dominguez@live.com', '4789 Ruta Oeste', 'Puebla', 'Puebla', '89569', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('129', 'Silvia', 'Morales', '1972-06-26', 'YZX4W6XLPU0DK0GET', '5884247451', 'silvia.morales@live.com', '1333 Av. Oeste', 'Manta', 'Manta', '98647', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('130', 'Xavier', 'Vega', '1985-05-26', 'ATQYYV37DIA5U6HC3', '4612004711', 'xavier.vega@hotmail.com', '8907 Av. Regional', 'Lima', 'Lima', '69459', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('131', 'Ulises', 'Pena', '2002-09-10', '0FODRO8BNP84DYT9M', '6431713900', 'ulises.pena@proton.me', '4090 Av. Independencia', 'San Lorenzo', 'San Lorenzo', '36896', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('132', 'Gabriela', 'Guerrero', '2002-08-10', 'H5LF6A4FEJGXAA2IL', '2402681177', 'gabriela.guerrero@proton.me', '8508 Circular Sur', 'Encarnacion', 'Encarnacion', '69245', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('133', 'Adrian', 'Suarez', '1977-01-22', 'Q8CROYR6CCVCJWTL9', '8478961183', 'adrian.suarez@mail.com', '7498 Av. Regional', 'La Plata', 'La Plata', '54424', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('134', 'Gloria', 'Jimenez', '1978-01-15', 'PXNF7C3DD03UVULEM', '6049451983', 'gloria.jimenez@outlook.com', '8000 Av. Sur', 'Montevideo', 'Montevideo', '55890', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('135', 'Ulises', 'Ramirez', '1970-04-16', '3493WXA73JGZLMA5U', '6120183667', 'ulises.ramirez@proton.me', '2678 Pasaje Central', 'Tijuana', 'Tijuana', '52517', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('136', 'Isabel', 'Lopez', '2005-06-06', 'BCPPVOHSMDYVSLH9B', '3432445107', 'isabel.lopez@mail.com', '2978 Av. Regional', 'Medellin', 'Medellin', '79806', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('137', 'Bianca', 'Silva', '1956-06-19', 'O0PQCLPOXKO8G8QYN', '6136968164', 'bianca.silva@proton.me', '3730 Pasaje Este', 'Ciudad del Este', 'Ciudad del Este', '20011', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('138', 'Mariana', 'Rojas', '1981-05-06', 'M8XFDJGF1C8WQUUY5', '9552717744', 'mariana.rojas@gmail.com', '5866 Circular Sur', 'Encarnacion', 'Encarnacion', '50685', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('139', 'Hugo', 'Alvarez', '1983-01-30', '3C54WSQT26Q3XLRFC', '1518203778', 'hugo.alvarez@outlook.com', '6062 Pasaje Central', 'Buenos Aires', 'Buenos Aires', '60779', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('140', 'Alberto', 'Medina', '1980-01-09', 'CDYK0X65MUFM8ZOV7', '4865281685', 'alberto.medina@gmail.com', '6040 Pasaje Este', 'La Paz', 'La Paz', '38074', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('141', 'Patricia', 'Hernandez', '1962-05-05', 'FK2ST0SX5WVFGYW6Z', '0653794738', 'patricia.hernandez@hotmail.com', '5170 Ruta Libertad', 'Guayaquil', 'Guayaquil', '35430', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('142', 'Ulises', 'Campos', '1991-06-03', '12SPFHV5BRN7ZSEDF', '7826137506', 'ulises.campos@gmail.com', '6595 Circular Principal', 'Sucre', 'Sucre', '40903', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('143', 'William', 'Perez', '1952-07-12', 'LDZMFB7R31QW6AHF7', '9861434103', 'william.perez@mail.com', '7589 Calle Sur', 'Arequipa', 'Arequipa', '75513', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('144', 'Andres', 'Dominguez', '1971-09-15', 'ZKAMUGYSM8T2SA5BN', '5405153195', 'andres.dominguez@outlook.com', '826 Pasaje San Martin', 'Luque', 'Luque', '54374', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('145', 'Ursula', 'Campos', '1966-05-09', '3C1QKBHB7S9TJ1GM2', '5415667652', 'ursula.campos@live.com', '8251 Pasaje San Martin', 'Barquisimeto', 'Barquisimeto', '44959', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('146', 'Isabel', 'Fuentes', '1988-08-19', 'V3TLCXLVPYMB5M9J9', '0165820297', 'isabel.fuentes@gmail.com', '2168 Calle Oeste', 'Montevideo', 'Montevideo', '94562', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('147', 'Teresa', 'Vargas', '1952-11-27', 'VY8N1UTOXIE0RNUJJ', '7394731217', 'teresa.vargas@outlook.com', '7392 Calle Principal', 'Rivera', 'Rivera', '97535', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('148', 'Raul', 'Contreras', '1998-08-22', 'KKFZZGNI92IRMUQ9E', '1146786691', 'raul.contreras@outlook.com', '5294 Boulevard Sur', 'Vina del Mar', 'Vina del Mar', '68979', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('149', 'Hugo', 'Campos', '1961-07-07', '52XG8P6BEFFLZM764', '4384249818', 'hugo.campos@outlook.com', '9796 Circular Este', 'Ciudad del Este', 'Ciudad del Este', '32439', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('150', 'Patricia', 'Castro', '1957-04-15', 'BXUX1OXRWK8R2YKCC', '7677359255', 'patricia.castro@proton.me', '6632 Av. Principal', 'Buenos Aires', 'Buenos Aires', '77499', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('151', 'Luis', 'Herrera', '1960-12-28', 'JIDKNWI5FLUL1RSRL', '0168733950', 'luis.herrera@gmail.com', '4709 Transversal Independencia', 'Ambato', 'Ambato', '95755', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('152', 'Ines', 'Chavez', '1959-08-24', 'P501NOUHTCS1K9YE9', '6558523986', 'ines.chavez@gmail.com', '842 Calle Este', 'Asuncion', 'Asuncion', '53652', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('153', 'Ines', 'Rojas', '2004-05-22', '6F7LOW4VSSRURALDO', '4097499309', 'ines.rojas@live.com', '2893 Circular Independencia', 'Maracaibo', 'Maracaibo', '59832', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('154', 'Quintina', 'Campos', '2001-05-14', '8DALFYO1750CEHLXS', '5278585497', 'quintina.campos@hotmail.com', '4138 Pasaje San Martin', 'Quito', 'Quito', '49124', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('155', 'Adrian', 'Ramos', '1993-11-14', 'LM72JEYN9382KKZMP', '4733848421', 'adrian.ramos@hotmail.com', '4072 Calle San Martin', 'Guadalajara', 'Guadalajara', '39579', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('156', 'Bianca', 'Lopez', '1979-08-20', 'ZD1AT7O75RH8LX6DU', '8026206724', 'bianca.lopez@gmail.com', '251 Pasaje Independencia', 'Antofagasta', 'Antofagasta', '89007', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('157', 'Luis', 'Medina', '1998-09-28', 'S6ESJ3L0XZAMKYGVW', '6685161227', 'luis.medina@proton.me', '4164 Calle Central', 'Puebla', 'Puebla', '60275', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('158', 'Cristian', 'Alvarez', '1977-02-02', 'UUJMIYQFY751YW7NH', '2727956878', 'cristian.alvarez@hotmail.com', '4154 Boulevard Independencia', 'Monterrey', 'Monterrey', '20730', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('159', 'Felipe', 'Rojas', '2000-08-12', 'E36HTF4PYZR6QCEOU', '8740640391', 'felipe.rojas@gmail.com', '7041 Pasaje Sur', 'Lima', 'Lima', '80931', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('160', 'Fernando', 'Gonzalez', '1975-10-04', 'O119XP9N56NYXTXMG', '8682300478', 'fernando.gonzalez@mail.com', '8815 Transversal Oeste', 'Caracas', 'Caracas', '42441', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('161', 'Gloria', 'Aguilar', '1966-11-29', '70E3P15AHDBVZB0OI', '3028439599', 'gloria.aguilar@proton.me', '3981 Pasaje Este', 'Cali', 'Cali', '96535', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('162', 'Adrian', 'Moreno', '1955-06-21', 'UV0GYUBMXNSZOKGTI', '3427086688', 'adrian.moreno@outlook.com', '6463 Av. Central', 'Monterrey', 'Monterrey', '36651', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('163', 'Oscar', 'Acosta', '1983-04-17', 'D0GJYV5G10UR5L8A7', '1739363854', 'oscar.acosta@mail.com', '7739 Circular Principal', 'Antofagasta', 'Antofagasta', '50425', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('164', 'Florencia', 'Vargas', '1991-10-23', 'D9Q46NOUHFJ7UPFLN', '3785477725', 'florencia.vargas@outlook.com', '2393 Boulevard San Martin', 'San Lorenzo', 'San Lorenzo', '74004', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('165', 'Victor', 'Delgado', '1953-01-13', '4C3BAEWCFHQCW76XA', '8860084840', 'victor.delgado@mail.com', '3037 Calle Sur', 'La Plata', 'La Plata', '78732', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('166', 'Ricardo', 'Cruz', '1997-03-25', 'JM2C8QIZK3C9XBONR', '0217659180', 'ricardo.cruz@hotmail.com', '3563 Ruta Independencia', 'Manta', 'Manta', '72324', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('167', 'Gustavo', 'Martinez', '1998-09-20', 'UB7L8V1ZOCFI4O6L1', '2185016315', 'gustavo.martinez@mail.com', '5447 Calle Central', 'Concepcion', 'Concepcion', '69054', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('168', 'Laura', 'Morales', '1983-09-06', 'PYXDW2ZCFZW0LDALM', '4121267888', 'laura.morales@mail.com', '1792 Calle Sur', 'Chiclayo', 'Chiclayo', '56388', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('169', 'Javier', 'Molina', '1984-07-24', 'AO20U9ISYGJJFGJK2', '5437993712', 'javier.molina@icloud.com', '210 Transversal Principal', 'Cochabamba', 'Cochabamba', '91289', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('170', 'Vanessa', 'Medina', '1988-08-19', '349EL8HL88KZRUIN3', '6519398280', 'vanessa.medina@live.com', '3534 Transversal Central', 'Valencia', 'Valencia', '19064', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('171', 'Alberto', 'Campos', '1977-03-03', 'IXZ2C9ROS7YT2M6TW', '1135290965', 'alberto.campos@mail.com', '1835 Calle Sur', 'Maracaibo', 'Maracaibo', '43913', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('172', 'Adrian', 'Silva', '2002-01-30', 'YHNQYYF9RK7D30MM2', '8757177514', 'adrian.silva@gmail.com', '1985 Calle Principal', 'Luque', 'Luque', '94930', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('173', 'Luis', 'Campos', '1996-04-17', 'GFU8IOGXPBWHVNZH1', '1918255371', 'luis.campos@icloud.com', '8119 Circular Principal', 'Medellin', 'Medellin', '88246', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('174', 'William', 'Suarez', '1960-04-01', 'M4W3ZKWDEEKGYSPEN', '2782827422', 'william.suarez@proton.me', '7489 Circular Norte', 'Rivera', 'Rivera', '57059', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('175', 'Ana', 'Hernandez', '1984-06-12', '8SRYO4RCB1KJTGQ01', '8819148580', 'ana.hernandez@live.com', '9051 Av. Regional', 'Medellin', 'Medellin', '23423', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('176', 'Diana', 'Ramos', '1973-07-30', 'M3P91I3VMZWFFHHCM', '4982544948', 'diana.ramos@yahoo.com', '2321 Ruta Regional', 'Mendoza', 'Mendoza', '17770', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('177', 'Helena', 'Acosta', '1972-05-26', 'FLI4OFWWNC21O0Z5Q', '7590175186', 'helena.acosta@hotmail.com', '7139 Ruta Oeste', 'Medellin', 'Medellin', '74843', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('178', 'Gustavo', 'Herrera', '1999-02-07', 'UURMYBD2QE4PA8HYE', '4241541520', 'gustavo.herrera@mail.com', '5105 Boulevard Oeste', 'Monterrey', 'Monterrey', '66260', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('179', 'Javier', 'Contreras', '1969-02-23', 'REIYAZ39PECN0DL5E', '2218909275', 'javier.contreras@hotmail.com', '2580 Transversal Independencia', 'Santiago', 'Santiago', '99989', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('180', 'Esther', 'Reyes', '1962-07-24', '1VN8LFJDTVV2Y4XKS', '8364037613', 'esther.reyes@live.com', '9830 Calle San Martin', 'Santiago', 'Santiago', '11581', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('181', 'Teresa', 'Herrera', '2000-12-28', 'PTGQ9CVAH78OKZ1PO', '8892414183', 'teresa.herrera@outlook.com', '8888 Pasaje Regional', 'Barranquilla', 'Barranquilla', '86865', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('182', 'Gabriela', 'Ramos', '1955-03-13', 'I7EWBXXGAEARMS3JN', '4105648149', 'gabriela.ramos@yahoo.com', '8228 Transversal San Martin', 'Salto', 'Salto', '57202', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('183', 'Fernando', 'Hernandez', '1982-12-27', 'F16YE0A4ABN7G8B2Z', '6353654195', 'fernando.hernandez@yahoo.com', '8325 Boulevard Norte', 'Santa Cruz', 'Santa Cruz', '33507', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('184', 'Adrian', 'Rojas', '1956-03-08', '551LDQNK20IN8910T', '3206038505', 'adrian.rojas@gmail.com', '6264 Ruta Central', 'Mendoza', 'Mendoza', '23624', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('185', 'Yolanda', 'Rojas', '1994-02-21', '89FKBI4O6Q0USWOVC', '2344565574', 'yolanda.rojas@hotmail.com', '1323 Av. Este', 'Ambato', 'Ambato', '86638', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('186', 'Luis', 'Flores', '1990-05-02', 'QOT8HLJEFY3ZB4LDI', '5680442067', 'luis.flores@hotmail.com', '1651 Transversal Sur', 'Valparaiso', 'Valparaiso', '28322', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('187', 'Nicolas', 'Garcia', '1961-09-23', 'HOY7DV7C9HX3D43E7', '0296670662', 'nicolas.garcia@proton.me', '3617 Av. Central', 'Cordoba', 'Cordoba', '46681', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('188', 'Felipe', 'Flores', '2005-07-20', 'WXR5RDNPX2I9TANZR', '7598564205', 'felipe.flores@hotmail.com', '580 Ruta Central', 'La Plata', 'La Plata', '17679', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('189', 'Ines', 'Rojas', '1970-11-19', '9DXJ37C9H42M44GV3', '5905992937', 'ines.rojas@icloud.com', '2976 Transversal Norte', 'Chiclayo', 'Chiclayo', '21830', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('190', 'Fernando', 'Morales', '1951-10-16', 'SA7HEZ74LAV71448N', '6915452267', 'fernando.morales@proton.me', '2954 Boulevard San Martin', 'Santa Cruz', 'Santa Cruz', '90440', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('191', 'Silvia', 'Morales', '1983-12-12', 'LYE088O98BV78HU7F', '1355215704', 'silvia.morales@hotmail.com', '4188 Boulevard Sur', 'Santa Cruz', 'Santa Cruz', '55938', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('192', 'Emilio', 'Sanchez', '1984-08-16', 'PPFO5MN32U1IQ2BAJ', '1152621815', 'emilio.sanchez@live.com', '607 Transversal Este', 'Buenos Aires', 'Buenos Aires', '89602', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('193', 'Diego', 'Rivera', '1979-09-15', 'HGZZ0JKIBU4FMPKXV', '3103241714', 'diego.rivera@mail.com', '7815 Transversal Central', 'Buenos Aires', 'Buenos Aires', '21945', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('194', 'William', 'Gomez', '1983-02-21', 'GBPJ4UFZDY3O1ICNS', '8793741608', 'william.gomez@outlook.com', '2070 Ruta Libertad', 'Cusco', 'Cusco', '32659', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('195', 'Tomas', 'Reyes', '1953-10-30', 'P9P9W4J66CNOLJQ52', '9986162299', 'tomas.reyes@yahoo.com', '1830 Circular Sur', 'Guayaquil', 'Guayaquil', '47498', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('196', 'Raul', 'Moreno', '1993-07-25', 'URGOWYOO5YBRJNM2L', '7132475469', 'raul.moreno@yahoo.com', '3179 Transversal Oeste', 'Puebla', 'Puebla', '63368', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('197', 'Laura', 'Guerrero', '1955-01-16', 'SFLSE45BG34IQ7ZJ3', '8610357972', 'laura.guerrero@live.com', '9715 Circular Principal', 'Ciudad del Este', 'Ciudad del Este', '55121', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('198', 'Sofia', 'Ortiz', '1952-06-18', 'NFU84XYJOA21A6XVA', '4944665743', 'sofia.ortiz@live.com', '5050 Boulevard San Martin', 'Concepcion', 'Concepcion', '91737', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('199', 'Xavier', 'Navarro', '1995-11-22', '984UVKYRMJLJX8XGS', '3096520744', 'xavier.navarro@mail.com', '6728 Transversal Norte', 'Santiago', 'Santiago', '86418', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('200', 'Walter', 'Medina', '1992-09-05', '6YS445GDEJ31GYMDM', '4655494717', 'walter.medina@gmail.com', '9661 Circular Independencia', 'Manta', 'Manta', '19334', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('201', 'Ines', 'Diaz', '1984-03-29', 'TO5F9M969F5GCL9LC', '7432927129', 'ines.diaz@mail.com', '7135 Transversal Regional', 'Asuncion', 'Asuncion', '72573', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('202', 'William', 'Garcia', '1967-11-22', '0861TAA0I5LDSLCB8', '7898562575', 'william.garcia@hotmail.com', '2801 Ruta Regional', 'La Plata', 'La Plata', '12506', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('203', 'Bianca', 'Morales', '1951-12-20', 'VGNXB5JTB9XXAYPNT', '7230461849', 'bianca.morales@outlook.com', '6962 Ruta Sur', 'Medellin', 'Medellin', '77054', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('204', 'Nicolas', 'Chavez', '1994-08-27', 'HHJSHZKBRH7LAY64Y', '2181143744', 'nicolas.chavez@live.com', '920 Calle Este', 'Santiago', 'Santiago', '15170', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('205', 'Julia', 'Vargas', '1960-05-25', 'D1B4XGMPW5D3GO8JN', '7621202169', 'julia.vargas@live.com', '9421 Boulevard Libertad', 'Cusco', 'Cusco', '33758', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('206', 'Vanessa', 'Aguilar', '1961-09-21', 'RR5PCXA5S00I85SYW', '6375628900', 'vanessa.aguilar@outlook.com', '8383 Ruta Libertad', 'La Paz', 'La Paz', '74990', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('207', 'Tomas', 'Gonzalez', '1971-08-12', 'LKSTN3CPUDRL90AOB', '8019948837', 'tomas.gonzalez@proton.me', '6053 Ruta Norte', 'Valencia', 'Valencia', '39218', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('208', 'Gloria', 'Medina', '2003-10-29', 'RXZE1HM38KSZBFFZZ', '1493316373', 'gloria.medina@proton.me', '1865 Ruta Regional', 'Luque', 'Luque', '16094', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('209', 'Nicolas', 'Alvarez', '1995-03-27', 'ERTB74RS7GU0ENV5S', '6693465472', 'nicolas.alvarez@outlook.com', '6862 Circular San Martin', 'Maracay', 'Maracay', '49179', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('210', 'Manuel', 'Contreras', '1968-01-09', 'HZY7EZ9GTWZ1UU7ZY', '8460810620', 'manuel.contreras@gmail.com', '3375 Pasaje Este', 'Encarnacion', 'Encarnacion', '47567', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('211', 'Emilio', 'Flores', '1968-04-20', '1B3D5050UI22KX7N8', '5800439735', 'emilio.flores@hotmail.com', '3270 Pasaje Libertad', 'Rosario', 'Rosario', '33255', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('212', 'Hector', 'Gomez', '1960-09-15', 'NPUEVJLZFFLB7WXRU', '5158328182', 'hector.gomez@mail.com', '8997 Circular Regional', 'Cartagena', 'Cartagena', '22051', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('213', 'Raul', 'Morales', '1979-09-14', 'MH1T939AYQ6WW8YL6', '1648408588', 'raul.morales@live.com', '8075 Calle Central', 'Cuenca', 'Cuenca', '95397', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('214', 'Walter', 'Herrera', '1958-08-11', 'G8TACY15PDTZ91X70', '2075011024', 'walter.herrera@yahoo.com', '9520 Ruta Oeste', 'Asuncion', 'Asuncion', '43901', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('215', 'Alberto', 'Castillo', '1988-11-06', 'LOEAZC0B4MSKYVK7N', '0728326842', 'alberto.castillo@icloud.com', '6213 Calle San Martin', 'Barquisimeto', 'Barquisimeto', '82754', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('216', 'Quintina', 'Ramirez', '2001-05-19', 'VT8K06MOXSFH4GG24', '8781414139', 'quintina.ramirez@live.com', '5520 Pasaje Este', 'Buenos Aires', 'Buenos Aires', '97988', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('217', 'Cristian', 'Sanchez', '1956-04-06', '6LQWLVUNLPAIH0P4E', '5777547812', 'cristian.sanchez@yahoo.com', '4697 Ruta Este', 'Tijuana', 'Tijuana', '80597', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('218', 'Ximena', 'Ortiz', '1951-09-03', '4W3U1HBJ6TXFO6V4E', '8816580392', 'ximena.ortiz@outlook.com', '7410 Av. Este', 'Santiago', 'Santiago', '84233', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('219', 'Quintina', 'Valdez', '1953-08-17', 'HRCNBH6NQQB9LZS34', '4989266591', 'quintina.valdez@icloud.com', '6265 Av. San Martin', 'Valencia', 'Valencia', '63194', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('220', 'Silvia', 'Aguilar', '2004-03-16', 'A5PISKFFV3XOLEYRV', '6030299228', 'silvia.aguilar@gmail.com', '9476 Av. Norte', 'Barquisimeto', 'Barquisimeto', '31802', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('221', 'Florencia', 'Gomez', '2003-10-09', '8W5038HVQRHOFU1WS', '2579913662', 'florencia.gomez@yahoo.com', '371 Av. San Martin', 'San Lorenzo', 'San Lorenzo', '76107', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('222', 'Bruno', 'Flores', '1965-12-01', 'RWB2SEREV361XSNBT', '3765991624', 'bruno.flores@live.com', '3909 Ruta Sur', 'La Paz', 'La Paz', '47128', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('223', 'Alberto', 'Ortiz', '1950-08-22', 'UEAXYLNFXJ4PNJY1O', '8725887449', 'alberto.ortiz@proton.me', '6622 Boulevard Este', 'Quito', 'Quito', '96413', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('224', 'Nicolas', 'Valdez', '1964-07-07', 'DS22WYBOW23QVDJNV', '6698490277', 'nicolas.valdez@gmail.com', '3404 Ruta San Martin', 'Ambato', 'Ambato', '47487', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('225', 'Walter', 'Martinez', '1996-04-11', 'ZWYMX9DJOYOHAZ7T0', '8955439376', 'walter.martinez@gmail.com', '4377 Av. Regional', 'Oruro', 'Oruro', '76353', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('226', 'Luis', 'Vega', '1976-05-26', 'MESJT2JPNRIM1Y65R', '4163356588', 'luis.vega@gmail.com', '4414 Av. Central', 'Vina del Mar', 'Vina del Mar', '22190', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('227', 'Yasmin', 'Campos', '1999-10-02', '7RM6J8Y6RH05HHIWF', '1117908075', 'yasmin.campos@proton.me', '8166 Circular Central', 'Lima', 'Lima', '74330', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('228', 'Victor', 'Guerrero', '1985-09-11', 'HUB2RTSOYG9ZQYAHU', '5594284347', 'victor.guerrero@proton.me', '6095 Av. Libertad', 'Ciudad del Este', 'Ciudad del Este', '65567', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('229', 'Yolanda', 'Moreno', '1985-12-09', 'KGEUIDJIPNF8F3GR9', '8857448906', 'yolanda.moreno@yahoo.com', '2776 Calle Oeste', 'Trujillo', 'Trujillo', '43330', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('230', 'Ines', 'Dominguez', '1980-01-10', 'JMU3MOMYVUXT9KLS1', '7169472256', 'ines.dominguez@mail.com', '1268 Calle Este', 'Antofagasta', 'Antofagasta', '55039', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('231', 'Bianca', 'Herrera', '1973-12-30', 'VO5270SQG4EIJ00HO', '1178006811', 'bianca.herrera@icloud.com', '2644 Calle Regional', 'Trujillo', 'Trujillo', '50549', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('232', 'Bianca', 'Cruz', '1961-05-05', 'E4BX4LR9TJQ8ZGVWW', '9688457831', 'bianca.cruz@live.com', '5144 Pasaje Regional', 'Puebla', 'Puebla', '44053', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('233', 'Ricardo', 'Ramos', '1996-12-13', '34MQA78RAPKIANOUO', '2663416389', 'ricardo.ramos@icloud.com', '4764 Boulevard San Martin', 'Buenos Aires', 'Buenos Aires', '45235', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('234', 'Alberto', 'Diaz', '1962-04-04', 'KWWJWGABTGDJZ0IFR', '5647570512', 'alberto.diaz@gmail.com', '4466 Ruta Regional', 'Valparaiso', 'Valparaiso', '19356', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('235', 'Ines', 'Gomez', '1984-03-26', '3E1I1P0BQ1S9RYLLW', '0881474350', 'ines.gomez@hotmail.com', '1950 Av. Regional', 'Cuenca', 'Cuenca', '52534', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('236', 'Ana', 'Rivera', '1960-09-25', 'OI8UYYF1IRYM81CMF', '8127358573', 'ana.rivera@gmail.com', '6289 Pasaje Este', 'Tijuana', 'Tijuana', '42859', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('237', 'Daniel', 'Hernandez', '1976-06-10', 'TRUTLQ5V4FTQ3TQ1S', '2095935186', 'daniel.hernandez@hotmail.com', '8686 Boulevard Libertad', 'Maracay', 'Maracay', '82281', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('238', 'Ricardo', 'Suarez', '1986-10-07', 'XDSC4E5HRDU4XSZJN', '9103717058', 'ricardo.suarez@mail.com', '6146 Ruta Norte', 'Monterrey', 'Monterrey', '90862', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('239', 'Gustavo', 'Rojas', '1977-04-07', 'CHSDINGXU8UU01UYZ', '6122868528', 'gustavo.rojas@live.com', '5872 Pasaje San Martin', 'Buenos Aires', 'Buenos Aires', '52553', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('240', 'Ulises', 'Moreno', '2004-08-01', 'ITNT0MQ8ABKAE6A9H', '5048889921', 'ulises.moreno@gmail.com', '7642 Pasaje Este', 'Paysandu', 'Paysandu', '28141', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('241', 'Florencia', 'Vargas', '1970-11-26', 'JKUUHCLRR6Z3DXB3N', '0556613906', 'florencia.vargas@gmail.com', '5093 Circular Norte', 'Santa Cruz', 'Santa Cruz', '51853', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('242', 'Ricardo', 'Herrera', '1963-09-29', 'B0OQVSHKOECUBODS1', '2278376938', 'ricardo.herrera@hotmail.com', '4070 Calle Central', 'Encarnacion', 'Encarnacion', '66369', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('243', 'Natalia', 'Campos', '1960-02-05', 'YPMLVAK9W9PFB3HN1', '1103924051', 'natalia.campos@icloud.com', '7473 Transversal Norte', 'La Paz', 'La Paz', '53499', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('244', 'Yolanda', 'Valdez', '1968-04-14', 'T1TW9ZYN6SJCHZJQ8', '1645104636', 'yolanda.valdez@yahoo.com', '5268 Transversal Independencia', 'Encarnacion', 'Encarnacion', '79672', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('245', 'Javier', 'Gomez', '1991-02-02', 'UZB7KR0AYMK99JCJN', '0843256216', 'javier.gomez@hotmail.com', '6937 Av. Independencia', 'Manta', 'Manta', '30021', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('246', 'Claudia', 'Ramos', '1990-04-19', 'THET25LZSE99F77LU', '1252056647', 'claudia.ramos@icloud.com', '2589 Ruta Oeste', 'Cochabamba', 'Cochabamba', '23994', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('247', 'Olivia', 'Gomez', '2005-05-08', 'JUIIYMYRSVZN4REGB', '0463331279', 'olivia.gomez@live.com', '5423 Ruta Libertad', 'La Plata', 'La Plata', '42346', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('248', 'Claudia', 'Jimenez', '1984-02-16', 'ZO7UTXZBDQ55IT9BN', '0347644726', 'claudia.jimenez@icloud.com', '993 Boulevard San Martin', 'La Plata', 'La Plata', '28643', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('249', 'Hugo', 'Acosta', '1994-12-01', 'E27ZEOQGVZHQJY62Z', '1117518689', 'hugo.acosta@outlook.com', '6304 Circular Regional', 'Caracas', 'Caracas', '15754', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('250', 'Tomas', 'Medina', '1964-07-18', '5GZPL1QWEEHWJQ4TA', '7339776719', 'tomas.medina@gmail.com', '4109 Circular Central', 'Santa Cruz', 'Santa Cruz', '91233', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('251', 'Yolanda', 'Lopez', '1954-12-10', 'XB4Y4K7BPGYVYV2GQ', '9501455616', 'yolanda.lopez@yahoo.com', '4897 Transversal Este', 'Medellin', 'Medellin', '25993', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('252', 'Helena', 'Medina', '1997-01-25', 'HHCU9TD0V2ZP4JUW7', '9978772934', 'helena.medina@hotmail.com', '125 Calle Norte', 'San Lorenzo', 'San Lorenzo', '70933', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('253', 'Nicolas', 'Valdez', '1987-03-14', 'OMUWAHK2LSLAYM0WB', '2355770272', 'nicolas.valdez@live.com', '8897 Pasaje Libertad', 'Manta', 'Manta', '64257', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('254', 'Fernando', 'Rojas', '1978-04-22', 'TAUL62CF4MNTFVGE2', '4504617357', 'fernando.rojas@icloud.com', '3641 Circular Central', 'Tijuana', 'Tijuana', '32939', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('255', 'Mariana', 'Vargas', '1958-04-23', 'PARSG70S1F537YE0Q', '8104091570', 'mariana.vargas@yahoo.com', '8629 Ruta Central', 'Cordoba', 'Cordoba', '12946', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('256', 'Lucia', 'Dominguez', '1967-12-29', 'GJLPEFJAWSHMLFZKI', '1495870207', 'lucia.dominguez@gmail.com', '1835 Transversal Norte', 'Cuenca', 'Cuenca', '21287', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('257', 'Claudia', 'Jimenez', '2003-03-07', 'WYQMLH13C71UD2ZDL', '7733294562', 'claudia.jimenez@proton.me', '5420 Transversal Libertad', 'Cartagena', 'Cartagena', '13966', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('258', 'Gabriela', 'Ruiz', '1992-12-10', 'QG1VED32LX2TOOWT9', '6153966958', 'gabriela.ruiz@hotmail.com', '2935 Boulevard Sur', 'Concepcion', 'Concepcion', '85260', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('259', 'Laura', 'Ramirez', '1991-07-13', 'LDQLOVYV3LXCHFU13', '2278469973', 'laura.ramirez@hotmail.com', '5287 Pasaje Independencia', 'Oruro', 'Oruro', '99071', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('260', 'Kevin', 'Romero', '2002-04-12', 'A9OEKNTBZ3M55IZOL', '6666832723', 'kevin.romero@mail.com', '6002 Ruta Regional', 'Lima', 'Lima', '30220', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('261', 'Ignacio', 'Pena', '1951-01-16', 'CAZRP9DXOQ2VPGSTQ', '5326909738', 'ignacio.pena@icloud.com', '6831 Circular Independencia', 'Medellin', 'Medellin', '58099', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('262', 'Camila', 'Martinez', '1983-01-25', 'ERYF0992QC6DR08CW', '9490580778', 'camila.martinez@live.com', '9503 Boulevard Principal', 'Sucre', 'Sucre', '65183', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('263', 'Silvia', 'Chavez', '1953-03-03', 'ZVK2JWUUXK0AREC2J', '9444019292', 'silvia.chavez@live.com', '6158 Ruta Este', 'Guadalajara', 'Guadalajara', '44242', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('264', 'Cristian', 'Hernandez', '1952-12-20', 'MDF7FR91IPWH0MX1E', '2767478366', 'cristian.hernandez@live.com', '4402 Av. San Martin', 'Cartagena', 'Cartagena', '66981', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('265', 'Ana', 'Chavez', '1978-04-28', '8YB7W8P74MJDXO100', '9385258001', 'ana.chavez@gmail.com', '6837 Calle San Martin', 'Barquisimeto', 'Barquisimeto', '23619', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('266', 'Felipe', 'Aguilar', '1972-08-07', 'GAD7X48WZE4EX6U86', '2447174654', 'felipe.aguilar@outlook.com', '1312 Pasaje Norte', 'Cuenca', 'Cuenca', '60174', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('267', 'William', 'Medina', '1973-09-29', 'GC9HOXDTPWDPJBC01', '0720064256', 'william.medina@gmail.com', '8544 Boulevard Libertad', 'Rosario', 'Rosario', '72670', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('268', 'Diego', 'Jimenez', '1970-04-06', 'A83RU7MYOW8DT8CQ1', '3280634615', 'diego.jimenez@live.com', '1490 Boulevard Libertad', 'Vina del Mar', 'Vina del Mar', '34833', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('269', 'Pablo', 'Martinez', '2003-03-13', 'IN2XR838AMMZOHXS7', '8293102707', 'pablo.martinez@gmail.com', '4076 Boulevard Este', 'Quito', 'Quito', '11882', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('270', 'Ursula', 'Dominguez', '1958-09-24', 'QGV3DR2H2P39YL9UE', '3092511426', 'ursula.dominguez@outlook.com', '6160 Circular Este', 'Rosario', 'Rosario', '67496', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('271', 'Diana', 'Navarro', '1958-12-20', '2WNF5CA7ZVKY2REFJ', '7632909279', 'diana.navarro@yahoo.com', '5034 Pasaje Regional', 'Cordoba', 'Cordoba', '10599', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('272', 'Cristian', 'Diaz', '1958-08-02', 'W59SQWHBEF46RF7BN', '3645970108', 'cristian.diaz@outlook.com', '2689 Ruta Norte', 'Vina del Mar', 'Vina del Mar', '73577', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('273', 'Mariana', 'Gonzalez', '2003-03-05', 'UP06IDIIOH6CVBPHV', '2652735435', 'mariana.gonzalez@outlook.com', '625 Boulevard Independencia', 'Ambato', 'Ambato', '17818', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('274', 'Helena', 'Torres', '1991-02-21', 'P1HKF286UTIOS5HRQ', '0633569392', 'helena.torres@gmail.com', '6944 Calle Norte', 'Antofagasta', 'Antofagasta', '71689', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('275', 'Camila', 'Romero', '1992-12-30', '3ZDRC1YOHMI9AYFQU', '9077262570', 'camila.romero@yahoo.com', '6405 Boulevard Principal', 'San Lorenzo', 'San Lorenzo', '79588', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('276', 'Camila', 'Chavez', '2004-12-13', 'T22C50B8Y5DNWNGUC', '3253817933', 'camila.chavez@proton.me', '5878 Pasaje San Martin', 'Paysandu', 'Paysandu', '99158', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('277', 'Claudia', 'Gutierrez', '1983-06-13', 'MRSEZYTKW2837C6QC', '2411241272', 'claudia.gutierrez@hotmail.com', '8630 Boulevard Norte', 'Buenos Aires', 'Buenos Aires', '48426', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('278', 'Bruno', 'Campos', '1992-07-07', 'MPXKC5I8XOMXLVZ4Q', '4924243754', 'bruno.campos@gmail.com', '2530 Pasaje Central', 'Encarnacion', 'Encarnacion', '69759', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('279', 'Tomas', 'Suarez', '1975-08-04', 'GGZ62FE9UPNHZX9FQ', '2841067275', 'tomas.suarez@outlook.com', '170 Boulevard San Martin', 'Cartagena', 'Cartagena', '76507', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('280', 'Oscar', 'Acosta', '1976-01-02', '819Y207MERBYEAWHM', '5093983430', 'oscar.acosta@yahoo.com', '8921 Ruta Libertad', 'Puebla', 'Puebla', '98744', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('281', 'Javier', 'Silva', '1994-01-01', 'LV76MF4NNKM95D0P9', '7426629912', 'javier.silva@hotmail.com', '5068 Transversal San Martin', 'Salto', 'Salto', '53963', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('282', 'Gabriela', 'Navarro', '1950-08-05', 'O6OUZ1EGNTB34KUQA', '0244714627', 'gabriela.navarro@hotmail.com', '566 Calle Central', 'Montevideo', 'Montevideo', '74625', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('283', 'Gabriela', 'Molina', '1993-02-08', 'U5WRYESU4FCL5EFJP', '5044818321', 'gabriela.molina@outlook.com', '9008 Pasaje Principal', 'Chiclayo', 'Chiclayo', '99780', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('284', 'Kevin', 'Gutierrez', '1997-12-11', 'U3ASNRM6DFHG6W3ST', '8167112075', 'kevin.gutierrez@icloud.com', '6040 Av. Libertad', 'Lima', 'Lima', '88335', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('285', 'Patricia', 'Gomez', '1960-08-22', 'I4FIEECY2C11BD2SC', '1401401193', 'patricia.gomez@hotmail.com', '3127 Boulevard Principal', 'Ciudad de Mexico', 'Ciudad de Mexico', '13835', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('286', 'Javier', 'Flores', '1981-03-16', 'M42WSC31TZ8G1A077', '7592712566', 'javier.flores@hotmail.com', '8525 Av. Regional', 'Tijuana', 'Tijuana', '24790', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('287', 'Manuel', 'Ramirez', '1996-08-17', 'E1ZUBLEKVL9PTK4GC', '7520716781', 'manuel.ramirez@yahoo.com', '2448 Transversal Regional', 'Caracas', 'Caracas', '87405', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('288', 'Luis', 'Valdez', '1982-08-19', '9MV9E40KZUJ2XORVO', '7842711477', 'luis.valdez@hotmail.com', '2305 Calle Sur', 'Bogota', 'Bogota', '16927', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('289', 'Gabriela', 'Hernandez', '1984-04-30', 'VLKW1XSRQKRST3TA1', '6167567700', 'gabriela.hernandez@outlook.com', '9220 Boulevard Central', 'Cordoba', 'Cordoba', '31514', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('290', 'Laura', 'Romero', '1984-11-27', 'RDYXYUR4SOR8WM9LB', '0255905616', 'laura.romero@proton.me', '5955 Transversal Principal', 'Cali', 'Cali', '17398', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('291', 'Diana', 'Cruz', '2003-02-28', 'DY5EGTBXPSPAQALUL', '1713578529', 'diana.cruz@icloud.com', '6052 Transversal Oeste', 'Cuenca', 'Cuenca', '75136', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('292', 'Hector', 'Delgado', '1973-10-15', 'B9OI0D4DMC2RH2XK2', '6853664987', 'hector.delgado@outlook.com', '404 Boulevard San Martin', 'Cuenca', 'Cuenca', '34450', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('293', 'Miguel', 'Reyes', '1997-10-17', '34670CHQI014O46W4', '4424936312', 'miguel.reyes@hotmail.com', '553 Av. Central', 'Valencia', 'Valencia', '70838', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('294', 'Laura', 'Vega', '1953-04-27', 'HJB2JTXB02B6LKC86', '1623198189', 'laura.vega@icloud.com', '8233 Calle Oeste', 'Maldonado', 'Maldonado', '88619', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('295', 'Nicolas', 'Herrera', '1984-12-25', '307HDHJO5CTZETRIJ', '2575409003', 'nicolas.herrera@icloud.com', '9155 Transversal Central', 'Chiclayo', 'Chiclayo', '93748', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('296', 'Teresa', 'Campos', '1971-03-17', '4N6O9JD3IH66W51OB', '1776561248', 'teresa.campos@yahoo.com', '5864 Transversal Independencia', 'Vina del Mar', 'Vina del Mar', '81791', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('297', 'Natalia', 'Mendoza', '1966-06-26', 'W2EOWLCFS8314Y2LR', '2429543165', 'natalia.mendoza@outlook.com', '6547 Transversal Independencia', 'Buenos Aires', 'Buenos Aires', '39423', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('298', 'Andres', 'Rodriguez', '1970-07-09', '69HZGOPJDN8EZP7QY', '1333447626', 'andres.rodriguez@hotmail.com', '9931 Av. Central', 'Luque', 'Luque', '98760', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('299', 'Walter', 'Moreno', '1963-02-04', 'B9IQIUXDQ59OHNPVC', '8005375990', 'walter.moreno@gmail.com', '4255 Circular Independencia', 'Barranquilla', 'Barranquilla', '59930', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('300', 'Kevin', 'Jimenez', '2000-03-14', 'BGGRMQDZPJL9R9KMP', '4948562572', 'kevin.jimenez@live.com', '971 Av. Este', 'Arequipa', 'Arequipa', '17152', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('301', 'Bianca', 'Gomez', '1973-05-07', 'FQE6RP9UQEZFMHK40', '4993908926', 'bianca.gomez@yahoo.com', '4133 Ruta Libertad', 'Mendoza', 'Mendoza', '98723', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('302', 'Karina', 'Medina', '1960-12-11', 'OV84FC3XQ8VA8X8L0', '9230450189', 'karina.medina@mail.com', '1616 Transversal Central', 'Rosario', 'Rosario', '33332', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('303', 'Cristian', 'Jimenez', '1968-09-06', 'F2K1XERP3LYEX3SR5', '7499616592', 'cristian.jimenez@mail.com', '7079 Calle Norte', 'Santiago', 'Santiago', '77284', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('304', 'Patricia', 'Mendoza', '1994-06-09', 'SXDQC2K9YKIPUT7SS', '6179454918', 'patricia.mendoza@gmail.com', '1966 Boulevard Libertad', 'Guayaquil', 'Guayaquil', '33534', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('305', 'Victor', 'Jimenez', '1987-05-06', '5KVQYWJ85GG0V5DTA', '1027769749', 'victor.jimenez@proton.me', '6571 Ruta Central', 'Buenos Aires', 'Buenos Aires', '21486', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('306', 'Olivia', 'Torres', '1960-01-16', '3ZGARFI44TD1FPE60', '7770793349', 'olivia.torres@mail.com', '934 Pasaje Norte', 'Cordoba', 'Cordoba', '23456', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('307', 'Diego', 'Moreno', '2003-06-16', '09BOS0765ICAUTJX6', '1795760243', 'diego.moreno@live.com', '5733 Transversal Oeste', 'Maracay', 'Maracay', '76536', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('308', 'Adrian', 'Navarro', '1992-01-11', 'EKZ83Y0224WK0YEHV', '1674338005', 'adrian.navarro@icloud.com', '5949 Boulevard Este', 'Chiclayo', 'Chiclayo', '32900', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('309', 'Camila', 'Gonzalez', '1960-03-23', 'WEIJMMB5JFYSYZ7PQ', '1199180812', 'camila.gonzalez@yahoo.com', '3465 Pasaje Este', 'Cusco', 'Cusco', '48289', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('310', 'Esther', 'Guerrero', '1958-11-28', 'FN3EH81A4RKGJZOWI', '8632666785', 'esther.guerrero@gmail.com', '7351 Av. Norte', 'San Lorenzo', 'San Lorenzo', '77809', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('311', 'Gabriela', 'Perez', '1986-01-13', '9FC1XX6CWZXSKOYTK', '5504892673', 'gabriela.perez@live.com', '5756 Ruta Regional', 'Trujillo', 'Trujillo', '35859', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('312', 'Kevin', 'Perez', '1980-01-04', 'OZ5STHSLMWA6TJ3KP', '8105485101', 'kevin.perez@live.com', '4981 Circular Norte', 'La Plata', 'La Plata', '69394', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('313', 'Patricia', 'Cruz', '1997-11-04', '4IKY3UFN0DSG2QFPO', '1062737158', 'patricia.cruz@mail.com', '9737 Circular San Martin', 'Oruro', 'Oruro', '61744', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('314', 'Florencia', 'Navarro', '1989-06-25', 'Y80PFSRQ8STZQBFU7', '1961159408', 'florencia.navarro@outlook.com', '2029 Pasaje Central', 'Barquisimeto', 'Barquisimeto', '59081', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('315', 'Kevin', 'Chavez', '1962-10-26', 'FVB66H3REM5PUU62R', '9228777251', 'kevin.chavez@mail.com', '6444 Av. Regional', 'Caracas', 'Caracas', '54433', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('316', 'Daniel', 'Pena', '1957-12-10', '5ZU2ZUEUGWUBUGR6E', '8204339718', 'daniel.pena@proton.me', '6683 Circular Norte', 'Valencia', 'Valencia', '74418', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('317', 'Andres', 'Medina', '1987-03-24', 'ATND9TKG1F8YC8GZK', '1526546103', 'andres.medina@hotmail.com', '9881 Circular Oeste', 'Salto', 'Salto', '74615', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('318', 'William', 'Ramirez', '1978-07-24', 'QOROI5J8YIT2KODWH', '2582386870', 'william.ramirez@gmail.com', '7712 Ruta Independencia', 'Ciudad de Mexico', 'Ciudad de Mexico', '47912', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('319', 'Tomas', 'Garcia', '1974-07-09', 'V4NMWVSB0UKOEFUKP', '9855474355', 'tomas.garcia@hotmail.com', '7633 Circular Principal', 'Mendoza', 'Mendoza', '12080', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('320', 'Pablo', 'Acosta', '1992-10-01', 'AAGUZROC5XT63QE8N', '9562017537', 'pablo.acosta@gmail.com', '3729 Boulevard Norte', 'La Plata', 'La Plata', '46848', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('321', 'Silvia', 'Diaz', '1977-03-14', '3H98BRZVA9WDJSGG0', '9921921249', 'silvia.diaz@hotmail.com', '8670 Boulevard Central', 'Vina del Mar', 'Vina del Mar', '35146', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('322', 'Andres', 'Soto', '1972-09-09', 'Y5APYX4L4OESRSBZB', '6875063519', 'andres.soto@gmail.com', '3796 Boulevard Regional', 'Luque', 'Luque', '19757', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('323', 'Diana', 'Diaz', '1977-11-19', 'CWBPA274IR833SICV', '7179110065', 'diana.diaz@yahoo.com', '2189 Calle Libertad', 'Cali', 'Cali', '17181', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('324', 'Kevin', 'Suarez', '1959-02-19', 'YUKND1IVXAN25WM72', '7859311091', 'kevin.suarez@hotmail.com', '9491 Av. San Martin', 'Montevideo', 'Montevideo', '43591', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('325', 'Silvia', 'Moreno', '1989-11-21', 'GEBEVSXMVTFQVK8SX', '2038806533', 'silvia.moreno@hotmail.com', '1220 Pasaje Oeste', 'Maracay', 'Maracay', '97537', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('326', 'Ines', 'Soto', '1979-09-16', '4UMKLD56R7WYQHR13', '6362050150', 'ines.soto@yahoo.com', '2433 Pasaje Libertad', 'Maracay', 'Maracay', '35480', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('327', 'Teresa', 'Martinez', '1967-10-01', 'KHJG4IHGJD3EX5MHQ', '5528961122', 'teresa.martinez@hotmail.com', '3240 Circular Regional', 'Cordoba', 'Cordoba', '59054', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('328', 'Manuel', 'Molina', '1954-02-22', '1V4KFIWKESVR022WG', '6857872558', 'manuel.molina@live.com', '8206 Transversal Central', 'Salto', 'Salto', '86177', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('329', 'Yasmin', 'Dominguez', '1968-08-03', 'HH5OL5U7NTEDQMVQW', '6776657546', 'yasmin.dominguez@gmail.com', '3042 Transversal Oeste', 'La Paz', 'La Paz', '44815', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('330', 'Hector', 'Aguilar', '1995-01-06', 'SX27DCBHHLK3YJZ99', '8404456690', 'hector.aguilar@live.com', '8499 Ruta Este', 'Concepcion', 'Concepcion', '62101', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('331', 'Bianca', 'Morales', '1970-12-20', 'S210Q2LG1ZHQUNUE7', '0755366684', 'bianca.morales@proton.me', '9716 Calle Independencia', 'Ambato', 'Ambato', '14221', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('332', 'Pablo', 'Flores', '2004-02-06', '6UON8CNRL8XKGYG3V', '0231643348', 'pablo.flores@yahoo.com', '7549 Calle Principal', 'Chiclayo', 'Chiclayo', '77964', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('333', 'Ana', 'Rivera', '1985-02-01', 'FDTRC85EHPZRV7VSY', '4302716938', 'ana.rivera@proton.me', '9426 Transversal Libertad', 'Cusco', 'Cusco', '70646', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('334', 'Daniel', 'Valdez', '1990-12-09', 'M42O34OGWPNXZDZB5', '2484137681', 'daniel.valdez@proton.me', '1353 Ruta Sur', 'Concepcion', 'Concepcion', '76112', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('335', 'Natalia', 'Moreno', '1972-09-04', 'HBAWYQMOGBJZEYQQC', '3727422091', 'natalia.moreno@outlook.com', '4919 Calle San Martin', 'Maracaibo', 'Maracaibo', '61229', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('336', 'Tomas', 'Gonzalez', '1963-10-09', 'PGZ6TPBWSXXDYPVBN', '3353310600', 'tomas.gonzalez@proton.me', '3248 Boulevard Sur', 'Rosario', 'Rosario', '38910', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('337', 'Karina', 'Pena', '1953-12-13', 'ODLUGHT7EHMGOLOQC', '4950136497', 'karina.pena@yahoo.com', '8884 Ruta Independencia', 'Medellin', 'Medellin', '32473', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('338', 'Emilio', 'Sanchez', '1984-11-10', 'Y9YLW5L4RMVVNXIV9', '3091436391', 'emilio.sanchez@gmail.com', '2353 Pasaje Libertad', 'Cochabamba', 'Cochabamba', '48877', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('339', 'Ximena', 'Flores', '1953-05-27', 'I09P5EL2B2O31I0MH', '0339685270', 'ximena.flores@yahoo.com', '8155 Calle Oeste', 'Salto', 'Salto', '16829', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('340', 'Quintina', 'Reyes', '1965-08-01', 'V37IC0LZIGIKQWJ2C', '5662776896', 'quintina.reyes@outlook.com', '7997 Calle Regional', 'Bogota', 'Bogota', '66019', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('341', 'Isabel', 'Guerrero', '1998-03-12', 'F0JQQNVCEQFGAS0R7', '6567491601', 'isabel.guerrero@mail.com', '9366 Av. Oeste', 'Tijuana', 'Tijuana', '67186', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('342', 'Emilio', 'Guerrero', '1993-11-02', 'WNCNPIR7NZBXFV7FI', '9201166918', 'emilio.guerrero@hotmail.com', '7029 Av. Regional', 'Chiclayo', 'Chiclayo', '43144', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('343', 'Kevin', 'Silva', '2002-07-31', 'LO50DW1MF07OL93AC', '6864622522', 'kevin.silva@hotmail.com', '8070 Av. San Martin', 'San Lorenzo', 'San Lorenzo', '24449', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('344', 'Felipe', 'Castro', '1968-01-11', 'CG1J6OWW5FKNJMVRY', '1004090138', 'felipe.castro@gmail.com', '6254 Circular San Martin', 'Guayaquil', 'Guayaquil', '44843', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('345', 'Laura', 'Ruiz', '1988-07-12', 'MYMLINOV953A5O47A', '1843579786', 'laura.ruiz@hotmail.com', '151 Boulevard Principal', 'Chiclayo', 'Chiclayo', '12179', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('346', 'Teresa', 'Martinez', '1970-12-15', 'VOWCP779460KHFSU4', '8027148727', 'teresa.martinez@yahoo.com', '7999 Boulevard San Martin', 'Cusco', 'Cusco', '41575', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('347', 'Diana', 'Reyes', '1959-06-19', 'PZF761HJR6EET0DY5', '9915668633', 'diana.reyes@icloud.com', '1995 Pasaje Sur', 'Bogota', 'Bogota', '24599', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('348', 'Javier', 'Medina', '1960-06-01', 'UELN0LVGNP127EXVD', '0875243772', 'javier.medina@icloud.com', '2489 Boulevard Norte', 'Santa Cruz', 'Santa Cruz', '88496', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('349', 'Manuel', 'Ramos', '1974-07-14', '9ZR3RZN9L3H03ZB5G', '7642086567', 'manuel.ramos@proton.me', '6512 Transversal Sur', 'Asuncion', 'Asuncion', '79185', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('350', 'Ignacio', 'Chavez', '1985-04-30', 'DL25B7KXUPR6H2HXN', '9126620157', 'ignacio.chavez@outlook.com', '959 Calle San Martin', 'Manta', 'Manta', '95209', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('351', 'Patricia', 'Navarro', '1986-03-31', 'IEOKVG019YDQ3NWQA', '1117830999', 'patricia.navarro@live.com', '4584 Boulevard Sur', 'Salto', 'Salto', '87709', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('352', 'Victor', 'Castillo', '1976-10-07', 'UDC62G3AUT3RSVZ2E', '3129208751', 'victor.castillo@gmail.com', '2210 Circular Oeste', 'Barquisimeto', 'Barquisimeto', '95542', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('353', 'Sofia', 'Perez', '1953-02-21', 'DEK8G9XIB86KTFRL6', '5988310303', 'sofia.perez@outlook.com', '5010 Ruta Oeste', 'Ciudad del Este', 'Ciudad del Este', '27590', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('354', 'Zoe', 'Navarro', '1961-07-12', '0PTJXFQ8Y7FHWJWXZ', '9892625660', 'zoe.navarro@hotmail.com', '1370 Pasaje Sur', 'Trujillo', 'Trujillo', '79660', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('355', 'Mariana', 'Campos', '1955-12-02', 'LD62F2JD9I82ES5V3', '1859484910', 'mariana.campos@outlook.com', '5310 Ruta Regional', 'San Lorenzo', 'San Lorenzo', '33681', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('356', 'Raul', 'Valdez', '2003-05-07', '5OVJYZXFUJ7XN1YPQ', '7578446834', 'raul.valdez@yahoo.com', '5107 Transversal Principal', 'Luque', 'Luque', '21814', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('357', 'Isabel', 'Gonzalez', '1964-10-24', 'UDK73A8Y7ERYYTEAG', '0685389097', 'isabel.gonzalez@outlook.com', '8677 Av. Este', 'Quito', 'Quito', '19846', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('358', 'Teresa', 'Torres', '1954-07-27', 'PNNE6IT1EKKH0UHK7', '8079705097', 'teresa.torres@proton.me', '4988 Pasaje Sur', 'Ciudad del Este', 'Ciudad del Este', '10675', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('359', 'Raul', 'Fuentes', '1981-10-22', 'APHT6O6A1JQNN6TJ9', '7225605313', 'raul.fuentes@icloud.com', '759 Av. Regional', 'Barranquilla', 'Barranquilla', '65188', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('360', 'Oscar', 'Martinez', '1992-12-31', '89ERRYE12O003E82E', '5803056906', 'oscar.martinez@live.com', '4842 Pasaje Libertad', 'Medellin', 'Medellin', '20828', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('361', 'Claudia', 'Cruz', '1995-11-13', 'GKEJZXPR2D0VG4WFE', '6043260931', 'claudia.cruz@gmail.com', '6331 Transversal San Martin', 'Santa Cruz', 'Santa Cruz', '50166', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('362', 'Bianca', 'Morales', '1992-12-28', 'CPBDN7ZI6GAXLKKVP', '4755411082', 'bianca.morales@proton.me', '6007 Boulevard Principal', 'Cusco', 'Cusco', '87189', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('363', 'Ulises', 'Cruz', '2002-06-04', 'N5E0EV6XGZ7CTM09H', '2023684855', 'ulises.cruz@live.com', '2023 Transversal Sur', 'Guadalajara', 'Guadalajara', '73284', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('364', 'Bruno', 'Rojas', '1964-12-23', 'VZEBU2Y0OY58F1N2O', '4320293908', 'bruno.rojas@live.com', '8354 Boulevard San Martin', 'Asuncion', 'Asuncion', '43925', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('365', 'Kevin', 'Morales', '1999-07-15', 'EITKX7JE5B99HEXW8', '5184269450', 'kevin.morales@gmail.com', '5924 Av. Central', 'Monterrey', 'Monterrey', '33165', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('366', 'Emilio', 'Rodriguez', '1959-07-20', '0Y8JWVHPLHW4OQ0PF', '7172722397', 'emilio.rodriguez@outlook.com', '4721 Calle Central', 'Luque', 'Luque', '31354', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('367', 'Ursula', 'Jimenez', '1956-03-25', 'FPQXO0E1ADNDA37E1', '4290018513', 'ursula.jimenez@outlook.com', '7971 Ruta Independencia', 'Santa Cruz', 'Santa Cruz', '68238', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('368', 'Sofia', 'Ramos', '1963-11-12', 'ITJTABTD5OAIINMK7', '6172131451', 'sofia.ramos@proton.me', '2039 Pasaje Sur', 'Cusco', 'Cusco', '15681', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('369', 'Ricardo', 'Gomez', '1980-01-16', 'VYFYK3MD6X73ZCA7F', '2526771196', 'ricardo.gomez@icloud.com', '2470 Calle Principal', 'Rivera', 'Rivera', '26716', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('370', 'Victor', 'Castillo', '1994-05-04', 'PYO2M2XIPRTT3NUPU', '3135030587', 'victor.castillo@outlook.com', '1904 Calle Principal', 'Trujillo', 'Trujillo', '57298', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('371', 'Pablo', 'Chavez', '1999-06-24', '86I3CE8ZNA8NZXC45', '0252131096', 'pablo.chavez@outlook.com', '3088 Transversal Este', 'Maracaibo', 'Maracaibo', '79133', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('372', 'Kevin', 'Ruiz', '1989-10-31', '2ZKF5B1SA3Y5T37SZ', '6241862369', 'kevin.ruiz@gmail.com', '3686 Transversal Este', 'Paysandu', 'Paysandu', '83307', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('373', 'Hector', 'Soto', '1978-02-05', 'XONBNPJDN2MIFDHA6', '3830341990', 'hector.soto@live.com', '848 Calle Principal', 'Barquisimeto', 'Barquisimeto', '22217', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('374', 'Lucia', 'Garcia', '1985-09-20', 'SLOMEYL6SS1A2R5BF', '7113322889', 'lucia.garcia@proton.me', '7431 Ruta Este', 'Trujillo', 'Trujillo', '54436', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('375', 'Julia', 'Vargas', '1953-08-04', '61NHVCFWR2F5T82DD', '5242149551', 'julia.vargas@yahoo.com', '3035 Boulevard Libertad', 'Sucre', 'Sucre', '43809', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('376', 'Ines', 'Ortiz', '1961-02-14', '8RNKOWYPSWLDOQ59B', '0380214629', 'ines.ortiz@mail.com', '1295 Av. Regional', 'Maracaibo', 'Maracaibo', '70591', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('377', 'Javier', 'Aguilar', '1998-01-03', '6QD0771HLL9RZRKBF', '7235909605', 'javier.aguilar@mail.com', '7856 Av. Norte', 'Barquisimeto', 'Barquisimeto', '37720', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('378', 'Andres', 'Guerrero', '1972-08-12', 'WDCOKZ5SYJ3D6M1FM', '6778265960', 'andres.guerrero@hotmail.com', '1374 Boulevard Independencia', 'Paysandu', 'Paysandu', '90807', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('379', 'Quintina', 'Herrera', '1963-07-03', '67RL2YJ0974WXUB0G', '8296353390', 'quintina.herrera@proton.me', '6060 Calle Central', 'Lima', 'Lima', '50234', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('380', 'Nicolas', 'Soto', '1987-02-23', 'OMTS1EGPGVTN4YPKW', '1111096179', 'nicolas.soto@yahoo.com', '7376 Circular Independencia', 'Barquisimeto', 'Barquisimeto', '14277', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('381', 'Julia', 'Moreno', '1990-10-15', 'TE48M2Q6X2O72SJXL', '6306000258', 'julia.moreno@proton.me', '5590 Av. Independencia', 'Guayaquil', 'Guayaquil', '66363', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('382', 'Cristian', 'Vega', '2005-04-15', 'X32UEW9G6SPD2SW24', '4825311060', 'cristian.vega@outlook.com', '555 Circular San Martin', 'Salto', 'Salto', '20324', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('383', 'Vanessa', 'Rodriguez', '1982-02-16', 'GXHG403NJBCFA95D7', '1124421175', 'vanessa.rodriguez@hotmail.com', '6502 Calle Libertad', 'Barranquilla', 'Barranquilla', '12877', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('384', 'Alberto', 'Gonzalez', '1968-11-12', 'YNL63GAGUVB99RWTF', '4139080882', 'alberto.gonzalez@hotmail.com', '6078 Calle Oeste', 'Caracas', 'Caracas', '13866', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('385', 'Natalia', 'Torres', '1961-05-10', 'JR8MTK0RSOGGY5KOV', '9423767694', 'natalia.torres@proton.me', '1862 Circular Regional', 'Quito', 'Quito', '66270', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('386', 'Ximena', 'Castro', '1955-10-07', 'Q68JOV58TOE3PGIHN', '2510505379', 'ximena.castro@proton.me', '3911 Circular Sur', 'Trujillo', 'Trujillo', '60540', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('387', 'Ignacio', 'Molina', '1969-07-05', 'DKV54C6P1LLH2R9PE', '2959639040', 'ignacio.molina@gmail.com', '7665 Pasaje Este', 'Manta', 'Manta', '62797', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('388', 'Camila', 'Delgado', '1980-04-08', 'XCD20J1OULWOZQ48E', '5910300215', 'camila.delgado@mail.com', '3808 Av. Sur', 'Asuncion', 'Asuncion', '35055', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('389', 'Ulises', 'Delgado', '1973-04-19', '5BBKJY2NZ7VELFV46', '7188397745', 'ulises.delgado@live.com', '3800 Calle Central', 'Buenos Aires', 'Buenos Aires', '48828', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('390', 'Isabel', 'Aguilar', '1968-06-21', 'ZCRHYQNRM31SL7ZX4', '1235679836', 'isabel.aguilar@hotmail.com', '1224 Pasaje Regional', 'Encarnacion', 'Encarnacion', '31521', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('391', 'Lucia', 'Castro', '1991-05-10', '50I6GBXQJ7DPFSSBJ', '1066343629', 'lucia.castro@icloud.com', '8776 Circular Libertad', 'Valparaiso', 'Valparaiso', '77976', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('392', 'Diego', 'Sanchez', '1959-12-19', 'HBBJCDIWZOD05JH2M', '4940128974', 'diego.sanchez@hotmail.com', '2889 Pasaje Sur', 'Cordoba', 'Cordoba', '31842', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('393', 'Victor', 'Medina', '1951-02-22', 'XPA95G1AMRA5RBAYK', '3882211457', 'victor.medina@live.com', '5847 Circular Central', 'Maracaibo', 'Maracaibo', '96954', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('394', 'Laura', 'Ortiz', '1951-03-21', '3KMSX54RJSXFOH9MB', '9653136148', 'laura.ortiz@live.com', '8732 Av. Central', 'Cusco', 'Cusco', '99006', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('395', 'Raul', 'Medina', '1987-06-09', '8JGUZ4E2U2MDA7FYS', '4982474140', 'raul.medina@live.com', '770 Av. Central', 'Rivera', 'Rivera', '87735', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('396', 'Nicolas', 'Lopez', '1950-06-16', 'PXAJMK4X1FDJ9HVCH', '7536661449', 'nicolas.lopez@icloud.com', '2939 Circular Regional', 'Valencia', 'Valencia', '98987', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('397', 'Natalia', 'Navarro', '1972-06-06', 'ETKDUWTN5PEPL7ZQP', '6670806129', 'natalia.navarro@icloud.com', '4075 Circular San Martin', 'Medellin', 'Medellin', '58904', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('398', 'Olivia', 'Suarez', '1976-04-26', 'B4EYQ1S4DJ9DV3UY5', '1980382872', 'olivia.suarez@hotmail.com', '2635 Pasaje Central', 'Luque', 'Luque', '10845', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('399', 'Laura', 'Suarez', '1956-01-10', 'AVEDHR3PCEO934T3Y', '9162022328', 'laura.suarez@hotmail.com', '7901 Transversal Central', 'Quito', 'Quito', '47938', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('400', 'Karina', 'Navarro', '1974-09-09', 'OZDPPBQUAKX6WB68Q', '7402588358', 'karina.navarro@mail.com', '8505 Calle Este', 'Valencia', 'Valencia', '95972', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('401', 'Ricardo', 'Aguilar', '1991-03-23', 'Z2K1KO6XNQXU71SEL', '9599610023', 'ricardo.aguilar@yahoo.com', '1840 Transversal Libertad', 'Cochabamba', 'Cochabamba', '52422', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('402', 'Bianca', 'Fuentes', '1965-08-11', '0N97CJB0PNWBGDQEW', '8334774332', 'bianca.fuentes@mail.com', '8759 Ruta Oeste', 'Quito', 'Quito', '21274', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('403', 'Beatriz', 'Dominguez', '1952-12-25', '36MOTCG06XR3URMWU', '2176619128', 'beatriz.dominguez@icloud.com', '1753 Calle Libertad', 'Valparaiso', 'Valparaiso', '40221', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('404', 'Elena', 'Molina', '1952-01-09', 'I77JZC58CU47SOCZD', '7400564350', 'elena.molina@outlook.com', '3446 Circular Principal', 'Ciudad del Este', 'Ciudad del Este', '96944', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('405', 'Fernando', 'Cruz', '2000-08-02', '6Z1B98VWCT8JBBSXP', '4300038960', 'fernando.cruz@live.com', '954 Transversal Regional', 'Caracas', 'Caracas', '26415', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('406', 'Diego', 'Soto', '1962-05-12', 'EEW6MM7IDAO13TB25', '3010272405', 'diego.soto@proton.me', '9969 Boulevard Oeste', 'Rivera', 'Rivera', '48327', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('407', 'Olivia', 'Molina', '1960-12-24', 'XC7HZ364PKNT5I6LT', '1056974132', 'olivia.molina@hotmail.com', '5096 Boulevard San Martin', 'Maldonado', 'Maldonado', '37625', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('408', 'Nicolas', 'Vargas', '1971-02-03', 'ZXQERBKN3DKVR5NBH', '2680408509', 'nicolas.vargas@proton.me', '4401 Ruta Independencia', 'Bogota', 'Bogota', '38382', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('409', 'Beatriz', 'Medina', '1988-05-10', '2713T87K9TPZ1J8Q9', '3204413845', 'beatriz.medina@mail.com', '732 Circular Central', 'Sucre', 'Sucre', '57408', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('410', 'Gustavo', 'Pena', '1951-02-09', 'EULJGQPQ8R4HC7JVL', '1724447232', 'gustavo.pena@outlook.com', '912 Av. Sur', 'Tijuana', 'Tijuana', '95799', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('411', 'Camila', 'Gomez', '2002-01-09', 'LTI899A44TBIDSECH', '9561642059', 'camila.gomez@proton.me', '5588 Transversal Principal', 'San Lorenzo', 'San Lorenzo', '71693', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('412', 'Julia', 'Suarez', '1983-01-16', 'B76AV3S2SUMH3B0N9', '1139898681', 'julia.suarez@gmail.com', '7838 Boulevard San Martin', 'Cordoba', 'Cordoba', '78201', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('413', 'Esther', 'Herrera', '2001-08-10', 'KII1NQ0EI05NMS6XV', '7639283692', 'esther.herrera@icloud.com', '4800 Pasaje Principal', 'Guadalajara', 'Guadalajara', '25461', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('414', 'Isabel', 'Moreno', '1963-04-25', 'UW165AEJT70EBPY9E', '8665268341', 'isabel.moreno@proton.me', '5615 Circular Independencia', 'Rivera', 'Rivera', '90822', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('415', 'Luis', 'Fuentes', '1981-11-05', '86W0P1Z00V3SFAVYQ', '5728941347', 'luis.fuentes@proton.me', '891 Circular San Martin', 'Buenos Aires', 'Buenos Aires', '78838', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('416', 'Claudia', 'Chavez', '1978-08-01', '18B850PK5LMFKRIG7', '4913421388', 'claudia.chavez@outlook.com', '548 Circular Norte', 'Cusco', 'Cusco', '80756', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('417', 'Walter', 'Garcia', '1983-02-26', 'H7U0S3KDZ4PPJ590E', '5131528547', 'walter.garcia@yahoo.com', '5257 Calle Regional', 'Caracas', 'Caracas', '23164', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('418', 'Manuel', 'Diaz', '1950-09-19', 'IV5HHQRGREWDS0HPR', '9320649693', 'manuel.diaz@proton.me', '8033 Circular Este', 'Asuncion', 'Asuncion', '49334', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('419', 'Bianca', 'Chavez', '1985-03-09', 'VTKH861PQIPG8XMOE', '7796304483', 'bianca.chavez@mail.com', '1096 Circular Principal', 'Barquisimeto', 'Barquisimeto', '44289', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('420', 'Manuel', 'Moreno', '1988-02-23', 'O6J0M3LOUFHW8WLVA', '0615581083', 'manuel.moreno@proton.me', '8873 Av. Este', 'Maldonado', 'Maldonado', '80215', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('421', 'Xavier', 'Contreras', '1964-06-24', '6LH07BA7DORFKI1IJ', '1662411186', 'xavier.contreras@gmail.com', '341 Boulevard San Martin', 'Cuenca', 'Cuenca', '89281', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('422', 'Ricardo', 'Sanchez', '1967-06-07', '342P0KQD8UNPIOKKZ', '8360765817', 'ricardo.sanchez@hotmail.com', '9567 Calle Regional', 'Sucre', 'Sucre', '40423', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('423', 'Felipe', 'Vargas', '1959-10-11', 'XL39DG5RIFWR0UI1J', '4520599604', 'felipe.vargas@hotmail.com', '9314 Ruta Libertad', 'Maracay', 'Maracay', '81511', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('424', 'Miguel', 'Herrera', '1991-05-24', 'ZS49CDZN1F0FP8BPG', '8728660416', 'miguel.herrera@icloud.com', '4541 Circular Principal', 'Cuenca', 'Cuenca', '90622', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('425', 'Ulises', 'Castro', '1976-01-14', 'SHWZSJQ77Z4ES3AOF', '1043318751', 'ulises.castro@gmail.com', '7779 Circular Este', 'Medellin', 'Medellin', '18751', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('426', 'Raul', 'Dominguez', '1980-12-12', 'W7J35VLWOJTXCF0KJ', '1289659994', 'raul.dominguez@live.com', '3529 Av. Norte', 'Encarnacion', 'Encarnacion', '40386', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('427', 'Zoe', 'Perez', '1962-11-10', 'F5L6BSPXLSEUNNRLS', '8193242687', 'zoe.perez@live.com', '4204 Boulevard Sur', 'Santa Cruz', 'Santa Cruz', '83125', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('428', 'Diego', 'Acosta', '1952-04-08', '541MPW57GN79HMHVL', '5480940476', 'diego.acosta@gmail.com', '4245 Pasaje Norte', 'Arequipa', 'Arequipa', '84996', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('429', 'Beatriz', 'Contreras', '1990-10-10', 'RR513BB6F05EP4CWC', '1843905529', 'beatriz.contreras@proton.me', '8559 Calle Regional', 'Maracay', 'Maracay', '64575', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('430', 'Fernando', 'Gonzalez', '1963-03-27', '0DPJHSG04AJMMUZUQ', '1121259020', 'fernando.gonzalez@hotmail.com', '6236 Transversal Sur', 'Manta', 'Manta', '42339', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('431', 'Lucia', 'Campos', '1977-11-09', 'BZGFLIG5GKZJRUMXQ', '2096289365', 'lucia.campos@icloud.com', '3498 Pasaje San Martin', 'Guayaquil', 'Guayaquil', '82300', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('432', 'Gustavo', 'Perez', '1973-03-02', 'HJ7SWRQLUX6LDM6FR', '5125427820', 'gustavo.perez@live.com', '7578 Circular Independencia', 'Encarnacion', 'Encarnacion', '67012', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('433', 'Yasmin', 'Ruiz', '1983-06-26', 'VROB7I77DPJUVFFKV', '8392250142', 'yasmin.ruiz@proton.me', '7615 Transversal Este', 'Cuenca', 'Cuenca', '70370', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('434', 'Alejandro', 'Pena', '1965-06-09', 'KCIHDIY4NRMQYZ6Y3', '3162526546', 'alejandro.pena@mail.com', '8850 Calle Principal', 'Medellin', 'Medellin', '74003', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('435', 'Beatriz', 'Morales', '1971-02-05', 'NM3V16XEGHPMXPKN3', '0462268171', 'beatriz.morales@proton.me', '1761 Boulevard Regional', 'Santa Cruz', 'Santa Cruz', '11602', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('436', 'Sofia', 'Herrera', '1995-06-26', 'NQR8O1KJWV2QNRMTN', '2686120594', 'sofia.herrera@hotmail.com', '8536 Ruta Independencia', 'Cartagena', 'Cartagena', '69636', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('437', 'Diego', 'Lopez', '1953-07-29', 'ERN6YJMK3TGMALWVM', '0863218122', 'diego.lopez@live.com', '7163 Pasaje Principal', 'Valencia', 'Valencia', '70035', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('438', 'Diana', 'Fuentes', '1991-02-16', 'BLBV03DS0MWKOG0Z0', '1613944988', 'diana.fuentes@hotmail.com', '900 Pasaje Independencia', 'Luque', 'Luque', '71986', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('439', 'Zoe', 'Guerrero', '1966-08-30', 'JYV6YJOAOEJV9LHAL', '1949796958', 'zoe.guerrero@mail.com', '7892 Circular Norte', 'Paysandu', 'Paysandu', '54951', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('440', 'Patricia', 'Herrera', '1963-08-14', 'Q0HZYJB48WUMH9NKL', '7029929596', 'patricia.herrera@mail.com', '483 Ruta Central', 'Cusco', 'Cusco', '82933', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('441', 'Laura', 'Cruz', '1961-10-25', 'N8EOHDK5199TMH6K1', '1588863677', 'laura.cruz@icloud.com', '7463 Av. Este', 'Rivera', 'Rivera', '62435', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('442', 'Ignacio', 'Garcia', '1991-08-19', 'XYDUPPGBIVSCUOAVF', '7150968832', 'ignacio.garcia@live.com', '6146 Boulevard Oeste', 'Ciudad del Este', 'Ciudad del Este', '32965', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('443', 'Ines', 'Contreras', '1961-11-25', 'K6HQIV929SEVL7FQ8', '0068761648', 'ines.contreras@yahoo.com', '8851 Boulevard Norte', 'Cuenca', 'Cuenca', '67477', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('444', 'Jorge', 'Fuentes', '1985-09-28', '30BO7WP2D41U2ZNXF', '3734151773', 'jorge.fuentes@icloud.com', '5710 Pasaje Libertad', 'Rosario', 'Rosario', '53340', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('445', 'Felipe', 'Soto', '1974-09-12', 'V1FKHNNK8FWRPK0ZF', '4643039429', 'felipe.soto@gmail.com', '4350 Pasaje San Martin', 'Tijuana', 'Tijuana', '77740', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('446', 'Yasmin', 'Ruiz', '1980-11-18', 'XVSSN7X5RRNYCIHFV', '1357790833', 'yasmin.ruiz@proton.me', '638 Transversal Sur', 'Santa Cruz', 'Santa Cruz', '53190', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('447', 'Gabriela', 'Gutierrez', '1998-03-30', '58CUIJ0YXIYQBVTDG', '1284033399', 'gabriela.gutierrez@live.com', '7706 Calle San Martin', 'Luque', 'Luque', '16695', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('448', 'Manuel', 'Dominguez', '1992-11-28', 'EDHTHRUU5E51H3WQA', '6947258784', 'manuel.dominguez@icloud.com', '4428 Ruta San Martin', 'Valparaiso', 'Valparaiso', '42639', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('449', 'Patricia', 'Gutierrez', '1977-09-14', 'WE1GA6SRG1YD5MY3G', '1334845871', 'patricia.gutierrez@icloud.com', '3545 Circular Este', 'Luque', 'Luque', '52436', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('450', 'Sofia', 'Diaz', '1964-03-03', 'VF89X22J7Q4KFMM0Q', '6966060652', 'sofia.diaz@live.com', '4592 Calle Oeste', 'Salto', 'Salto', '37342', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('451', 'Emilio', 'Chavez', '1978-11-16', 'PNU02WPJCF07V882O', '7349960105', 'emilio.chavez@icloud.com', '8912 Pasaje Libertad', 'Lima', 'Lima', '47255', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('452', 'Mariana', 'Ruiz', '1979-02-12', '9035VUUPLTXU3YF15', '5573257375', 'mariana.ruiz@proton.me', '3360 Boulevard Central', 'Bogota', 'Bogota', '43470', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('453', 'Andres', 'Torres', '1988-05-03', 'ORBT6SAPBS22RUW0U', '8182819793', 'andres.torres@yahoo.com', '7160 Ruta Central', 'Antofagasta', 'Antofagasta', '71042', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('454', 'Felipe', 'Valdez', '1956-07-20', 'GUQ2086OKWOALF4V1', '8739592323', 'felipe.valdez@icloud.com', '3075 Calle Norte', 'Cali', 'Cali', '79916', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('455', 'Daniel', 'Torres', '1956-03-19', 'LLIHKPJ7HME6P4NP0', '3607763369', 'daniel.torres@yahoo.com', '1621 Av. San Martin', 'Ciudad del Este', 'Ciudad del Este', '85799', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('456', 'Nicolas', 'Rivera', '1993-11-18', '0M9OHDSRS8ANP8DML', '1643167045', 'nicolas.rivera@gmail.com', '2405 Ruta Oeste', 'Quito', 'Quito', '33246', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('457', 'Ana', 'Torres', '1962-07-31', 'Z1C25XNOFG7803G5D', '2073465495', 'ana.torres@gmail.com', '523 Pasaje Norte', 'Encarnacion', 'Encarnacion', '71669', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('458', 'Camila', 'Valdez', '1954-03-04', 'T10GDMIPC8QO6P43A', '7742585917', 'camila.valdez@live.com', '9459 Av. Este', 'Barranquilla', 'Barranquilla', '38745', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('459', 'Olivia', 'Flores', '1958-07-04', 'ZKWIJ0KZQVS9J6LNF', '0603202032', 'olivia.flores@mail.com', '5384 Calle Independencia', 'Quito', 'Quito', '73016', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('460', 'Jorge', 'Aguilar', '1986-05-24', 'QHWTEK17M6J3RTXYM', '8415608213', 'jorge.aguilar@live.com', '1920 Calle San Martin', 'Manta', 'Manta', '48759', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('461', 'Olivia', 'Aguilar', '1989-02-17', 'T788G35SFY1H0S2UT', '0858382521', 'olivia.aguilar@outlook.com', '3807 Ruta Este', 'Puebla', 'Puebla', '80886', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('462', 'Claudia', 'Diaz', '1985-12-18', 'K686QE7AJUL7W8COF', '2362669335', 'claudia.diaz@yahoo.com', '3807 Pasaje Este', 'Ciudad de Mexico', 'Ciudad de Mexico', '62617', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('463', 'Nicolas', 'Fuentes', '1968-06-19', 'PY1AELDWQXKE0QC96', '5406417692', 'nicolas.fuentes@live.com', '4869 Av. San Martin', 'Santa Cruz', 'Santa Cruz', '23506', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('464', 'Javier', 'Fuentes', '1982-07-12', 'I4RZPCD1406XLYJMA', '7397396417', 'javier.fuentes@mail.com', '8602 Ruta Regional', 'Oruro', 'Oruro', '15518', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('465', 'Luis', 'Navarro', '1958-07-08', 'E1MY6PO0M24US73W1', '0392051460', 'luis.navarro@live.com', '4253 Pasaje Principal', 'Vina del Mar', 'Vina del Mar', '56186', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('466', 'Diana', 'Gutierrez', '1979-02-11', 'Q9J2H1TLOM344MW04', '3541165972', 'diana.gutierrez@mail.com', '3412 Pasaje Libertad', 'Caracas', 'Caracas', '55953', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('467', 'Patricia', 'Alvarez', '1965-02-13', 'LEU6ZU1TOZHDV5OJZ', '8562614991', 'patricia.alvarez@proton.me', '3783 Transversal Norte', 'Arequipa', 'Arequipa', '42231', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('468', 'Ricardo', 'Pena', '1994-05-13', 'IZH5P3FK84RPU9GGS', '6964546553', 'ricardo.pena@proton.me', '8953 Pasaje Sur', 'Ciudad de Mexico', 'Ciudad de Mexico', '27628', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('469', 'Natalia', 'Soto', '2001-12-10', 'E92SRL3VZZXT9QUBW', '7961208780', 'natalia.soto@proton.me', '7909 Ruta Este', 'Manta', 'Manta', '18359', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('470', 'Silvia', 'Gonzalez', '1972-08-10', '80ZRZ79HQTYLU58FT', '9509059119', 'silvia.gonzalez@yahoo.com', '8779 Transversal Este', 'Tijuana', 'Tijuana', '35509', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('471', 'Diana', 'Molina', '1952-08-24', 'XRED8U8NOZEMDMZ5R', '2463351571', 'diana.molina@icloud.com', '434 Circular Norte', 'Medellin', 'Medellin', '83023', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('472', 'Fernando', 'Campos', '1965-02-12', 'A9ALL2UNCGWRT9DYF', '5927282709', 'fernando.campos@gmail.com', '8907 Ruta Sur', 'Lima', 'Lima', '50850', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('473', 'Julia', 'Sanchez', '2002-12-10', 'S6RV9777TNQETMNI3', '3605079181', 'julia.sanchez@proton.me', '8739 Circular Independencia', 'Arequipa', 'Arequipa', '79720', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('474', 'Xavier', 'Guerrero', '1975-05-08', 'LQH7PPCADUVL911ZS', '0314998250', 'xavier.guerrero@gmail.com', '873 Pasaje Regional', 'Encarnacion', 'Encarnacion', '34672', 'Paraguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('475', 'Silvia', 'Delgado', '1995-08-11', 'SGNZ6D86ZCHHXA7HY', '4035263560', 'silvia.delgado@outlook.com', '2421 Circular Oeste', 'Mendoza', 'Mendoza', '91495', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('476', 'Florencia', 'Romero', '1968-05-19', '7X6OA3N4G2JAYB1EY', '1112712852', 'florencia.romero@icloud.com', '6624 Pasaje San Martin', 'Cochabamba', 'Cochabamba', '47544', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('477', 'Ignacio', 'Castro', '1960-09-17', 'O5HD4HSBREBNDYCPN', '2790833509', 'ignacio.castro@gmail.com', '2602 Pasaje Central', 'Ciudad de Mexico', 'Ciudad de Mexico', '33006', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('478', 'Raul', 'Mendoza', '1985-02-08', 'N8SIWMZAP4VKFTLEC', '8809255021', 'raul.mendoza@hotmail.com', '196 Transversal Norte', 'Quito', 'Quito', '83755', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('479', 'Fernando', 'Castillo', '1970-02-22', '1BTA3RUNYN6IRJ9WR', '2785324264', 'fernando.castillo@outlook.com', '6130 Boulevard Norte', 'La Paz', 'La Paz', '66588', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('480', 'Kevin', 'Flores', '1986-10-26', 'ZTIO4M7PP0PNNLO0H', '3393957865', 'kevin.flores@icloud.com', '3598 Transversal Este', 'Mendoza', 'Mendoza', '71634', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('481', 'Luis', 'Delgado', '2005-12-11', 'OHM6X7P7AHUG9Y1XU', '3265732759', 'luis.delgado@gmail.com', '1690 Ruta Sur', 'Valencia', 'Valencia', '21239', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('482', 'Andres', 'Garcia', '1958-01-26', 'L6HFH4N6V3RZKDU6F', '6189628874', 'andres.garcia@hotmail.com', '1957 Boulevard Este', 'Rosario', 'Rosario', '68314', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('483', 'Karina', 'Guerrero', '1984-03-05', 'RR1V9NPUQARYMMDNG', '9462135415', 'karina.guerrero@live.com', '361 Circular Independencia', 'Cordoba', 'Cordoba', '64753', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('484', 'Tomas', 'Vargas', '1996-01-23', 'KS6R6BILQPB01QCTE', '9090463766', 'tomas.vargas@gmail.com', '4528 Boulevard Regional', 'Guadalajara', 'Guadalajara', '53992', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('485', 'Teresa', 'Silva', '1980-09-10', 'EMJGKCQY2656AE1IG', '1293110059', 'teresa.silva@yahoo.com', '2659 Circular Libertad', 'Maldonado', 'Maldonado', '92706', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('486', 'Oscar', 'Pena', '1960-12-10', 'CE77GZDPYHZNWG3ZR', '2749072801', 'oscar.pena@outlook.com', '3339 Pasaje Este', 'Vina del Mar', 'Vina del Mar', '81040', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('487', 'Walter', 'Soto', '1966-11-19', 'GL9FWVVSKP30TX8J1', '1017509617', 'walter.soto@gmail.com', '1545 Pasaje Independencia', 'Santiago', 'Santiago', '57379', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('488', 'Gabriela', 'Castro', '1990-06-11', 'M3NKRT0IGYO5L28O5', '7722660256', 'gabriela.castro@outlook.com', '6644 Pasaje Norte', 'Monterrey', 'Monterrey', '66935', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('489', 'Ursula', 'Flores', '1969-06-20', 'DOFMAOK8TIR0P8F8C', '1157942387', 'ursula.flores@hotmail.com', '6921 Transversal Norte', 'Santa Cruz', 'Santa Cruz', '50371', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('490', 'Sofia', 'Medina', '1988-06-27', 'WVTMNYEURANI8Y66W', '7485953259', 'sofia.medina@hotmail.com', '9813 Circular Oeste', 'Tijuana', 'Tijuana', '42649', 'Mexico')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('491', 'Laura', 'Castro', '1978-02-14', 'SD1WCRV68JQ12JF4C', '3305597824', 'laura.castro@proton.me', '8041 Pasaje Independencia', 'Caracas', 'Caracas', '80295', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('492', 'Ximena', 'Acosta', '2004-04-14', 'E00H2K2P3AJFAX1CQ', '2768297514', 'ximena.acosta@live.com', '4621 Av. Independencia', 'Manta', 'Manta', '69419', 'Ecuador')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('493', 'Ignacio', 'Rivera', '1978-12-17', '8E5TNLZTWXOL4BKUU', '8027112218', 'ignacio.rivera@outlook.com', '3950 Calle Principal', 'Santa Cruz', 'Santa Cruz', '56803', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('494', 'Patricia', 'Perez', '1956-03-29', 'RTSXOF33QE6JIXUB4', '3700332285', 'patricia.perez@proton.me', '6449 Ruta Regional', 'Paysandu', 'Paysandu', '12523', 'Uruguay')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('495', 'Julia', 'Hernandez', '1999-05-07', 'CHBIRMC5S3OFAWWJN', '6239453546', 'julia.hernandez@yahoo.com', '4775 Transversal Norte', 'Mendoza', 'Mendoza', '68398', 'Argentina')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('496', 'Yasmin', 'Reyes', '1953-09-27', 'ND7H10KYHVKQXI64H', '0403253765', 'yasmin.reyes@live.com', '6502 Circular Este', 'Bogota', 'Bogota', '74445', 'Colombia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('497', 'Jorge', 'Vega', '1972-04-18', 'CDABBAJAQ08DNX80N', '4604014247', 'jorge.vega@hotmail.com', '2071 Boulevard Norte', 'Cochabamba', 'Cochabamba', '72456', 'Bolivia')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('498', 'Ursula', 'Garcia', '1971-01-25', 'Q5ZJAUCYHONBPQGA6', '1447340433', 'ursula.garcia@live.com', '131 Boulevard Norte', 'Santiago', 'Santiago', '83821', 'Chile')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('499', 'Diego', 'Vega', '1954-03-30', 'KDN3TN60TLXOUN91F', '7865619425', 'diego.vega@proton.me', '7744 Transversal San Martin', 'Maracaibo', 'Maracaibo', '99173', 'Venezuela')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe

INSERT INTO customers VALUES
  ('500', 'Tomas', 'Martinez', '1963-01-06', 'VT3F2F3HYCPESBDA7', '2357155868', 'tomas.martinez@mail.com', '3689 Circular Principal', 'Chiclayo', 'Chiclayo', '63477', 'Peru')
ON CONFLICT (id) DO NOTHING;  -- idempotente: no falla si ya existe
