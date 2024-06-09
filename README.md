## WordPress Container Project:

This project demonstrates the setup of a WordPress deployment using Minikube, Docker, GitHub, and ArgoCD. The guide covers creating a local Kubernetes cluster, setting up a Docker private repository, using GitHub for version control, building and pushing Docker images, and deploying with ArgoCD. Additionally, an optional section explains how to replace Helm with Kustomize.



## GitHub Repository Setup
Create a GitHub Repository:
Create a new repository on GitHub named wordpress-container.
Clone the WordPress code from its official repository:


```bash
git clone https://github.com/WordPress/WordPress.git

```
    
## Steps
1. Create a Dockerfile
Create a Dockerfile in GitHub repository. This file will be used to build the Docker image for WordPress.

2. Build and Tag the Docker Image
Build the Docker image locally and tag it as lu1-wordpress.

```bash
docker build -t lu1-wordpress .

```

3. Push the Image to a Private DockerHub Repository

tag your Docker image with your DockerHub username and push it to your private repository.


```bash
docker tag lu1-wordpress your-dockerhub-username/lu1-wordpress:latest
docker push your-dockerhub-username/lu1-wordpress:latest
```

4. Configure GitHub Actions Workflow
Create a .github/workflows/doc.yml file in your GitHub repository. This file will define the workflow to build and push the Docker image to DockerHub.


## ArgoCD

* install using Helm

## Access the Argo CD UI:

* Retrieve the initial admin password:

* The initial admin password is stored in a Kubernetes secret. Retrieve it with the following command:

```bash
kubectl get secrets argocd-initial-admin-secret -n argocd -o yaml -n argocd

echo "<password>" | base64 -d
```

* then use port-forward every time you need to access Argocd UI :

```bash
kubectl port-forward svc/argocd-server -n argocd 8081:443

```

## Helm Chart Creation
* Create a Helm Chart:
Create a new branch in your GitHub repository:
```bash
git checkout -b helm
```
Create a Helm chart:
```bash
helm create wordpress
helm install lupress-release wordpress/ --values wordpress/values.yaml
#then
helm upgrade lupress-release wordpress/ --values wordpress/values.yaml
```


## Apply Kustomize Configuration:
```
kubectl apply -k .
```
## The difference between Helm and Kustomize

* Helm is more like a full-featured package manager for Kubernetes, great for deploying complex applications with dependencies and requiring templating.
* Kustomize is a configuration management tool focusing on customizing Kubernetes resource files without introducing the complexity of templating.
  
Depending on your specific needs—whether you prioritize simplicity and direct YAML manipulation (Kustomize) or require advanced templating and package management capabilities (Helm)—you can choose the tool that best fits your Kubernetes configuration and deployment workflow.

