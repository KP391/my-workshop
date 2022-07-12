(( $1 % 3 )) || result+=Pling
(( $1 % 5 )) || result+=Plang
(( $1 % 7 )) || result+=Plong

echo ${result:-$1}

# Solution by tylus >> https://exercism.org/profiles/tylus

# I just like how short this is... does this even work?

