# **DESCRIPTION DU PROJET**
## **Pour commencer:**
### <p>Ce projet est un exemple de déploiement d'une application dotnet via kubernetes.<br></p>

<p><br></p>

### **Pré-requis:**
<p>-docker desktop<br>
-kubernetes<br>
-dockerhub image: nancylence/exo3-kub:latest<br></p>

<p><br></p>

### **Comment j'ai envoyé l'image sur dockerhub:**
```bash
    docker build -t exo3-kub . 
    docker run --name dotnet-app -d -p 80:80 exo3-kub
    docker tag exo3-kub nancylence/exo3-kub
    docker push nancylence/exo3-kub
```
<p><br></p>

### **Comment j'ai push sur Git:**
<p>1-Créer un nouveau repo public sur mon git<br>
2-Ensuite j'ai exécuté les commandes suivantes sur mon CMD:</p>

```bash
    git clone https://github.com/Nancy61/appdotnet-exo3.git
#j'ai manuellement rajouter les fichiers de mon app dans le dossier de mon repo créer automatiquement après le clone
    git commit -m "description"
    git push
```

### **Comment déployer l'application:**
<p>1-Connectez-vous sur votre terminal en tant qu'administrateur.<br>
2-Saisissez les commandes suivantes:</p>

```bash
    kubectl get all 
    kubectl apply -f .\resource-files\service.yml,.\resource-files\deployment.yml
    kubectl get svc
    minikube service mon-site-exo3-service
    kubectl get pods
```

### **NB:**
Si vous avez déjà déployé un site qui écoute sur le port 8080, pensez à le supprimer avant de déployer cette application avec la commande:

```bash
    - kubectl delete svc example-deployment
```