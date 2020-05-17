
[cookbookurl]: https://geek-cookbook.funkypenguin.co.nz
[discourseurl]: https://discourse.geek-kitchen.funkypenguin.co.nz
[discordurl]: http://chat.funkypenguin.co.nz
[patreonurl]: https://patreon.com/funkypenguin
[blogurl]: https://www.funkypenguin.co.nz
[twitchurl]: https://www.twitch.tv/funkypenguinz
[twitterurl]: https://twitter.com/funkypenguin
[dockerurl]: https://geek-cookbook.funkypenguin.co.nz/ha-docker-swarm/design
[k8surl]: https://geek-cookbook.funkypenguin.co.nz/kubernetes/start

<div align="center">

[![geek-cookbook](https://raw.githubusercontent.com/geek-cookbook/autopenguin/master/images/readme_header.png)][cookbookurl]
[![Discord](https://img.shields.io/discord/396055506072109067?color=black&label=Hot%20Sweaty%20Geeks&logo=discord&logoColor=white&style=for-the-badge)][discordurl]
[![Forums](https://img.shields.io/discourse/topics?color=black&label=Forums&logo=discourse&logoColor=white&server=https%3A%2F%2Fdiscourse.geek-kitchen.funkypenguin.co.nz&style=for-the-badge)][discourseurl]
[![Cookbook](https://img.shields.io/badge/Recipes-44-black?style=for-the-badge&color=black)][cookbookurl]
[![Twitch Status](https://img.shields.io/twitch/status/funkypenguinnz?style=for-the-badge&label=LiveGeeking&logoColor=white&logo=twitch)][twitchurl]

:wave: Welcome, traveller!
> The [Geek Cookbook][cookbookurl] is a collection of geek-friendly "recipes" to run popular applications on [Docker Swarm][dockerurl] or [Kubernetes][k8surl], in a progressive, easy-to-follow format.  ***Come and [join us][discordurl], fellow geeks!*** :neckbeard:
</div>

 
# Contents

1. [What is this?](#what-is-this)



# What is this?

Tired of forking-and-updating Helm charts to work with Kubernetes 1.16, I created this little script to do the dirty work for me

## How to use

Point the script at your kubernetes manifests, as follows:

`./transmogrify_for_k8s_1.16.sh /tmp/my-yamls`

The output will indicate whether the YAMLs needed to be updated for the deprecated APIs:

```
root@cn1:~# /tmp/transmogrify_for_k8s_1.16.sh /tmp/ansible.bbGF94temp/prometheus/templates/
Deprecated API found in [/tmp/ansible.bbGF94temp/prometheus/templates/kube-state-metrics-deployment.yaml].. Transmogrifying...
Deprecated API found in [/tmp/ansible.bbGF94temp/prometheus/templates/alertmanager-deployment.yaml].. Transmogrifying...
Deprecated API found in [/tmp/ansible.bbGF94temp/prometheus/templates/node-exporter-daemonset.yaml].. Transmogrifying...
Deprecated API found in [/tmp/ansible.bbGF94temp/prometheus/templates/server-deployment.yaml].. Transmogrifying...
root@cn1:~#
```

When the script is run a second time, if no deprecated APIs are found, no output is displayed:

``` 
root@cn1:~# /tmp/transmogrify_for_k8s_1.16.sh /tmp/ansible.bbGF94temp/prometheus/templates/
root@cn1:~#
```

