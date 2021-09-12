cat $1 |\
sed '/^\/\//d' |\
sed '/^tick/d' |\
sed '/^tock,/d' |\
sed '/^eval,/d' |\
sed 's/,/;/g' |\
sed 's/^output;/#step;/g' |\
sed 's/^set \(.*\) /\1 <= /g' |\
sed "s/%B/16'b/g" |\
sed 's/^output;/#step;/g' |\
ruby -nle 'BEGIN{t = ""}; print $_ if !(t == $_ && t == "#step;"); t = $_;' |\
sed 's/^\(.*\)$/    \1/g' |\
cat -s