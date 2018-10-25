cd config
rm -rf edge.json
mvn install -Ptest -Dorg=$1 -Denv=$2 -Dusername=$3 -Dpassword=$4 -Dapigee.config.options=update 
cd ../sharedflow
rm -rf target
mvn install -Ptest -Dorg=$1 -Denv=$2 -Dusername=$3 -Dpassword=$4 -Dapigee.config.options=update 
cd ../proxy
rm -rf target
mvn install -Ptest -Dorg=$1 -Denv=$2 -Dusername=$3 -Dpassword=$4 -Dapigee.config.options=update 
cd ../protected_api_proxy
rm -rf target
mvn install -Ptest -Dorg=$1 -Denv=$2 -Dusername=$3 -Dpassword=$4 -Dapigee.config.options=update 
cd ../app_config
rm -rf edge.json
mvn process-resources -Ptest -Dorg=$1 -Denv=$2 -Dusername=$3 -Dpassword=$4 -Dapigee.config.options=update 
mvn install -Ptest -Dorg=$1 -Denv=$2 -Dusername=$3 -Dpassword=$4 -Dapigee.config.options=update
mvn apigee-config:exportAppKeys -Ptest -Dorg=$1 -Denv=$2 -Dusername=$3 -Dpassword=$4 -Dapigee.config.exportDir=./app_info
cat ./app_info/devAppKeys.json
cd ..
