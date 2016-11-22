echo "Input your var: "
read var
sleep 0.5s
#
if test -n "$var"
then
  cat inputfile | sed s/"template"/"$var"/g > outputfile
else
  echo "No input, pass the step"
fi