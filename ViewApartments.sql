SELECT client.last_name
FROM view
JOIN client
ON view.client_id=client.client_id
JOIN apartment
ON view.apartment_id=apartment.apartment_id
WHERE apartment.room=3
GROUP BY client.last_name
HAVING COUNT(view.client_id)>=2;
