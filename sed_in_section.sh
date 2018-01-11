echo "Input your new var: "
read var
sleep 0.5s
#
if test -n "$var"
then
#edit only one section, where %template% is old variable value
  cat %inputfile% | sed -e "/%section_start%/,/%section_end%/ s/%template%/$var/" > %outputfile%
else
  echo "No input, pass the step"
fi
