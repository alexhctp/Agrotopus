#!/bin/sh

# ==========================================
# CONFIGURAÇÕES DA REGRA PORTFORWARD
# ==========================================
NOME_REGRA="IF1"
PORTA_EXTERNA="2189"
IP_INTERNO="192.168.1.1"
PORTA_INTERNA="2189"
PROTOCOLO="tcp" # Opções: tcp, udp, tcpudp

echo "Iniciando a configuração do redirecionamento..."

# 1. Cria uma nova regra vazia no firewall
uci add firewall redirect

# 2. Define os parâmetros usando as variáveis acima
uci set firewall.@redirect[-1].name="$NOME_REGRA"
uci set firewall.@redirect[-1].src="wan"
uci set firewall.@redirect[-1].src_dport="$PORTA_EXTERNA"
uci set firewall.@redirect[-1].dest="lan"
uci set firewall.@redirect[-1].dest_ip="$IP_INTERNO"
uci set firewall.@redirect[-1].dest_port="$PORTA_INTERNA"
uci set firewall.@redirect[-1].proto="$PROTOCOLO"

# 3. Salva e aplica as mudanças no roteador
echo "Salvando as alterações no sistema..."
uci commit firewall

echo "Reiniciando o firewall para aplicar a nova regra..."
/etc/init.d/firewall restart

echo "Sucesso! A porta externa $PORTA_EXTERNA foi redirecionada para $IP_INTERNO:$PORTA_INTERNA ($PROTOCOLO)."
