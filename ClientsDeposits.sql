SELECT ClientName AS 'Клиент',
    SUM(IF(Currency = "USD", amount, 0)) as 'Доллары',
    SUM(IF(Currency = "RUB", amount, 0)) as 'Рубли',
    SUM(IF(Currency = "EUR", amount, 0)) as 'Евро'
FROM
(SELECT Clients.ClientName, Deposits.Currency, COUNT(Deposits.Currency) as amount
  FROM Deposits
  JOIN Clients
    ON Deposits.ClientID = Clients.ClientID
  JOIN Status
    ON Deposits.StatusID = Status.StatusID
  WHERE Status.StatusCode="WORK" AND Deposits.Saldo > 0
  GROUP BY Deposits.Currency, Clients.ClientName) new_table
  GROUP BY ClientName;
