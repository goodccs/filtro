#!/bin/bash
usage()
{
cat << EOF
uso: $0 opciones
Este script escanea el archivo de entrada dado y para la columna especifica cuenta su ocurrencia #   
OPCIONES:
   -h      Muestra instruciones de uso
   -f      Archivo de entrada
   -r      Dato a Filtrar
EOF
}   
DATA_FILE=
#COL_NUM=
REG_EX=
while getopts ":f:r:h" OPTION
#while getopts ":j:f:r:h" OPTION
do
     case $OPTION in
         f) DATA_FILE="$OPTARG" ;;
         r) REG_EX="$OPTARG" ;;
#         j) COL_NUM="$OPTARG" ;;
         \?) usage
             exit 1 ;;
         h)
             usage
             exit 1 ;;
     esac
done
if [ -z $DATA_FILE ] || [ -z $REG_EX ] #|| [ -z $COL_NUM ] ;
then
     usage
     exit 1
fi
#awk -F' ' '{ print $num_column }' dir_file | sort | uniq -c | grep -v filtro
awk -F' ' '{ print $3 }' $DATA_FILE | sort | uniq -c | grep -v $REG_EX
echo "se ejecuto el archivo -> ${DATA_FILE} con el filtro -> ${REG_EX}"
exit 0
