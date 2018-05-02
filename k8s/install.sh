#k8s install script

#1.  install on master and slave:
###############################

curl -fsSl https://get.docker.com | sh

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl
#optional - enables running pods on master - not recommended for production!
#kubectl --kubeconfig /etc/kubernetes/admin.conf taint nodes --all node-role.kubernetes.io/master-


#2.   install on master only
#####################################

#run master services and set network for pods
kubeadm init  --pod-network-cidr=192.168.0.0/16
kubectl --kubeconfig /etc/kubernetes/admin.conf apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.1/Documentation/kube-flannel.yml


#3.   on slaves only run
###############################
#on slave only - run last raw from kubeadm init output example:
#kubeadm join 172.31.8.67:6443 --token bk0ssn.ha1a2cdygup7zd2n --discovery-token-ca-cert-hash sha256:6d2f79a5b


#4.   on master run - folder creation
#######################################
#To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

#check if works (shoud get nodes with sttuses)
kubectl get nodes

#resetting k8s if initialised not correctly run reset + run correct init command again
#kubeadm reset


