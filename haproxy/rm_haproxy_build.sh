docker rmi `docker images | awk 'FNR == 2 {print $3}'` -f
