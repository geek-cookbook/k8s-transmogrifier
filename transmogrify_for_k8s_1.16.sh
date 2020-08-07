#!/bin/bash
# Version: 0.2
# Maintainer: @funkypenguin
# Repo: https://github.com/funkypenguin/k8s-transmogrifier

TARGET=$1

usage () {
  local errorMessage=$1
  echo
  echo "---------------------------------------------------------------"
  echo "Error: $errorMessage"
  echo "---------------------------------------------------------------"
  echo "usage: ./transmogrify_for_k8s_1.16.sh <path to manifests>"
  echo "  e.g. ./transmogrify_for_k8s_1.16.sh /tmp/my-yamls"
  echo "---------------------------------------------------------------"
  exit 1
}

if [ -z "$TARGET" ]
then
  usage "No target directory specified"
fi

# Find all depreciation targets
mapfile -t files < <(grep -liEr "kind: Deployment|kind: Daemonset|kind: Statefulset|kind: ReplicaSet" "$TARGET")
for i in "${files[@]}"; do
	if [[ `grep -E "extensions/v1beta1|apps/v1beta2|apps/v1beta1" "$i"` ]]; then
		echo "Deprecated API found in [$i].. Transmogrifying..."
		sed -i -e "s|extensions/v1beta1|apps/v1|" "$i"
		sed -i -e "s|apps/v1beta2|apps/v1|" "$i"
		sed -i -e "s|apps/v1beta1|apps/v1|" "$i"
	fi
done

mapfile -t files < <(grep -liEr "kind: PodSecurityPolicy" "$TARGET")
for i in "${files[@]}"; do
	if [[ `grep -E "extensions/v1beta1|apps/v1beta2" "$i"` ]]; then
		echo "Deprecated API found in [$i].. Transmogrifying..."
		sed -i -e "s|extensions/v1beta1|policy/v1beta1|" "$i"
	fi
done
