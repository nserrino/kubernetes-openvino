FROM openvino/model_server:latest

ADD model/1 /models/face-detection/1

CMD ["/ovms/bin/ovms", "--model_path", "/models/face-detection", "--model_name", "face-detection", "--port", "9000", "--shape", "auto"]
