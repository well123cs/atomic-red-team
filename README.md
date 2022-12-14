# atomic-red-team
# T1613 -  Container and Resource Discovery
## [Description from ATT&CK](https://attack.mitre.org/techniques/T1613/)
<blockquote>Adversaries may abuse a container administration service to execute commands within a container. A container administration service such as the Docker daemon, the Kubernetes API server, or the kubelet may allow remote management of containers within an environment.(Citation: Docker Daemon CLI)(Citation: Kubernetes API)(Citation: Kubernetes Kubelet)

In Docker, adversaries may specify an entrypoint during container deployment that executes a script or command, or they may use a command such as <code>docker exec</code> to execute a command within a running container.(Citation: Docker Entrypoint)(Citation: Docker Exec) In Kubernetes, if an adversary has sufficient permissions, they may gain remote execution in a container in the cluster via interaction with the Kubernetes API server, the kubelet, or by running a command such as <code>kubectl exec</code>.(Citation: Kubectl Exec Get Shell)</blockquote>

## Atomic Tests

- [Atomic Test #1 - ExecIntoContainer](#atomic-test-1---execintocontainer)


<br/>

## Atomic Test #1 - ExecIntoContainer
Adversaries may attempt to discover containers and other resources that are available within a containers environment. 

**Supported Platforms:** Containers


**auto_generated_guid:** d03bfcd3-ed87-49c8-8880-44bb772dea4b





#### Inputs:
| Name | Description | Type | Default Value |
|------|-------------|------|---------------|
| namespace | K8s namespace to use | String | default|
| command | Command to run | String | uname|


#### Attack Commands: Run with `bash`! 


```bash
docker build -t t1613  src/
docker run -d -t t1613
docker ps

```

#### Cleanup Commands:
```bash
docker rm $(docker stop $(docker ps -a -q --filter ancestor=t1613))
```



#### Dependencies:  Run with `bash`!
##### Description: kubectl must be installed
##### Check Prereq Commands:
```bash
command -v docker

```
##### Get Prereq Commands:
```bash
echo "docker must be installed manually"
```




<br/>
