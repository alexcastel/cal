#!/bin/bash


case $# in #Miramos el número de argumentos en el comando
0) echo "No hay argumentos, el uso del comando es: mcal mes año"
cal;;
1) #en caso que solo introduzcan un argumento, puede ser o help o un mes o un año


if [ $1 = "-help" ] #compruebo que el único argumento sea la solicitud de ayuda
then 
echo "El comando mcal admite el uso con uno o dos comandos, si se introducen más"
echo "se obviarán los que excedan al segundo parámetro. En el caso de que  sólo se introduzca"
echo "un parámetro, el comando analiza si puede tratarse de un mes, si está entre 1 y 12 mostrará"
echo "el mes del año en curso si es otro número se interpreta que se desea el calendario de ese año."
elif [ $1 -ge 1 ] && [ $1 -le 12 ]   # si no me piden ayuda entiendo 
# y me introducen un número, entonces miro si se puede tratar de un mes, por error 
#del usuario
then	echo "Interpreto que deseas preguntar por el mes del presente año" $(date +%Y) 
# informo del año en que estoy y usaré esa misma forma para calcular la fecha que me solicitan
# al llamar al cal con el dato del año en curso y el mes que me introducen

	cal $1 $(date +%Y)

elif [ $1 -gt 12 ]
then echo "Calculo el año introducido."
cal $1

else #si no es una solicitud de ayuda ni un mes en número, ni un año en número, puede ser un 
# mes en letras


echo "Calculo el calendario del mes introducido para este año"

cal -m $1 $(date +%Y)


fi;; 
2) echo "Se han indicado dos argumentos, el primero es el mes y el segundo el año"
cal $1 $2;;
*) echo "Número máximo de  argumentos excedido, se supone que el primero es mes y el segundo año,"
   echo "se desestima el resto."
cal $1 $2;;
esac
