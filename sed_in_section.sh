echo "Input your var: "
read var
sleep 0.5s
#
if test -n "$var"
then
#edit only the one section
  cat inputfile | sed -e "/section_start/,/section_end/ s/template/$var/" > outputfile
else
  echo "No input, pass the step"
fi