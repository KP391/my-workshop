
echo "... Choose node type to install"
echo "... Choose Network Version"
OPTION_NETWORK=("Mainnet" "Testnet")
PS3='Choose Network Type: '
select opt in "${OPTION_NETWORK[@]}"; do
  case $opt in
  "Mainnet")
#    FULLNODE_LATEST_VERSION="0.8.2"
#    FULLNODE_VERSION_PATH="fullnode/prod/$FULLNODE_LATEST_VERSION"
    echo "Mainnet"
    break
    ;;
  "${OPTION_NETWORK[1]}")
#    FULLNODE_LATEST_VERSION="0.8.1"
#    FULLNODE_VERSION_PATH="fullnode/testnet/$FULLNODE_LATEST_VERSION"
    echo "Testnet"
    break
    ;;
  esac
done
