
# DevOps tasks

This repo contains 3 tasks. To get more details regarding each of them please read the respective section in this document.

## Part 1: Working with Docker

As an example of Node.js application I've picked [nestjs starter](https://github.com/nestjs/typescript-starter), just beacause it already contains some tests which are required in the second task. To read nestjs starter documentation, please go to [nestjs.README.md](nestjs.README.md) file.

```bash
# To build an image
$ docker build -t node_task1 .

# To run a container
$ docker run --rm -ti -d -p 3000:3000 node_task1

# I've pushed my image to Docker Hub, in accordance with the task. So you can run it without local build
$ docker run --rm -ti -d -p 3000:3000 aivlevtmp/tmp-repo:latest

# To verify application
$ curl http://localhost:3000/
```

You can find this image on the [Docker Hub](https://hub.docker.com/repository/docker/aivlevtmp/tmp-repo/tags).

## Part 2: Working with CI/CD

Please find GitHub Actions pipeline file under [.github/workflows/ci.yml](.github/workflows/ci.yml).

It does the following steps:
1. Lint the nest app
2. Run tests for two Node.js versions
3. Build docker image and push to the same [Docker Hub repo](https://hub.docker.com/repository/docker/aivlevtmp/tmp-repo/tags)

I decided to do all these steps consequentially, and tests in parallel, although in real life it may depend on many things.

## Part 3: Working with Helm and Terraform

 Terraform configuration files can be found under **infra** directory. Helm configuration files can be found under **infra/task3** directory.

 ```bash
# To download terraform providers
$ terraform init

# To create local kind cluster and install the helm chart
$ terraform apply -auto-approve

# To verify application
$ curl http://localhost/
```

For this test task I decided to use NodePort service type to expose application. In real life probably you will not expose applications in this way, you would rather use Ingress resource or LoadBalancer service type. Kind cluster also supports nginx ingress, but I decided to use simple NodePort service to reduce complexity and save time.

To be able to verify our application we need to have *extra_port_mappings* config for the kind cluster.

Helm chart deployment is done via Terraform using Helm provider.