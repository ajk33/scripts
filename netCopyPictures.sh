src=`./finddrive.pl -n`
dst=`./finddrive.pl -p`
if [ '$src' == '' ] ; then
  echo "No NAS found"
  exit
fi
echo "src=$src/Our Pictures/"
echo "dst=$dst/Our Pictures"
rsync -avP --delete $src/Our\ Pictures/ $dst/Our\ Pictures
