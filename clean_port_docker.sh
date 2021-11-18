for i in {3000..3010}; do lsof -i tcp:$i | grep LISTEN | awk '{print$2}' | xargs kill -9; done
