function login-ecr() {
  local region="us-east-1"
  if [[ ! -z "$1" ]]; then
    region="$1"
  fi
  local password="$(aws ecr get-login-password --region $region)"
  local account="$(aws sts get-caller-identity --query 'Account' --output text)"
  docker login -u AWS -p $password $account.dkr.ecr.$region.amazonaws.com
}
