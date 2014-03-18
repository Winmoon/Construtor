# Usage; 
#   htmls2hamls RAILS_ROOT/app/views/TARGETS
 
 
# Assume $1 is path to directory containing views in a rails project and $2 
: $1
 
if test -d $1 
then echo 'processing..'
else echo Directory path must be specified for first argument; exit
fi
 
for i in $1/*.html
do html2haml $i > ${i%.html}.haml
done

exit
