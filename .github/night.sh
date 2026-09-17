# download SideStore Latest
cd tmp
echo "Buscando la última versión estable (latest) de SideStore..."

# Obtiene la URL del archivo .ipa desde la API de la release "latest" de GitHub
SIDESTORE_LATEST_URL=$(curl -s https://api.github.com/repos/SideStore/SideStore/releases/latest | grep -i "browser_download_url.*\.ipa" | head -n 1 | cut -d '"' -f 4)

if [ -z "$SIDESTORE_LATEST_URL" ]; then
    echo "No se encontró enlace IPA en la API, utilizando enlace estático de latest..."
    SIDESTORE_LATEST_URL="https://github.com/SideStore/SideStore/releases/latest/download/SideStore.ipa"
fi

echo "Descargando desde: $SIDESTORE_LATEST_URL"
wget -O SideStore.ipa "$SIDESTORE_LATEST_URL"
unzip SideStore.ipa
cd ..
