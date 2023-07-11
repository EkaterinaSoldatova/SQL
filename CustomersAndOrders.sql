Вывести названия всех компаний, которые не выполнили заказ с 15.11.1996 – 18.02.1997 
SELECT Customers.CompanyName
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
WHERE Orders.OrderDate NOT BETWEEN ‘15.11.1996’ AND ‘18.02.1997’;

Вывести названия компаний поставщиков, которые находятся в México D.F.;
SELECT CompanyName
FROM Customers
WHERE City=’México D.F.’;

Вывести только те заказы, которые были оформлены с 12.12.1996 по 18.02.1997;
SELECT *
FROM Orders
WHERE OrderDate BETWEEN ‘12.12.1996’ AND ‘18.02.1997’;

Вывести только тех заказчиков,  название компании которых начинаются с ‘An’;
SELECT *
FROM Customers
WHERE CompanyName LIKE ‘An%’;

Вывести названия компаний и заказы, которые они оформили, с суммой заказа более 17000. Использовать соединение таблиц.
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
WHERE Orders.OrderSum>17000;

Вывести следующие колонки: имя поставщика, сумма заказа. Результаты отсортировать по поставщикам в порядке убывания
SELECT Customers.CustomerName, Orders.OrderSum
FROM Customers
JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName DESC;

Вывести следующие колонки: имя поставщика, дата заказа. Вывести  таким образом, чтобы все заказчики из таблицы 1 были показаны в таблице результатов.
SELECT Customers.CustomerName, Orders.OrderDate
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
