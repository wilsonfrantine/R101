Para reter apenas os blocos de código R (chamados de "chunks") do seu arquivo Rmd e organizá-los em um popup de código para você copiar, você pode seguir estas etapas:
  
  1. Abra o arquivo Rmd no RStudio.
2. Localize e copie os blocos de código R (os chunks) que você deseja reter.
3. Cole esses blocos de código em um novo documento de texto ou em qualquer editor de texto.
4. Organize os blocos de código como desejar, colocando-os entre ```{r} e ```.

Aqui está uma versão organizada dos blocos de código R do seu arquivo Rmd, prontos para você copiar:
  
  ```r
# Definindo um Diretório de trabalho
setwd('../Rproject/')

# Instalando e Carregando pacotes
install.packages("tidyverse")
library(tidyverse)

# Importando os dados
dados_filmes <- read_csv("MarvelMovies.csv")

# Limpando dados
novo_nome_colunas <- c(
  "filme",
  "categoria",
  "receita_mundial_milhoes",
  "percentual_orcamento_recuperado",
  "percentual_criticos",
  "percentual_audiencia",
  "desvio_percentual_audiencia_criticos",
  "orcamento_milhoes",
  "receita_domestica_milhoes",
  "receita_internacional_milhoes",
  "fim_de_semana_abertura_milhoes",
  "segundo_fim_de_semana_milhoes",
  "queda_1o_para_2o_fim_de_semana",
  "percentual_receita_fim_de_semana_abertura",
  "percentual_receita_domestica",
  "percentual_receita_internacional",
  "percentual_orcamento_fim_de_semana_abertura",
  "ano",
  "fonte"
)

colnames(dados_filmes) <- novo_nome_colunas

dados_filmes <- 
  dados_filmes %>%
  mutate_if(
    ~any(str_detect(.,"%")), ~as.numeric(str_remove_all(., "%"))
  )

# Analisando os dados
dados_resumidos <- 
  dados_filmes %>% summary() %>% 
  as.data.frame() %>%
  setNames(c("V1","coluna", "Freq")) %>%
  separate(Freq, into  = c("medida", "valores"), sep = ":") %>%
  select(coluna, medida, valores) %>% drop_na()

# Filtrando dados
dados_resumidos %>% filter(coluna == "receita_mundial_milhoes")
dados_resumidos %>% filter(str_detect(medida, "Max"))

# Encanando códigos
filmes_ordenados <- arrange(dados_filmes, desc(percentual_orcamento_recuperado))
head(filmes_ordenados, n = 5)

# Selecionando colunas específicas
dados_filmes %>% select(filme, categoria)

# Criando novas variáveis
receita_total <- dados_filmes %>% 
  mutate(receita_total = receita_domestica_milhoes + receita_internacional_milhoes) %>%
  select(filme, receita_total)

# Visualizando a nova tabela
head(receita_total)

```

Agora você pode copiar esses blocos de código e usá-los conforme necessário!
