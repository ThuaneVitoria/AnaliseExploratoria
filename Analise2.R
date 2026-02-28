#Verificando diretório
getwd()
setwd("C://Users//55219//Documents")

#Instalação de pacotes
install.packages(c("usethis","gitcreds","readxl","dplyr","ggplot2","naniar"))

#Ativando pacotes
library(ggplot2)
library(dplyr)
library(tidyr)
library(readxl)

#Importando a base
dados = read_excel("C:/Users/55219/Documents/Base_trabalho.xlsx",           
                   na = '')                                                 # Identifica dados faltantes

glimpse(dados)

#Transformando variáveis qualitativas em fatores

dados$escolaridade = factor(x = dados$escolaridade,                             # Seleciona a variável da base
                            levels = c(1,2,3),                                  # Codificação utilizada na base
                            labels = c("Fundadmental","Médio","Superior"))      # Rótulos correspondentes

dados$sexo = factor(x = dados$sexo,
                    labels = c("Feminino", "Masculino"))


######Automatizando a trasformação das variáveis reincidente, filhos e casado em fatores

v= c("reincidente","filhos","casado")               # vetor com as variáveis a serem modificadas





for(i in v){                                        # Loop que percorre o vetor
  dados[[i]] = factor(x = dados[[i]],               # Seleciona os valores da base da coluna de variável i
                      levels = c(0,1),              # Código utilizados na base
                      labels = c("Não", "Sim"))     # Rótulos
}


#Medidas resumos para as variáveis score_periculosidade, idade e tempo_preso. (1º, 2º e 3º quartil)

#Criando um tibble com os quartis para cada variável
q_idade = dados|>
  summarise( "1º quartil" = quantile(idade, probs = 0.25),
             Mediana = median(idade),
             "3º quartil" = quantile(idade, probs = 0.75))

q_idade

q_tempo = dados|>
  summarise( '1º quartil' = quantile(tempo_preso, probs = 0.25),
             Mediana =median(tempo_preso),
             "3º quartil" = quantile(tempo_preso, probs = 0.75))

q_tempo

q_score = dados|>
  summarise( '1º quartil' = quantile(score_periculosidade, probs = 0.25),
             Mediana = median(score_periculosidade),
             '3º quartil' = quantile (score_periculosidade, probs = 0.75))


Quantis <- rbind(q_idade,q_tempo,q_score)    # Juntando as linhas em uma nova tabela chama Quartis

Quantis <- as.data.frame(Quantis) #Transformanto o tibble em um data.frame

rownames(Quantis) <- c("Idade", "Tempo preso","Periculosidade")     # adicionando os nomes na coluna de identificação


#Gráfico de dispersão entre tempo_score e score_periculosidade

gr = dados|> ggplot( mapping = aes(x = tempo_preso, y = score_periculosidade)) + #Adicionando as variáveis das variáveis aos respectivos eixos
  
  # Escolha da  representação gráfica  
  geom_point(color ="dodgerblue4",             #  Selecionando o gráfico de dispersão
             size = 2,                         #  Tamanho dos pontos
             alpha =.5) +                      #  Ajuste de opacidade
  
  # Adicionando a linha de tendência
  geom_smooth(method = "lm",                   #  Aplicando o modelo linear
              color = "indianred",             #  Cor da linha
              linewidth = 0.3)  +              #  Espessura da linha
  
  scale_y_continuous(breaks = seq(0,250,by = 50)) +    # Ajuste da escala do eixo y (limite inferior, superior, intervalos)
  
  #Adicionando rótulos e títulos do gráfico
  labs(x = "Tempo Preso (Meses)", 
       y = "Score de periculosidade",
       title = "Relação entre o Tempo de Prisão e Score de Periculosidade dos detentos")  +
  theme_bw()

gr


# Correlação das variáveis tempo_preso e score_periculosidade (Correlação de Pearson)

cor = cor(dados$tempo_preso,dados$score_periculosidade)  

cor


# Variância, desvio padrão e amplitude para as variáveis score_periculosidade, idade e tempo_preso.

# Criação de vetor com as variáveis para automatização do processo
vq = c("idade","tempo_preso","score_periculosidade")


####  Sumário das variáveis quantitativas
dados|> select(all_of(vq)) |>
               summary()


medidas =     dados|>
  summarise(across(all_of(vq),                   #  Percorre todas as colunas especificadas por todo o vetor
                   list(                         #  Separa e organiza  os cálculos para a tabela de reumo 
                     xvariancia = ~var(.x),      #  Nomeia e define o cálculo e aplica para a respectiva coluna
                     xdesvio = ~sd(.x),
                     xamplitude = ~diff(range(.x))    # Calcula a difença entre os valor mínimo e máximo observado              
                   ))) |>
  
  # Separa e empilhar os resultados na tabela
  pivot_longer( cols = everything(),                  # Seleciona todas as colunas
                names_to = c("variavel", ".value"),   # Cria uma coluna nomeada 'variavel' e transforma a tabela em linhas e colunas
                names_sep = "_x")                     # Define o separador entre as linhas e colunas

medidas[1]=NULL       # excliu a primeira coluna da tabela
rownames(medidas)= c("Idade",'Tempo preso',"Periculosidade")  #Adiciona uma colunas de identificação como os rótulos especificados no vetor
