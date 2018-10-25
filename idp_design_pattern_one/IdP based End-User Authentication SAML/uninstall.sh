cd ./app_config
rm -rf edge.json
mvn process-resources -Ptest -Dorg=$1 -Dusername=$2 -Dpassword=$3 
mvn install -Ptest -Dorg=$1 -Dusername=$2 -Dpassword=$3 -Dapigee.config.options=delete
cd ..
