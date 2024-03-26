raise 'missing aws' unless `aws --version 2>&1`.include?('aws-cli')
raise 'wrong credentials' unless system('aws s3api list-objects --bucket lihan > /dev/null')
