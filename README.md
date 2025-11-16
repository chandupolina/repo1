1st stage :
builds an image in jenkins-server and and currently it is in our local machine 
2nd stage :
pushing an image to gar  requires few permissions:
* artifactregistry.writer, storage.objectadmin and 
also need to
1) Authenticate docker to GAR inside the vm
------gcloud auth configure-docker us-docker.pkg.dev
2) If your repository is multi-region, also run:
----gcloud auth configure-docker   # This command updates: ~/.docker/config.json  so that Docker uses gcloud’s credentials.
3) Authenticate using your service account
----gcloud auth activate-service-account k8s-infra-sa@gowtham-project-476511.iam.gserviceaccount.com \
    --key-file=/path/to/your-service-account-key.json
4) ---gcloud auth list
5) Try pushing again
docker tag python-app:latest us-docker.pkg.dev/gowtham-project-476511/python-app/img:v1
docker push us-docker.pkg.dev/gowtham-project-476511/python-app/img:v1





