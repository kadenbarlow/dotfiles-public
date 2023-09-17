autoload -U +X compinit && compinit
if [ $commands[kubectl] ]; then source <(kubectl completion zsh) || true; fi
# kubeoff # default context to off - run kubeon to show when working in k8s renable kubectl plugin in zshrc

alias k="kubectl"
alias kgp="k get pods"
alias kns="k create ns"
alias ka="k apply -f"
alias kr="k run"
alias kro="k run --dry-run=client -o yaml"

# https://kind.sigs.k8s.io/docs/user/ingress/
kind-start() {
  cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: local
networking:
  apiServerAddress: "0.0.0.0"
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
EOF
}

kind-install-nginx() {
  kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
}
