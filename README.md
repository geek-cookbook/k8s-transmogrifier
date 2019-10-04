# What is this?

Tired of forking-and-updating Helm charts to work with Kubernetes 1.16, I created this little script to do the dirty work for me

## How to use

Point the script at your kubernetes manifests, as follows:

`./transmogrify_for_k8s_1.16.sh /tmp/my-yamls`

The output will indicate whether the YAMLs needed to be updated for the deprecated APIs:

```
root@cn1:~# /tmp/upgrade.sh /tmp/ansible.bbGF94temp/prometheus/templates/
Deprecated API found in [/tmp/ansible.bbGF94temp/prometheus/templates/kube-state-metrics-deployment.yaml].. Transmogrifying...
Deprecated API found in [/tmp/ansible.bbGF94temp/prometheus/templates/alertmanager-deployment.yaml].. Transmogrifying...
Deprecated API found in [/tmp/ansible.bbGF94temp/prometheus/templates/node-exporter-daemonset.yaml].. Transmogrifying...
Deprecated API found in [/tmp/ansible.bbGF94temp/prometheus/templates/server-deployment.yaml].. Transmogrifying...
root@cn1:~#
```

When the script is run a second time, if no deprecated APIs are found, no output is displayed:

``` 
root@cn1:~# /tmp/upgrade.sh /tmp/ansible.bbGF94temp/prometheus/templates/
root@cn1:~#
```
