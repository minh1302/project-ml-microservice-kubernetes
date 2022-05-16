## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint

# setup-hadolint:
# 	sudo apt install linuxbrew-wrapper
# 	brew install hadolint
# 	export PATH="/home/${USER}/.linuxbrew/bin:${PATH}"
# 	. ~/.bashrc

# setup-virtualbox:
# 	sudo apt-get update
# 	sudo apt-get install virtualbox

# setup-minikube:
# 	brew install minikube
setup:
	# Create python virtualenv & source it
	python3 -m venv ~/.devops
	. ~/.devops/bin/activate
	
install:
	# This should be run from inside a virtualenv
	pip3 install --upgrade pip &&\
		pip3 install -r requirements.txt
	
    wget -O /bin/hadolint "https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64" &&\
    chmod +x /bin/hadolint

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202 app.py

all: install lint test

# run-docker:
# 	. run_docker.sh

# make-prediction:
# 	. make_prediction.sh

# upload-docker:
# 	. upload_docker.sh
	
start-minikube:
	# To start a local cluster, type the terminal command:

	minikube start
	
	# After minikube starts, a cluster should be running locally. 
	# You can check that you have one cluster running by typing kubectl config view 
	# where you should see at least one cluster with a certificate-authority and server.
	kubectl config view
	
# run-kubernetes:
# 	. run_kubernetes.sh

delete-minikube:
	minikube delete


