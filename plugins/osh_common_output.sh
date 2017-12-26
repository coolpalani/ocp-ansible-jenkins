#!/bin/bash
echo OPENSHIFT_HAWKULAR_ROUTE=\"$(oc get route --namespace='openshift-infra' -o go-template --template='{{.spec.host}}' hawkular-metrics 2> /dev/null)\"
echo OPENSHIFT_PROMETHEUS_ALERTS_ROUTE=\"$(oc get route --namespace='openshift-metrics' -o go-template --template='{{.spec.host}}' alerts 2> /dev/null)\"
echo OPENSHIFT_PROMETHEUS_METRICS_ROUTE=\"$(oc get route --namespace='openshift-metrics' -o go-template --template='{{.spec.host}}' prometheus 2> /dev/null)\"
echo OPENSHIFT_MASTER_HOST=\"$(oc get nodes -o name |grep master |sed -e 's/nodes\///g')\"
echo OPENSHIFT_MANAGEMENT_ADMIN_TOKEN=\"$(oc sa get-token -n management-infra management-admin)\"
echo OPENSHIFT_CA_CRT=\""$(cat /etc/origin/master/ca.crt)"\"
