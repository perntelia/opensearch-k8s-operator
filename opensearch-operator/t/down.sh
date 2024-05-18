kubectl delete -f os.yaml
kubectl get pvc -o name | xargs kubectl delete --wait=false
kubectl get pv -o name | xargs kubectl delete --wait=false
