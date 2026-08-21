# PortForward OpenWRT Command Line Interface
Para configurar o redirecionamento de portas no OpenWrt via CLI (Linha de Comando), você deve adicionar a regra diretamente no arquivo de configuração do firewall usando a ferramenta UCI (Unified Configuration Interface) ou editando o arquivo manualmente.

## Método 1: Usando Comandos UCI (Mais Rápido e Seguro)
Abra o seu terminal, conecte-se ao roteador via SSH (ssh root@192.168.1.1) e cole os seguintes comandos ajustando as portas e o IP:

```bash
# 1. Cria uma nova regra de redirecionamento de porta
uci add firewall redirect

# 2. Dá um nome para a regra (opcional, ajuda na organização)
uci set firewall.@redirect[-1].name='IF1'

# 3. Define a internet (wan) como a origem do tráfego
uci set firewall.@redirect[-1].src='wan'

# 4. Define a porta que será acessada de fora (ex: 2189)
uci set firewall.@redirect[-1].src_dport='2189'

# 5. Define a rede interna (lan) como o destino
uci set firewall.@redirect[-1].dest='lan'

# 6. Define o IP do dispositivo na sua rede interna (ex: 192.168.1.1)
uci set firewall.@redirect[-1].dest_ip='192.168.1.1'

# 7. Define a porta que o dispositivo usa lá dentro (ex: 2189)
uci set firewall.@redirect[-1].dest_port='2189'

# 8. Define o protocolo (pode ser tcp, udp, ou tcpudp)
uci set firewall.@redirect[-1].proto='tcp'

# 9. Salva todas as alterações que você fez
uci commit firewall

# 10. Reinicia o firewall para aplicar a nova regra imediatamente
/etc/init.d/firewall restart
```

## Método 2: Editando o Arquivo Manualmente
Se você preferir editar o arquivo de texto diretamente, abra o arquivo de configuração com o editor Vi:
```bash
vi /etc/config/firewall
```

Use o código com cuidado.
Pressione a tecla i para entrar no modo de edição, role até o final do arquivo e adicione o seguinte bloco de texto:
```
config redirect
        option name 'IF1'
        option src 'wan'
        option src_dport '2189'
        option dest 'lan'
        option dest_ip '192.168.1.1'
        option dest_port '2189'
        option proto 'tcp'
```

Para salvar e sair do editor Vi, pressione a tecla Esc, digite `:wq` e aperte Enter.Depois, aplique as mudanças com o comando:
```bash
/etc/init.d/firewall restart
```
