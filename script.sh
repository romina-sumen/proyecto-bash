#!/bin/bash
export FILENAME=consolidado
FILENAME=consolidado
echo $FILENAME

if [ "$1" = "-d" ]; then
if [  -f "$HOME/EPNro1/consolidar.pid"  ]; then
kill "$(cat "$HOME/EPNro1/consolidar.pid")"
fi
rm -rf "$HOME/EPNro1"
echo "Entorno eliminado"
exit 0
fi

opcion=0
while [ "$opcion" -ne 7 ]

do

echo "1- Crear entorno"
echo "2- correr proceso"
echo "3- mostrar alumnos ordenados por nro de padron"
echo "4- mostrar las 10 notas mas altas del listado"
echo "5- Ingrese el numero de padrón a consultar"
echo "6- ver log"
echo "7- Salir"
echo "Eliminar todo con parametro optativo (-d)"
echo "================================================="
read -p "Opcion: " opcion
case $opcion in

1)
mkdir ~/EPNro1/ ~/EPNro1/entrada ~/EPNro1/salida ~/EPNro1/procesado
echo "Entorno creado" ;;

2)
cp consolidar.sh "$HOME/EPNro1/"
cd "$HOME/EPNro1" || exit 1
bash consolidar.sh &
echo "Proceso iniciado"
;;

3)
if [  -f "$HOME/EPNro1/salida/${FILENAME}.txt"  ];then
      sort -n "$HOME/EPNro1/salida/${FILENAME}.txt"
else
      echo "No existe el archivo ${FILENAME}.txt en la carpeta salida"
fi ;;

4)
if [  -f "$HOME/EPNro1/salida/${FILENAME}.txt" ];then
      sort -k5,5nr "$HOME/EPNro1/salida/${FILENAME}.txt" | head -10
else
      echo "No existe el archivo ${FILENAME.txt}"
fi ;;

5)
if [  -f "$HOME/EPNro1/salida/${FILENAME}.txt" ];then
      read -p "Ingrese el numero de padrón a consultar: " padron
      grep "$padron" "$HOME/EPNro1/salida/${FILENAME}.txt"
else
      echo "No existe el archivo ${FILENAME.txt}"
fi ;;

6)
if [  -f "$HOME/EPNro1/procesado.log"  ];then
      cat "$HOME/EPNro1/procesado.log"
else
      echo "No existe el archivo de log"
fi ;;

7)
echo "Saliendo"
exit 0 ;;
esac
done
