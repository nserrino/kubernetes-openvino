# Example Kubernetes deployment of OpenVINO face detector

Setup to serve an OpenVINO face detector model on Kubernetes

## Deploying to Kubernetes

1. Apply the YAML file

```
kubectl apply -f openvino-model-server.ymal
```

2. Follow steps 5 and 6 from the [OVMS Quickstart](https://github.com/openvinotoolkit/model_server/blob/main/docs/ovms_quickstart.md). 

3. Forward traffic from localhost to the Kubernetes service

```
kubectl port-forward service/openvino-model-server 9000:9000
```

4. Follow steps 7 and 8 from the [OVMS Quickstart](https://github.com/openvinotoolkit/model_server/blob/main/docs/ovms_quickstart.md).



## Building the docker container

1. Copy the face detection model to the current directory (from the [OVMS Quickstart](https://github.com/openvinotoolkit/model_server/blob/main/docs/ovms_quickstart.md))

```
curl --create-dirs https://download.01.org/opencv/2021/openvinotoolkit/2021.1/open_model_zoo/models_bin/1/face-detection-retail-0004/FP32/face-detection-retail-0004.xml https://download.01.org/opencv/2021/openvinotoolkit/2021.1/open_model_zoo/models_bin/1/face-detection-retail-0004/FP32/face-detection-retail-0004.bin -o model/1/face-detection-retail-0004.xml -o model/1/face-detection-retail-0004.bin
```

2. Build and push the docker container image

```
docker build . -t <NAME>
docker push <NAME>
```