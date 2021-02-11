k_context=$(kubectl config current-context)
echo "current context: $k_context"
read -p "What's the namespace? " namespace

echo "Commands: "
echo "<1> get pods"
echo "<2> check top \n"

echo "<3> get/set pod"
echo "<4> check pod logs"
echo "<5> delete pod \n"

echo "<6> get statefulsets"
echo "<7> get/set statefulset"
echo "<8> edit number of stateful sets \n"

echo "<9> change namespace"
echo "<10> change context \n"

while true; do
    printf "current context: $(kubectl config current-context) | current namespace: $namespace | current pod: $pod | current statefulset: $statefulset \n"; 
    read -p "Choose which command to use (type c for commands; ctr+c to exit)? " num
    case $num in
        1 ) clear; kubectl get pods -n $namespace; echo "";;
        2 ) clear; kubectl top po -n $namespace; echo "";;
        3 ) clear; read -p "which pod? " pod; \
            kubectl get pod $pod -n $namespace; \
            echo "pod set to $pod \n";; 
        4 ) clear; echo "pod: $pod"; \
            kubectl logs $pod -n $namespace; echo "";;
        5 ) clear; echo "context: $(kubectl config current-context) pod: $pod namespace: $namespace"; \
            read -p "YOU ARE ABOUT TO DELETE A POD, ARE YOU SURE? [Y/N] " yn; \
            case $yn in
                [Yy] ) kubectl get pod $pod -n $namespace; \
                       echo "";;
                [Nn] ) echo "ABORTED \n";;
                * ) echo "type y or n \n";;
            esac;;
        6 ) clear; kubectl get statefulsets -n $namespace; echo "";;
        7 ) clear; read -p "which statefulset? " statefulset; \
            kubectl get statefulset $statefulset -n $namespace; \
            echo "statefulset set to $statefulset \n";;
        8 ) clear; kubectl edit statefulsets $statefulset -n $namespace; echo "";;
        9 ) clear; read -p "change namespace to: " namespace; echo "";;
        10 ) clear; read -p "change context to: " k_context; kubectl config use-context $k_context; echo "";;
        c ) clear; echo "Commands: "; echo "<1> get pods"; echo "<2> check top \n"; \
            echo "<3> get/set pod"; echo "<4> check pod logs"; echo "<5> delete pod \n"; \
            echo "<6> get statefulsets"; echo "<7> get/set statefulset"; echo "<8> edit number of stateful sets \n"; \
            echo "<9> change namespace"; echo "<10> change context \n";;
        * ) echo "Please use a number from the shown commands";;
    esac
done
