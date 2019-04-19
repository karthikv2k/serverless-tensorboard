# serverless-tensorboard
Using TensorBoard with Google Cloud Run
## Testing pre-built container locally
```
docker run -it -p 8080:8080 -e LOG_DIR=gs://[gcs path to tensorboard logs] -v /home/user/service_account.json:/key.json -e GOOGLE_APPLICATION_CREDENTIALS=/key.json karthikv2k/tensorboard:latest
```
Open http://localhost:8080 in your browser
## Build and push docker container
```
export PROJECT_NAME=$(gcloud config get-value project | head -n1)
export IMAGE_NAME=gcr.io/$PROJECT_NAME/tensorboard:latest
docker build -t $IMAGE_NAME .
docker push $IMAGE_NAME
```
## Deploy it on cloud run
```
gcloud beta run deploy tensorboard --image=$IMAGE_NAME --memory=2Gi --update-env-vars=LOG_DIR=gs://[gcs path to tensorboard logs] 
```
