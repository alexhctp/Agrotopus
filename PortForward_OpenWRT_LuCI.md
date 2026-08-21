# Configurar Redirecionamento de Portas OpenWRT LuCI
Para configurar o redirecionamento de portas no OpenWrt via interface LuCI, acesse **Network > Firewall**, vá na aba **Port Forwards** (Redirecionamentos de Porta) e clique em **Add**. Preencha o nome, protocolo, porta externa, IP interno e porta interna do dispositivo, depois salve e aplique.
## Passos para Configuração
- Abra o navegador e entre na interface LuCI do seu OpenWrt.
- Vá em **Network** (Rede) e clique em **Firewall**.
- Selecione a aba **Port Forwards**.
- Na seção de criação, vá até o final e clique no botão **Add** (Adicionar).
## Preenchimento da Regra
- **Name (Nome):** Dica um nome fácil para identificar o serviço (ex: IF1 ou Tablet-EMP01).
- **Protocol (Protocolo):** Escolha entre TCP, UDP ou TCP+UDP.
- **Source zone (Zona de origem):** Selecione wan.
- **External port (Porta externa):** A porta que virá de fora (da internet).
- **Destination zone (Zona de destino):** Selecione lan.
- **Internal IP address (Endereço IP interno):** O IP local do aparelho na sua rede que vai receber o tráfego.
- **Internal port (Porta interna):** A porta que o aplicativo usa no seu dispositivo local.
## Salvando as Alterações
- Clique no botão Save (Salvar) da nova regra.
- Suba a página e clique no botão **Save & Apply** (Salvar e Aplicar) para ativar a regra no firewall.

