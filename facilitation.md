
# test img

# Run the MySQL container
docker run -d --name wordpress-db \
  -e MYSQL_ROOT_PASSWORD=rootpassword \
  -e MYSQL_DATABASE=wordpress \
  -e MYSQL_USER=wordpressuser \
  -e MYSQL_PASSWORD=wordpresspassword \
  mysql:5.7

# Run the WordPress container using the custom image
docker run -d --name wordpress-app --link wordpress-db:db -p 8000:80 lu1-wordpress


# save for later
<!-- helm install argocd -n argocd --create-namespace argo/argo-cd --version 3.35.4 -f terraform/values/argocd.yaml -->

# Argocd 

# install using Helm

helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

helm search repo argocd 

kubectl create namespace argocd


helm install argocd argo/argo-cd --namespace argocd

helm list -A 

kubectl get pods -n argocd
kubectl get secrets -n argocd


#  Access the Argo CD UI:

<!-- kubectl port-forward svc/argocd-server -n argocd 8080:443 -->

#Retrieve the initial admin password:

#The initial admin password is stored in a Kubernetes secret. Retrieve it with the following command:


<!-- kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d -->

kubectl get secrets argocd-initial-admin-secret -n argocd -o yaml -n argocd

echo "pass" | base64 -d


 <!-- kubectl port-forward svc/argocd-server -n argocd 8081:80 -->
 kubectl port-forward svc/argocd-server -n argocd 8081:443


helm create mychart




helm install lupress-release wordpress/ --values wordpress/values.yaml

helm upgrade lupress-release wordpress/ --values wordpress/values.yaml

helm install new-release-name wordpress --values wordpress/values.yaml




helm upgrade lu-release wordpress --values wordpress/values.yaml --values wordpress/values.yaml 



minikube tunnel

 git clone https://github.com/kubernetes-incubator/metrics-server.git