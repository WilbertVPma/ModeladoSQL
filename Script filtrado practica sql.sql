--- Script de filtrado

select nombremodelo, nombremarca, nombregrupoempresarial, fechacompra, matricula, nombrecolor, kmtotal, ndepoliza, nombreaseguradora
from wvcontrolcoches.coche join wvcontrolcoches.modelo on modelo=idmodelo and fechabaja = '4000-01-01' join wvcontrolcoches.marca on marca=idmarca
join wvcontrolcoches.grupoempresarial on grupoempresarial=idgrupoempresarial join wvcontrolcoches.color on color=idcolor
join wvcontrolcoches.aseguradora on aseguradora=idaseguradora;