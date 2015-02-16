src=`./finddrive.pl -n`
dst=`./finddrive.pl -p`
echo "src=$src/Our Pictures/"
echo "dst=$dst/Our Pictures"
rsync -avP --delete $src/Our\ Pictures/ $dst/Our\ Pictures
