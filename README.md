# 👨‍💻 Sobre mim

Sou um desenvolvedor **fullstack**, focado em construir sistemas completos e escaláveis, desde o backend até interfaces modernas e experiências de usuário bem pensadas.

---

(Conteúdo omitido por brevidade — o README completo está no repositório)

---

## Deploy com Coolify + Traefik

Este projeto fornece um `Dockerfile` e um `docker-compose.yml` preparados para uso com Coolify e Traefik.

- O container serve os arquivos estáticos de `dist` via Nginx.
- Não há portas publicadas no `docker-compose.yml`; Traefik faz o roteamento.

Recomendações de configuração no Coolify:

- Use o modo de build padrão (construir a imagem a partir do repositório).
- Defina a variável de ambiente `DOMAIN` com o host que você quer (ex: `meusite.exemplo.com`).
- Garanta que Traefik esteja integrado ao cluster e escute a entrada `websecure` para TLS.

Exemplo de variáveis e passos (local):

```bash
# build localmente
npm install
npm run build
# rodar com docker-compose (apenas para teste local; Traefik pode não estar configurado)
DOMAIN=localhost docker compose up --build
```

No Coolify, crie a aplicação apontando para este repositório e adicione `DOMAIN` nas Environment Variables com o host desejado.
