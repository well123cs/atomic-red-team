# atomic-red-team
# T1613 -  Container and Resource Discovery
## [Description from ATT&CK](https://attack.mitre.org/techniques/T1613/)
<blockquote>Adversaries may attempt to discover containers and other resources that are available within a containers environment. Other resources may include images, deployments, pods, nodes.
In Docker, logs may leak information about the environment, such as the environment’s configuration, which services are available, and what cloud provider the victim may be utilizing. The discovery of these resources may inform an adversary’s next steps in the environment, such as how to perform lateral movement and which methods to utilize for execution.</blockquote>

## Atomic Tests

- [Atomic Test #1 - ContainerResourceDiscovery](#atomic-test-1---ContainerResourceDiscovery)


<br/>

## Atomic Test #1 - ContainerResourceDiscovery
Adversaries may attempt to discover containers and other resources that are available within a containers environment. 

**Supported Platforms:** Containers


**auto_generated_guid:** 





#### Inputs:
| Name | Description | Type | Default Value |
|------|-------------|------|---------------|
| namespace | K8s namespace to use | String | default|
| command | Command to run | String | uname|


#### Attack Commands: Run with `bash`! 


```bash
docker ps
docker logs --tail 10 $(docker ps -l -q --filter ancestor=t1613)
docker stats --no-stream
docker inspect $(docker ps -a -q --filter ancestor=t1613)

```

#### Cleanup Commands:
```bash
docker rm $(docker stop $(docker ps -a -q --filter ancestor=t1613))
```



#### Dependencies:  Run with `bash`!
##### Description: Docker must be installed
##### Check Prereq Commands:
```bash
command -v docker

```
##### Get Prereq Commands:
```bash
echo "docker must be installed manually"

```




<br/>
