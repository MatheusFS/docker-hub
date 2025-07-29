#!/bin/bash

set -e

echo "[Entrypoint] Checando aplicação de configurações padrão..."

mysql_ready() {
    mysqladmin ping --silent -uroot -p"${MYSQL_ROOT_PASSWORD:-root}"
}

# Aguarda o MySQL subir (podemos repetir algumas vezes se necessário)
for i in {1..30}; do
    if mysql_ready; then
        break
    fi
    echo "Aguardando MySQL..."
    sleep 1
done

echo "[Entrypoint] Aplicando schema padrão..."

echo "[Entrypoint] Configuração personalizada concluída."
