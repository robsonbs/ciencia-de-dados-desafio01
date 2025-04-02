
 CREATE TABLE customers (
     customer_id INT PRIMARY KEY,
     contact_name VARCHAR(30) NOT NULL,
     company_name VARCHAR(40) NULL,
     contact_email VARCHAR(128) NOT NULL,
     address VARCHAR(120) NULL,
     city VARCHAR(30) NULL,
     country VARCHAR(30) NULL
 );
 
 CREATE TABLE employees (
     employee_id INT PRIMARY KEY,
     last_name VARCHAR(40) NOT NULL,
     first_name VARCHAR(20) NOT NULL,
     birth_date DATE NULL,
     hire_date DATE NULL,
     address VARCHAR(128) NULL,
     city VARCHAR(30) NULL,
     country VARCHAR(30) NULL,
     report_to INT NULL,
     FOREIGN KEY (report_to) REFERENCES employees(employee_id)
         ON DELETE SET NULL
         ON UPDATE CASCADE
 );
 
 CREATE TABLE categories (
     category_id INT PRIMARY KEY,
     name VARCHAR(60) NOT NULL,
     description TEXT NULL,
     parent_category_id INT NULL,
     FOREIGN KEY (parent_category_id) REFERENCES categories(category_id)
         ON DELETE SET NULL
         ON UPDATE CASCADE
 );
 
 CREATE TABLE products (
     product_id INT PRIMARY KEY,
     product_name VARCHAR(40) NOT NULL,
     description TEXT NULL,
     category_id INT NULL,
     quantity_per_unit INT NULL,
     unit_price DECIMAL(10, 2) NULL,
     units_in_stock INT NULL,
     discontinued BOOLEAN NULL,
     FOREIGN KEY (category_id) REFERENCES categories(category_id)
         ON DELETE SET NULL
         ON UPDATE CASCADE
 );
 
 CREATE TABLE purchases (
     purchase_id INT PRIMARY KEY,
     customer_id INT NOT NULL,
     employee_id INT NOT NULL,
     total_price DECIMAL(10, 2) NOT NULL,
     purchase_date DATE NULL,
     shipped_date DATE NULL,
     ship_address VARCHAR(60) NULL,
     ship_city VARCHAR(30) NULL,
     ship_country VARCHAR(30) NULL,
     FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
         ON DELETE CASCADE
         ON UPDATE CASCADE,
     FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
         ON DELETE CASCADE
         ON UPDATE CASCADE
 );
 
 CREATE TABLE purchase_items (
     purchase_id INT NOT NULL,
     product_id INT NOT NULL,
     quantity INT NOT NULL,
     unit_price DECIMAL(10, 2) NOT NULL,
     PRIMARY KEY (purchase_id, product_id),
     FOREIGN KEY (purchase_id) REFERENCES purchases(purchase_id)
         ON DELETE CASCADE
         ON UPDATE CASCADE,
     FOREIGN KEY (product_id) REFERENCES products(product_id)
         ON DELETE CASCADE
         ON UPDATE CASCADE
 );
 

 -- Série 1: Inserções básicas com chefes diretos
INSERT INTO employees VALUES (1, 'Smith', 'John', '1985-04-12', '2010-06-15', '123 Main St', 'New York', 'USA', NULL);
INSERT INTO employees VALUES (2, 'Doe', 'Jane', '1990-08-24', '2015-09-01', '456 Oak St', 'Los Angeles', 'USA', 1);
INSERT INTO employees VALUES (3, 'Johnson', 'Robert', '1982-12-05', '2008-03-20', '789 Pine St', 'Chicago', 'USA', 1);
INSERT INTO employees VALUES (4, 'Williams', 'Emily', '1995-06-18', '2020-07-30', '321 Maple St', 'Houston', 'USA', 2);
INSERT INTO employees VALUES (5, 'Brown', 'Michael', '1978-10-15', '2005-11-10', '654 Cedar St', 'Phoenix', 'USA', 3);
INSERT INTO employees VALUES (6, 'Davis', 'Sarah', '1987-03-29', '2012-02-15', '987 Birch St', 'San Diego', 'USA', 2);
INSERT INTO employees VALUES (7, 'Miller', 'David', '1992-09-21', '2018-05-12', '135 Elm St', 'Dallas', 'USA', 4);
INSERT INTO employees VALUES (8, 'Wilson', 'Jessica', '1980-07-11', '2006-09-22', '246 Spruce St', 'San Francisco', 'USA', 3);
INSERT INTO employees VALUES (9, 'Martinez', 'Daniel', '1975-11-23', '2000-01-05', '357 Walnut St', 'Seattle', 'USA', 5);
INSERT INTO employees VALUES (10, 'Anderson', 'Sophia', '1998-02-17', '2023-01-10', '468 Poplar St', 'Miami', 'USA', 6);
INSERT INTO employees VALUES (11, 'Thomas', 'Alexander', '1991-05-30', '2016-08-19', '579 Fir St', 'Denver', 'USA', 7);
INSERT INTO employees VALUES (12, 'Jackson', 'Olivia', '1983-11-14', '2009-10-27', '680 Redwood St', 'Boston', 'USA', 8);
INSERT INTO employees VALUES (13, 'White', 'William', '1972-07-07', '1998-12-12', '791 Cypress St', 'Atlanta', 'USA', 9);
INSERT INTO employees VALUES (14, 'Harris', 'Ava', '1993-04-22', '2017-03-09', '802 Ash St', 'Minneapolis', 'USA', 10);
INSERT INTO employees VALUES (15, 'Clark', 'Benjamin', '1986-01-10', '2011-06-23', '913 Chestnut St', 'Philadelphia', 'USA', 11);
INSERT INTO employees VALUES (16, 'Lewis', 'Mason', '1994-02-18', '2019-04-11', '102 Willow St', 'Austin', 'USA', 12);
INSERT INTO employees VALUES (17, 'Walker', 'Isabella', '1981-08-29', '2007-07-14', '205 Pineapple St', 'San Antonio', 'USA', 13);
INSERT INTO employees VALUES (18, 'Allen', 'Ethan', '1976-06-22', '2002-05-19', '308 Cherry St', 'Columbus', 'USA', 14);
INSERT INTO employees VALUES (19, 'Young', 'Emma', '1999-01-30', '2024-03-01', '411 Magnolia St', 'Charlotte', 'USA', 15);
INSERT INTO employees VALUES (20, 'King', 'Liam', '1989-10-13', '2014-02-22', '514 Sycamore St', 'Indianapolis', 'USA', 16);

-- Série 2: Inserções variando cidades e países
INSERT INTO employees VALUES (21, 'Rodriguez', 'Carlos', '1980-05-20', '2006-08-14', '223 Cedar St', 'Las Vegas', 'USA', 20);
INSERT INTO employees VALUES (22, 'Hernandez', 'Sofia', '1992-11-02', '2017-07-23', '334 Birch St', 'Toronto', 'Canada', 21);
INSERT INTO employees VALUES (23, 'Moore', 'James', '1985-09-10', '2010-12-01', '445 Maple St', 'Mexico City', 'Mexico', 22);
INSERT INTO employees VALUES (24, 'Taylor', 'Isabella', '1996-03-27', '2021-05-16', '556 Oak St', 'London', 'UK', 23);
INSERT INTO employees VALUES (25, 'Anderson', 'Matthew', '1979-06-15', '2004-02-29', '667 Spruce St', 'Berlin', 'Germany', 24);
INSERT INTO employees VALUES (26, 'Thomas', 'Evelyn', '1991-07-08', '2016-10-07', '778 Pine St', 'Madrid', 'Spain', 25);
INSERT INTO employees VALUES (27, 'Jackson', 'Daniel', '1983-01-22', '2008-09-03', '889 Redwood St', 'Paris', 'France', 26);
INSERT INTO employees VALUES (28, 'White', 'Emma', '1995-12-14', '2020-04-25', '990 Chestnut St', 'Rome', 'Italy', 27);
INSERT INTO employees VALUES (29, 'Harris', 'David', '1987-08-31', '2012-06-30', '101 Ash St', 'Tokyo', 'Japan', 28);
INSERT INTO employees VALUES (30, 'Clark', 'Sophia', '1982-04-19', '2007-11-15', '112 Magnolia St', 'Sydney', 'Australia', 29);
INSERT INTO employees VALUES (31, 'Lewis', 'Michael', '1999-09-05', '2024-01-05', '123 Sycamore St', 'Moscow', 'Russia', 30);
INSERT INTO employees VALUES (32, 'Walker', 'Benjamin', '1974-11-12', '1999-08-20', '134 Palm St', 'Rio de Janeiro', 'Brazil', 31);
INSERT INTO employees VALUES (33, 'Allen', 'Olivia', '1989-02-28', '2015-09-12', '145 Willow St', 'Cape Town', 'South Africa', 32);
INSERT INTO employees VALUES (34, 'Young', 'Lucas', '1993-06-07', '2018-12-08', '156 Pineapple St', 'Seoul', 'South Korea', 33);
INSERT INTO employees VALUES (35, 'King', 'Emily', '1981-10-25', '2005-07-14', '167 Cherry St', 'New Delhi', 'India', 34);
INSERT INTO employees VALUES (36, 'Wright', 'Mia', '1977-12-03', '2001-05-22', '178 Walnut St', 'Bangkok', 'Thailand', 35);
INSERT INTO employees VALUES (37, 'Lopez', 'Ethan', '1997-01-16', '2022-08-30', '189 Pine St', 'Dubai', 'UAE', 36);
INSERT INTO employees VALUES (38, 'Gonzalez', 'Ava', '1990-03-21', '2014-04-18', '200 Cedar St', 'Singapore', 'Singapore', 37);
INSERT INTO employees VALUES (39, 'Nelson', 'William', '1986-07-09', '2011-02-10', '211 Oak St', 'Hong Kong', 'China', 38);

-- Série 3: Supervisores entre os 20 primeiros funcionários
INSERT INTO employees VALUES (40, 'Carter', 'Sophia', '1973-05-29', '1998-06-19', '222 Birch St', 'Istanbul', 'Turkey', 39);
INSERT INTO employees VALUES (41, 'Silva', 'Gabriel', '1990-05-14', '2015-06-20', '123 New St', 'Rio de Janeiro', 'Brazil', 5);
INSERT INTO employees VALUES (42, 'Santos', 'Ana', '1985-10-22', '2010-08-15', '456 Ocean St', 'Lisbon', 'Portugal', 10);
INSERT INTO employees VALUES (43, 'Oliveira', 'Marcos', '1992-07-08', '2017-04-10', '789 River St', 'Madrid', 'Spain', 15);
INSERT INTO employees VALUES (44, 'Costa', 'Beatriz', '1998-11-30', '2023-02-01', '321 Hill St', 'Berlin', 'Germany', 3);
INSERT INTO employees VALUES (45, 'Lima', 'Ricardo', '1987-09-15', '2012-05-23', '654 Valley St', 'Paris', 'France', 7);
INSERT INTO employees VALUES (46, 'Fernandes', 'Sofia', '1991-02-27', '2016-09-14', '987 Sky St', 'London', 'UK', 12);
INSERT INTO employees VALUES (47, 'Almeida', 'João', '1983-06-21', '2008-11-19', '135 Sun St', 'Amsterdam', 'Netherlands', 18);
INSERT INTO employees VALUES (48, 'Ribeiro', 'Camila', '1979-08-03', '2004-07-10', '246 Moon St', 'Tokyo', 'Japan', 9);
INSERT INTO employees VALUES (49, 'Martins', 'Lucas', '1995-01-12', '2020-03-05', '357 Star St', 'Sydney', 'Australia', 4);
INSERT INTO employees VALUES (50, 'Gomes', 'Carla', '1982-12-17', '2007-06-27', '468 Wind St', 'Toronto', 'Canada', 16);
INSERT INTO employees VALUES (51, 'Barbosa', 'Pedro', '1988-04-25', '2013-10-21', '579 Rain St', 'New York', 'USA', 14);
INSERT INTO employees VALUES (52, 'Pereira', 'Juliana', '1996-09-09', '2021-12-15', '680 Snow St', 'San Francisco', 'USA', 6);
INSERT INTO employees VALUES (53, 'Rodrigues', 'Henrique', '1975-11-30', '2000-01-20', '791 Fog St', 'Mexico City', 'Mexico', 2);
INSERT INTO employees VALUES (54, 'Carvalho', 'Tatiane', '1993-03-18', '2018-09-12', '802 Cloud St', 'Buenos Aires', 'Argentina', 8);
INSERT INTO employees VALUES (55, 'Nunes', 'Eduardo', '1980-07-02', '2005-04-30', '913 Storm St', 'Santiago', 'Chile', 11);
INSERT INTO employees VALUES (56, 'Moreira', 'Isadora', '1994-05-07', '2019-11-04', '102 Wave St', 'Bogotá', 'Colombia', 13);
INSERT INTO employees VALUES (57, 'Melo', 'Thiago', '1981-06-23', '2006-02-22', '205 Rock St', 'Lima', 'Peru', 1);
INSERT INTO employees VALUES (58, 'Cardoso', 'Fernanda', '1977-10-11', '2002-07-28', '308 Stone St', 'Montevideo', 'Uruguay', 19);
INSERT INTO employees VALUES (59, 'Teixeira', 'Vitor', '1999-08-14', '2024-04-12', '411 Grass St', 'Quito', 'Ecuador', 17);
INSERT INTO employees VALUES (60, 'Vieira', 'Mariana', '1989-01-29', '2014-08-09', '514 Sand St', 'Caracas', 'Venezuela', 20);

-- Série 4: Supervisores entre os 20 primeiros funcionários com diferentes países
INSERT INTO employees VALUES (61, 'Souza', 'Leonardo', '1986-07-19', '2011-05-14', '123 Forest St', 'Cape Town', 'South Africa', 5);
INSERT INTO employees VALUES (62, 'Batista', 'Larissa', '1992-02-28', '2017-08-21', '456 Lake St', 'Dubai', 'UAE', 10);
INSERT INTO employees VALUES (63, 'Cavalcante', 'Rafael', '1984-11-11', '2009-12-30', '789 Mountain St', 'Singapore', 'Singapore', 15);
INSERT INTO employees VALUES (64, 'Freitas', 'Tatiane', '1997-06-05', '2022-06-18', '321 Desert St', 'Hong Kong', 'China', 3);
INSERT INTO employees VALUES (65, 'Mendes', 'Diego', '1979-05-21', '2004-03-10', '654 River St', 'Istanbul', 'Turkey', 7);
INSERT INTO employees VALUES (66, 'Azevedo', 'Bruna', '1991-09-17', '2016-10-27', '987 Hill St', 'Seoul', 'South Korea', 12);
INSERT INTO employees VALUES (67, 'Fonseca', 'Ricardo', '1983-08-08', '2008-07-14', '135 Sky St', 'Bangkok', 'Thailand', 18);
INSERT INTO employees VALUES (68, 'Coelho', 'Bianca', '1978-03-25', '2003-02-09', '246 Sun St', 'New Delhi', 'India', 9);
INSERT INTO employees VALUES (69, 'Duarte', 'Gabriela', '1995-12-22', '2020-11-30', '357 Moon St', 'Moscow', 'Russia', 4);
INSERT INTO employees VALUES (70, 'Rezende', 'Felipe', '1982-06-14', '2007-08-05', '468 Star St', 'Jakarta', 'Indonesia', 16);
INSERT INTO employees VALUES (71, 'Cunha', 'Vanessa', '1988-10-29', '2013-03-22', '579 Wind St', 'Kuala Lumpur', 'Malaysia', 14);
INSERT INTO employees VALUES (72, 'Ferreira', 'Luiz', '1996-05-16', '2021-09-17', '680 Rain St', 'Hanoi', 'Vietnam', 6);
INSERT INTO employees VALUES (73, 'Lopes', 'Eduarda', '1976-12-10', '2001-04-01', '791 Snow St', 'Tehran', 'Iran', 2);
INSERT INTO employees VALUES (74, 'Guedes', 'Anderson', '1993-07-04', '2018-12-06', '802 Cloud St', 'Riyadh', 'Saudi Arabia', 8);
INSERT INTO employees VALUES (75, 'Pinto', 'Amanda', '1981-02-14', '2006-06-29', '913 Storm St', 'Doha', 'Qatar', 11);
INSERT INTO employees VALUES (76, 'Campos', 'Rodrigo', '1994-08-21', '2019-02-20', '102 Wave St', 'Manila', 'Philippines', 13);
INSERT INTO employees VALUES (77, 'Borges', 'Natalia', '1980-11-03', '2005-10-18', '205 Rock St', 'Yangon', 'Myanmar', 1);
INSERT INTO employees VALUES (78, 'Nogueira', 'Renato', '1977-04-30', '2002-11-11', '308 Stone St', 'Kathmandu', 'Nepal', 19);
INSERT INTO employees VALUES (79, 'Moraes', 'Julio', '1999-09-07', '2024-05-08', '411 Grass St', 'Tashkent', 'Uzbekistan', 17);
INSERT INTO employees VALUES (80, 'Assis', 'Paula', '1989-12-31', '2014-07-15', '514 Sand St', 'Astana', 'Kazakhstan', 20);

-- Inserindo Categorias
INSERT INTO categories VALUES (1, 'Eletrônicos', 'Dispositivos e acessórios eletrônicos', NULL);
INSERT INTO categories VALUES (2, 'Eletrodomésticos', 'Aparelhos para o lar', NULL);
INSERT INTO categories VALUES (3, 'Móveis', 'Móveis para casa e escritório', NULL);
INSERT INTO categories VALUES (4, 'Roupas', 'Vestuário masculino e feminino', NULL);
INSERT INTO categories VALUES (5, 'Alimentos', 'Comidas e bebidas variadas', NULL);
INSERT INTO categories VALUES (6, 'Esportes', 'Artigos esportivos e fitness', NULL);
INSERT INTO categories VALUES (7, 'Brinquedos', 'Brinquedos para todas as idades', NULL);
INSERT INTO categories VALUES (8, 'Livros', 'Livros e materiais de leitura', NULL);
INSERT INTO categories VALUES (9, 'Automotivo', 'Peças e acessórios para veículos', NULL);
INSERT INTO categories VALUES (10, 'Beleza e Saúde', 'Produtos de higiene e cuidados pessoais', NULL);

-- Série 1: Produtos Eletrônicos e Eletrodomésticos
INSERT INTO products VALUES (1, 'Smartphone X', 'Celular com tecnologia 5G', 1, 1, 3999.99, 50, FALSE);
INSERT INTO products VALUES (2, 'Notebook Ultra', 'Notebook de alto desempenho', 1, 1, 6999.99, 30, FALSE);
INSERT INTO products VALUES (3, 'Fone Bluetooth', 'Fone sem fio com cancelamento de ruído', 1, 1, 499.99, 100, FALSE);
INSERT INTO products VALUES (4, 'Geladeira Frost', 'Geladeira com tecnologia inverter', 2, 1, 3499.99, 15, FALSE);
INSERT INTO products VALUES (5, 'Micro-ondas Grill', 'Micro-ondas com grill embutido', 2, 1, 799.99, 40, FALSE);
INSERT INTO products VALUES (6, 'Smart TV 55"', 'Televisão 4K com HDR', 1, 1, 4299.99, 20, FALSE);
INSERT INTO products VALUES (7, 'Console Gamer', 'Videogame de última geração', 1, 1, 4999.99, 25, true);
INSERT INTO products VALUES (8, 'Headset Gamer', 'Headset com som surround', 1, 1, 699.99, 50, FALSE);
INSERT INTO products VALUES (9, 'Ar-condicionado Split', 'Ar-condicionado 12000 BTUs', 2, 1, 1999.99, 18, true);
INSERT INTO products VALUES (10, 'Aspirador Robô', 'Aspirador automático com sensor', 2, 1, 1599.99, 12, FALSE);
INSERT INTO products VALUES (11, 'Câmera Digital', 'Câmera profissional 24MP', 1, 1, 2499.99, 8, FALSE);
INSERT INTO products VALUES (12, 'Monitor 27"', 'Monitor Full HD para PC', 1, 1, 1299.99, 15, FALSE);
INSERT INTO products VALUES (13, 'Teclado Mecânico', 'Teclado RGB para gamers', 1, 1, 599.99, 35, true);
INSERT INTO products VALUES (14, 'Smartwatch', 'Relógio inteligente com GPS', 1, 1, 899.99, 60, FALSE);
INSERT INTO products VALUES (15, 'Caixa de Som Bluetooth', 'Caixa de som portátil', 1, 1, 349.99, 100, true);
INSERT INTO products VALUES (16, 'Fogão 4 bocas', 'Fogão a gás com acendimento automático', 2, 1, 1399.99, 25, FALSE);
INSERT INTO products VALUES (17, 'Máquina de Lavar', 'Lavadora de roupas 12kg', 2, 1, 2599.99, 10, FALSE);
INSERT INTO products VALUES (18, 'Chaleira Elétrica', 'Chaleira para preparo rápido de bebidas', 2, 1, 249.99, 60, FALSE);
INSERT INTO products VALUES (19, 'Cafeteira Expresso', 'Cafeteira com vaporizador de leite', 2, 1, 899.99, 30, FALSE);
INSERT INTO products VALUES (20, 'Liquidificador Power', 'Liquidificador com 5 velocidades', 2, 1, 349.99, 40, FALSE);

-- Série 2: Móveis e Roupas
INSERT INTO products VALUES (21, 'Sofá Retrátil', 'Sofá confortável para sala', 3, 1, 1999.99, 10, FALSE);
INSERT INTO products VALUES (22, 'Mesa de Jantar', 'Mesa para 6 pessoas', 3, 1, 1499.99, 5, true);
INSERT INTO products VALUES (23, 'Cadeira Gamer', 'Cadeira ergonômica para escritório', 3, 1, 799.99, 15, FALSE);
INSERT INTO products VALUES (24, 'Guarda-Roupa 3 portas', 'Guarda-roupa espaçoso', 3, 1, 1299.99, 8, true);
INSERT INTO products VALUES (25, 'Cômoda Madeira', 'Cômoda com gavetas', 3, 1, 699.99, 12, FALSE);
INSERT INTO products VALUES (26, 'Calça Jeans Slim', 'Calça jeans masculina azul', 4, 1, 199.99, 50, FALSE);
INSERT INTO products VALUES (27, 'Camisa Social Branca', 'Camisa social masculina', 4, 1, 149.99, 30, FALSE);
INSERT INTO products VALUES (28, 'Vestido Longo', 'Vestido feminino elegante', 4, 1, 299.99, 20, true);
INSERT INTO products VALUES (29, 'Jaqueta de Couro', 'Jaqueta estilosa', 4, 1, 399.99, 15, FALSE);
INSERT INTO products VALUES (30, 'Tênis Esportivo', 'Tênis para corrida', 4, 1, 349.99, 40, FALSE);

INSERT INTO customers (customer_id, contact_name, company_name, contact_email, address, city, country) VALUES
(1, 'Carlos Silva', 'Tech Solutions', 'carlos.silva@email.com', 'Av. Paulista, 1000', 'São Paulo', 'Brasil'),
(2, 'Ana Souza', NULL, 'ana.souza@email.com', 'Rua das Flores, 200', 'Rio de Janeiro', 'Brasil'),
(3, 'Miguel Torres', 'Torres Ltda', 'miguel.torres@email.com', 'Rua A, 50', 'Lisboa', 'Portugal'),
(4, 'Emily Johnson', 'Johnson Consulting', 'emily.johnson@email.com', '500 Park Ave', 'New York', 'USA'),
(5, 'Lucas Mendes', 'Mendes Corp', 'lucas.mendes@email.com', 'Av. Atlântica, 400', 'Florianópolis', 'Brasil'),
(6, 'Sofia Garcia', NULL, 'sofia.garcia@email.com', 'Rua Central, 89', 'Madrid', 'Espanha'),
(7, 'Hugo Oliveira', 'Oliveira Tech', 'hugo.oliveira@email.com', 'Rua 7, 120', 'Porto', 'Portugal'),
(8, 'Emma Brown', 'Brown & Co', 'emma.brown@email.com', '10 Main St', 'London', 'UK'),
(9, 'João Pedro', 'Pedro Solutions', 'joao.pedro@email.com', 'Rua Azul, 99', 'Brasília', 'Brasil'),
(10, 'Ava Wilson', 'Wilson Logistics', 'ava.wilson@email.com', '45 Hill Road', 'Sydney', 'Austrália'),
(11, 'Mateo Martinez', 'Martinez Ltda', 'mateo.martinez@email.com', 'Calle 50, 300', 'Buenos Aires', 'Argentina'),
(12, 'Liam Davis', NULL, 'liam.davis@email.com', '123 Elm St', 'Toronto', 'Canadá'),
(13, 'Isabella López', 'López Group', 'isabella.lopez@email.com', 'Calle Roja, 25', 'Cidade do México', 'México'),
(14, 'Noah Taylor', 'Taylor Inc', 'noah.taylor@email.com', '789 Pine St', 'Chicago', 'USA'),
(15, 'Lucas Ferreira', 'Ferreira S.A.', 'lucas.ferreira@email.com', 'Av. Brasil, 500', 'Salvador', 'Brasil'),
(16, 'Chloe Evans', NULL, 'chloe.evans@email.com', '12 High St', 'Manchester', 'UK'),
(17, 'Daniel Costa', 'Costa Empreendimentos', 'daniel.costa@email.com', 'Rua Verde, 77', 'Recife', 'Brasil'),
(18, 'Oliver Scott', 'Scott Enterprises', 'oliver.scott@email.com', '150 King St', 'Melbourne', 'Austrália'),
(19, 'Maria Pereira', NULL, 'maria.pereira@email.com', 'Rua Bela Vista, 22', 'Curitiba', 'Brasil'),
(20, 'Ethan Nguyen', 'Nguyen Tech', 'ethan.nguyen@email.com', '456 Broadway', 'San Francisco', 'USA'),
(21, 'Sophia Rivera', 'Rivera Ltda', 'sophia.rivera@email.com', 'Calle Azul, 80', 'Barcelona', 'Espanha'),
(22, 'David Lee', 'Lee & Partners', 'david.lee@email.com', '77 Harbor St', 'Seoul', 'Coreia do Sul'),
(23, 'Elena Rossi', 'Rossi Group', 'elena.rossi@email.com', 'Via Roma, 60', 'Roma', 'Itália'),
(24, 'Benjamin Harris', NULL, 'benjamin.harris@email.com', '35 Oak St', 'Vancouver', 'Canadá'),
(25, 'Alice Moreau', 'Moreau Enterprises', 'alice.moreau@email.com', 'Rue Lafayette, 15', 'Paris', 'França'),
(26, 'Gabriel Costa', 'Costa & Associados', 'gabriel.costa@email.com', 'Rua Nova, 101', 'Porto Alegre', 'Brasil'),
(27, 'Santiago Gonzalez', NULL, 'santiago.gonzalez@email.com', 'Av. Central, 500', 'Santiago', 'Chile'),
(28, 'Olivia Hall', 'Hall Corporation', 'olivia.hall@email.com', '22 Queen St', 'Toronto', 'Canadá'),
(29, 'Henry Thompson', 'Thompson Group', 'henry.thompson@email.com', '600 Maple Rd', 'Los Angeles', 'USA'),
(30, 'Lara Martins', 'Martins Consulting', 'lara.martins@email.com', 'Av. Independência, 200', 'Belo Horizonte', 'Brasil');

INSERT INTO purchases (purchase_id, customer_id, employee_id, total_price, purchase_date, shipped_date, ship_address, ship_city, ship_country) VALUES
(1, 5, 2, 4999.99, '2024-03-01', '2024-03-03', 'Av. Paulista, 1000', 'São Paulo', 'Brasil'),
(2, 10, 3, 4299.99, '2024-03-02', '2024-03-05', '45 Hill Road', 'Sydney', 'Austrália'),
(3, 15, 4, 2499.99, '2024-03-03', '2024-03-06', 'Av. Brasil, 500', 'Salvador', 'Brasil'),
(4, 20, 1, 349.99, '2024-03-04', '2024-03-07', '456 Broadway', 'San Francisco', 'USA'),
(5, 25, 2, 1999.99, '2024-03-05', '2024-03-09', 'Rue Lafayette, 15', 'Paris', 'França'),
(6, 8, 3, 699.99, '2024-03-06', '2024-03-10', '10 Main St', 'London', 'UK'),
(7, 12, 4, 1599.99, '2024-03-07', '2024-03-11', '123 Elm St', 'Toronto', 'Canadá'),
(8, 18, 1, 1299.99, '2024-03-08', '2024-03-12', '150 King St', 'Melbourne', 'Austrália'),
(9, 22, 2, 349.99, '2024-03-09', '2024-03-13', '77 Harbor St', 'Seoul', 'Coreia do Sul'),
(10, 28, 3, 799.99, '2024-03-10', '2024-03-14', '22 Queen St', 'Toronto', 'Canadá'),
(11, 3, 4, 299.99, '2024-03-11', '2024-03-15', 'Rua A, 50', 'Lisboa', 'Portugal'),
(12, 7, 1, 1299.99, '2024-03-12', '2024-03-16', 'Rua 7, 120', 'Porto', 'Portugal'),
(13, 14, 2, 3499.99, '2024-03-13', '2024-03-17', '789 Pine St', 'Chicago', 'USA'),
(14, 17, 3, 249.99, '2024-03-14', '2024-03-18', 'Rua Verde, 77', 'Recife', 'Brasil'),
(15, 23, 4, 3499.99, '2024-03-15', '2024-03-19', 'Via Roma, 60', 'Roma', 'Itália'),
(16, 30, 1, 349.99, '2024-03-16', '2024-03-20', 'Av. Independência, 200', 'Belo Horizonte', 'Brasil'),
(17, 9, 2, 4999.99, '2024-03-17', '2024-03-21', 'Rua Azul, 99', 'Brasília', 'Brasil'),
(18, 26, 3, 699.99, '2024-03-18', '2024-03-22', 'Rua Nova, 101', 'Porto Alegre', 'Brasil'),
(19, 1, 4, 1599.99, '2024-03-19', '2024-03-23', 'Av. Paulista, 1000', 'São Paulo', 'Brasil'),
(20, 11, 1, 4299.99, '2024-03-20', '2024-03-24', 'Calle 50, 300', 'Buenos Aires', 'Argentina');

INSERT INTO purchase_items (purchase_id, product_id, quantity, unit_price) VALUES
(1, 7, 1, 4999.99),
(2, 6, 1, 4299.99),
(3, 11, 1, 2499.99),
(4, 15, 1, 349.99),
(5, 21, 1, 1999.99),
(6, 8, 1, 699.99),
(7, 10, 1, 1599.99),
(8, 12, 1, 1299.99),
(9, 15, 1, 349.99),
(10, 23, 1, 799.99),
(11, 28, 1, 299.99),
(12, 12, 1, 1299.99),
(13, 4, 1, 3499.99),
(14, 18, 1, 249.99),
(15, 4, 1, 3499.99),
(16, 15, 1, 349.99),
(17, 7, 1, 4999.99),
(18, 25, 1, 699.99),
(19, 10, 1, 1599.99),
(20, 6, 1, 4299.99);

\d+ public.* 