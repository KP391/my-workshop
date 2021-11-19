# This function is a part of wair_for script in 
# https://github.com/graphprotocol/graph-node/blob/master/docker/wait_for
# $# counted how much argument follows whatever come after wait_for. For example, wait_for -t -q, $# should be 2 

while [ $# -gt 0 ] #This will looped until all $# is 'shift'ed to 0. More explaination at https://askubuntu.com/questions/939620/what-does-mean-in-bash
do
  case "$1" in
    *:* ) #case for host:port
    HOST=$(printf "%s\n" "$1"| cut -d : -f 1)
    PORT=$(printf "%s\n" "$1"| cut -d : -f 2)
    shift 1
    ;;
    -q | --quiet) #flag quiet
    QUIET=1
    shift 1
    ;;
    -t) 
    TIMEOUT="$2"
    if [ "$TIMEOUT" = "" ]; then break; fi # I'm guessing '  [ -z "$TIMEOUT" ] && break   ' will work the same way
    shift 2  #shift 2 because there's 2, -t and number that follows it
    ;;
    --timeout=*)
    TIMEOUT="${1#*=}" #Maybe this referred to er.... 1# (1st position entity) from * ? I have no idea, will look into this later
    shift 1
    ;;
    --)
    shift
    break
    ;;
    --help)
    usage 0
    ;;
    *)
    echoerr "Unknown argument: $1"
    usage 1
    ;;
  esac
done

echoerr() {
  if [ "$QUIET" -ne 1 ]; then printf "%s\n" "$*" 1>&2; fi
}
