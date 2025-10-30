# Projeto de Base de Dados – Gestão de Biblioteca

## Descrição do Projeto
Este projeto foi desenvolvido no âmbito do módulo de Base de Dados, com o objetivo de criar um sistema para a gestão de uma biblioteca.  
A base de dados permite gerir publicações, autores, editoras, palavras-chave e requisitantes, incluindo a relação entre autores e publicações, o controlo do estado das obras e a pesquisa de informação de forma eficiente.

---

## Fases do Projeto

### 1. Análise do Problema
Foram identificadas as principais necessidades de uma biblioteca:
- Registo e gestão de publicações (livros, artigos, revistas, etc.).
- Associação de autores às publicações (relação N:N).
- Registo de editoras e palavras-chave associadas.
- Registo de requisitantes (leitores da biblioteca).
- Implementação de níveis de acesso com permissões distintas.
- Possibilidade de consultas e estatísticas sobre o acervo.

### 2. Modelação
A base de dados foi modelada com as seguintes tabelas principais:
- **Autor**
- **Publicacao**
- **Editora**
- **Palavra_Chave**
- **Publicacao_Autor**
- **Requisitante**

O diagrama relacional foi criado no DBeaver e exportado em formato PNG/PDF, representando as entidades e as respetivas relações.

### 3. Implementação
A implementação foi realizada em **MySQL** através de código SQL.  
O script inclui:
- Criação das tabelas normalizadas.
- Definição de chaves primárias e estrangeiras.
- Inserção de dados realistas (autores e publicações conhecidas).
- Sistema de segurança com papéis de utilizador (roles) e permissões (`GRANT`, `REVOKE`).
- Criação de *views* públicas e consultas SQL obrigatórias e avançadas.

### 4. Testes e Validação
Foram efetuados testes no DBeaver com:
- Inserção e atualização de dados.
- Verificação das relações entre tabelas através de `JOIN`.
- Execução das consultas SQL obrigatórias e avançadas.
- Teste das permissões atribuídas a cada papel definido.

---

## Justificação das Decisões de Design

A base de dados foi desenvolvida inteiramente em **código SQL**, e não através de ferramentas gráficas automáticas, porque:
- Permite compreender e controlar toda a estrutura e as relações entre as tabelas.
- Facilita futuras alterações e manutenção, bastando editar o código.
- É o método mais adequado para garantir compatibilidade e replicação da base de dados noutros sistemas.
- Desenvolve a prática e o domínio da linguagem SQL, essenciais na área de programação.

O **MySQL** foi escolhido pela sua compatibilidade com o **DBeaver**, pela facilidade de utilização e pela sua ampla aplicação em contextos académicos e profissionais.  
A estrutura foi desenhada segundo os princípios da **normalização até à 3.ª Forma Normal (3FN)**, assegurando integridade referencial e evitando redundância de dados.

---

## Estrutura da Base de Dados

| Entidade | Descrição |
|-----------|------------|
| **Autor** | Identifica cada autor, incluindo o nome, nacionalidade e código SPA. |
| **Publicacao** | Contém as informações principais sobre cada obra (título, tipo, ano, estado, etc.). |
| **Editora** | Regista as editoras responsáveis pelas publicações. |
| **Palavra_Chave** | Contém palavras associadas ao conteúdo das publicações. |
| **Publicacao_Autor** | Liga autores a publicações (relação N:N). |
| **Requisitante** | Contém os dados dos leitores que requisitam publicações. |

---

## Sistema de Segurança

Foram definidos três papéis principais:
- **Leitor** – pode consultar publicações.
- **Funcionário** – pode inserir e atualizar registos de publicações e requisições.
- **Administrador** – tem acesso total à base de dados.

Foram aplicadas as seguintes regras:
- Atribuição de permissões específicas com `GRANT`.
- Remoção de privilégios sensíveis com `REVOKE`.
- Criação de *views* públicas para estatísticas, sem exposição de dados confidenciais.

---

## Consultas SQL Incluídas

- `ORDER BY` – Ordenação das publicações por título.  
- `INNER JOIN` – Associação entre publicações e autores.  
- `LIKE` – Pesquisa de publicações por parte do título.  
- `GROUP BY` – Agrupamento por estado ou editora.  
- Funções agregadas (`COUNT`, `AVG`, `SUM`).  
- Subconsultas para estatísticas específicas.  
- Consultas complexas com múltiplos `JOIN` e condições.

---

## Instruções para Replicar a Base de Dados

1. Abrir o **DBeaver** e criar uma ligação MySQL.  
2. Criar uma nova base de dados com o nome `Biblioteca`.  
3. Executar o script `biblioteca.sql` disponibilizado neste repositório.  
4. Visualizar o **modelo relacional** (ER Diagram) no DBeaver.  
5. Executar as consultas incluídas no script para verificar o funcionamento.  

---

## Ficheiros Incluídos

- `biblioteca.sql` – Script completo com criação, inserção, consultas e segurança.  
- `modelo_relacional.png` – Diagrama relacional exportado do DBeaver.  
- `screenshots/` – Imagens de resultados e *views* no DBeaver.  
- `README.md` – Documento descritivo do projeto.


