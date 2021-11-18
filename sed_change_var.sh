
cat login.defs | grep "PASS_MIN_DAYS"
VAR=$(cat ./login.defs | grep "PASS_MIN_DAYS" | awk 'FNR == 2 {print $2}')
TARGET=1
sed -i '/^#/!s@\b'"$VAR"'\b@'"$TARGET"'@' ./login.defs
VAR=$(cat ./login.defs | grep "PASS_MAX_DAYS" | awk 'FNR == 2 {print $2}')
TARGET=365
sed -i '/^#/!s@\b'"$VAR"'\b@'"$TARGET"'@' ./login.defs
cat login.defs | grep PASS

