# Loja Virtual
----
*Loja de roupas online*


## Instalação
----
1. Clonar o projeto:

    ```
      git clone https://github.com/guilherme-otran/loja-virtual.git
    ```
2. Verifique as configurações de conexão com o banco. Por padrão:

```
  adapter: mysql2
  encoding: utf8
  reconnect: false
  database: loja_virtual
  pool: 5
  username: root
  password: 
  host: localhost
```

3. Instalar as dependências:

    ```
      bundle install
    ```
4. Executar as tarefas:
  * Criar a base de dados:

    ```
      rake db:create
    ```
  * Migacões: (Criar as tabelas, índices, chaves estangeiras...)

    ```
      rake db:migrate
    ```
  * Popular as tabelas com valores padrão:

    ```
      rake db:seed
    ```

5. Iniciar o servidor rails:

```
  rails server
```

## Uso
----
Usuário administrador padrão:

  * Usuário: test@admin.com.br
  * Senha: administrator

Integração com [Moip] (http://moip.com.br):

  Usada a gem [Moiper] (https://github.com/reu/moiper) para a integração do pagamento bancário. É possivel fazer testes livremente atravéz do standbox.