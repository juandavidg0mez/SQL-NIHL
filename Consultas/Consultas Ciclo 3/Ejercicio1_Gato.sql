
-- Primera consulta Table Cat

select name , sex , fav_toy, if(sex = Male and fav_toy = null, 'tiene jugute', 'no tiene') as 'Machos'
from catTabla;


-- Segunda Consulta Table Cat

select id, name, breed, coloracion, sex , fav_toy , if(sex = female and fav_toy <> null , 'aplica' , 'no aplica') as 'columSex'
from catTabla
where breed <> presa and breed <> siamesa;

