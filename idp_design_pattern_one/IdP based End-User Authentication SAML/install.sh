cd config
rm -rf edge.json
mvn process-resources -Ptest -Dorg=$1 -Dusername=$2 -Dpassword=$3 -Dapigee.config.options=create 
mvn install -Ptest -Dorg=$1 -Dusername=$2 -Dpassword=$3 -Dapigee.config.options=create 
cd ../sharedflow
rm -rf target
mvn install -Ptest -Dorg=$1 -Dusername=$2 -Dpassword=$3 -Dapigee.config.options=create 
cd ../proxy
rm -rf target
mvn install -Ptest -Dorg=$1 -Dusername=$2 -Dpassword=$3 -Dapigee.config.options=create 
cd ../protected_api_proxy
rm -rf target
mvn install -Ptest -Dorg=$1 -Dusername=$2 -Dpassword=$3 -Dapigee.config.options=create 
cd ../app_config
rm -rf edge.json
mvn process-resources -Ptest -Dorg=$1 -Dusername=$2 -Dpassword=$3 -Dapigee.config.options=create 
mvn install -Ptest -Dorg=$1 -Dusername=$2 -Dpassword=$3 -Dapigee.config.options=create
mvn apigee-config:exportAppKeys -Ptest  -Dorg=$1 -Dusername=$2 -Dpassword=$3 -Dapigee.config.exportDir=./app_info
cat ./app_info/devAppKeys.json
cd ..
