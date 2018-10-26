var prompt = require("prompt");
var colors = require("colors/safe");
var replace = require("replace-in-file");

var srcDir = "./";

var schema = {
    properties: {
      org: {
        description: colors.yellow("Please provide the Apigee Edge Organization name"),
        message: colors.red("Apigee Edge Organization name cannot be empty!"),
        required: true
      },
      env: {
        description: colors.yellow("Please provide the Apigee Edge Environment name"),
        message: colors.red("Apigee Edge Environment name cannot be empty!"),
        required: true
      },
      username: {
        description: colors.yellow("Please provide the Apigee Edge username"),
        message: colors.red("Apigee Edge username cannot be empty!"),
        required: true
      },
      password: {
        description: colors.yellow("Please provide the Apigee Edge password"),
        message: colors.red("Apigee Edge password cannot be empty!"),
        hidden: true,  
        replace: '*',
        required: true
      }
    }
  };
 
//
// Start the prompt
//
prompt.start();
//
// Get two properties from the user: email, password
//
prompt.get(schema, function (err, options) {
  //console.log(JSON.stringify(options));
  deployProxyAndDependencies(srcDir, options);
});


function deployProxyAndDependencies(srcDir, options){
  const mvn = require('maven').create({
        cwd: srcDir,
        profiles: [options.env],
        debug: false
      });

  var mvnArgs = {
    'username': options.username,
    'password': options.password,
    'org': options.org,
    'env': options.env,
    'https.protocols' : 'TLSv1.2'
  };
  mvn.execute(['clean', 'install'], mvnArgs).then(() => {
    console.log('Successfully configured!');
  });
}
