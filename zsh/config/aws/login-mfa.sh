function login-mfa() {
  local response="$(aws sts get-session-token --serial-number $1 --token-code $2)"
  export AWS_ACCESS_KEY_ID="$(echo $response | jq -r '.Credentials.AccessKeyId')"
  export AWS_SECRET_ACCESS_KEY="$(echo $response | jq -r '.Credentials.SecretAccessKey')"
  export AWS_SESSION_TOKEN="$(echo $response | jq -r '.Credentials.SessionToken')"
}
