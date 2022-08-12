# test if oidc-login is installed
kubectl oidc-login --version > /dev/null 2>&1
if [ $? -ne 0 ]; then
    printf "Kubelogin is not installed. Installing now..."
    # install oidc-login
    (
        OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
        ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
        KUBELOGIN="kubelogin_${OS}_${ARCH}" &&
        curl -fsSLO "https://github.com/int128/kubelogin/releases/download/v1.25.1/${KUBELOGIN}.zip" &&
        unzip ./"${KUBELOGIN}.zip" -d ./kubelogin &&
        sudo mv ./kubelogin/kubelogin /usr/local/bin/kubectl-oidc_login
    )
    # test if install was successful
    kubelogin_version=$(kubectl oidc-login --version)
    if [ $? -eq 0 ]; then
        printf $kubelogin_version
    else
        printf "Failed to install oidc-login. Please follow the installation instructions on GitHub: https://github.com/int128/kubelogin and try again"
        exit 1
    fi
fi