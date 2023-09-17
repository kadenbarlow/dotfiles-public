login-ecr () {
  local region="us-east-1"
  if [[ ! -z "$1" ]]; then
    region="$1"
  fi
  local password="$(aws ecr get-login-password --region $region)"
  local account="$(aws sts get-caller-identity --query 'Account' --output text)"
  docker login -u AWS -p $password $account.dkr.ecr.$region.amazonaws.com
}

login-mfa () { 
  local response="$(aws sts get-session-token --serial-number $1 --token-code $2)"
  export AWS_ACCESS_KEY_ID="$(echo $response | jq -r '.Credentials.AccessKeyId')"
  export AWS_SECRET_ACCESS_KEY="$(echo $response | jq -r '.Credentials.SecretAccessKey')"
  export AWS_SESSION_TOKEN="$(echo $response | jq -r '.Credentials.SessionToken')"
}
