#Instalando pacotes para manipulação, importação, leitura e visualização de dados

install.packages(c("dplyr", "readxl", "ggplot2"))

#Verificando diretório
getwd()

#Ativando os pacotes
library(dplyr)
library(readxl)
library(ggplot2)

#Importação da base de dados sobre o objeto base do tipo tibble/data.frame

base <- read_excel("C:/Users/55219/Downloads/Base_trabalho.xlsx",
                   na = "")       #Arquivo de importação e dados faltantes como preenchimento nulo

#Visualização do objeto criado
base

#Identificando os rótulos das variavel escolaridade e sexo

base$escolaridade <- factor(x = base$escolaridade,
                            labels = c("Fundamental","Médio","Superior"))

base$sexo <- factor(x = base$sexo,
                    labels = c("Feminino", "Masculino"))


#Vetor que identifica as colunas com rótulos de sim e não

col=c("filhos","casado","reincidente")

#Automatizando a criação de rótulos para as variáveis com códigos 0 = Não e 1 = Sim 

for (x in col){   #loop de acordo com os elementos do vetor col
  base[[x]] <- factor(base[[x]],    # selecionando a variável da base
                      levels = c(0,1),    # A codificação usada na base
                      labels = c("Não","Sim"))  #Rótulos aplicados
}

summary(base)  #Resumos da base de dados

#Análise sobre os dados faltantes

install.packages("naniar")
library(naniar)

miss_var_summary(base)   #Frequência de dados faltantes para cada variável
sum(is.na(base))    #Total de dados faltantes

# Visualização sobre os dados faltantes

vis_miss(x =base) + 
  labs(y="Linhas", x = "Variáveis", fill ="")+
  scale_fill_manual(labels = c("Dados Presentes","Dados faltantes"), 
                    values = c("grey80","Black"))+
  theme(axis.text.x.top = element_text(angle = 90,size= 10))  #Alteração nos rótulos superiores


#Visualizando a base
glimpse(base)



#Histograma da variável idade

gr1 = base|>     
  ggplot(mapping = aes(x = idade)) +       # Definindo o eixo x do gráfico
  geom_histogram(bins = 7,             # Formato do gráfico e numero de classes do histograma
                 breaks= c(18,30,40,50,60,70,80),       # Intervalo das classes
                 fill = "blue",    # Cor de preenchimento das barras
                 colour = "black") +   # Cor de contorno
  labs(x="Idade (anos)", y= "Frequência",                    # Rótulos dos eixos
       title = "Idade dos detentos em anos completos") +     # Título
  theme_minimal() 

gr1


# Boxplot da variável tempo_preso

gr2 = 
  
  base|>
  ggplot(mapping = aes(y = tempo_preso)) +  
  geom_boxplot(fill = "lightblue") +
  labs(y = "Meses",
       title = "Frequência do Tempo em que os detentos se encontram detidos" ) +
  theme_minimal() +
  theme(axis.text.x = element_blank())+  # Elimina a reta do eixo x
  theme( panel.grid.major.x = element_blank(),
         panel.grid.minor.x = element_blank()) 
gr2


# Boxplot da variável score_periculosidade por escolaridade

gr3 =
  base|> ggplot(mapping = aes(y = score_periculosidade, x = escolaridade, 
                              fill = escolaridade) ) +
  geom_boxplot() +
  scale_fill_brewer(palette = "Blues")+
  guides (fill = "none")+     #Excluir legenda
  labs(x = "Escolaridade/ Nível de ensino", y = "Nível de Periculosidade",
       title = "Score de periculosidade por escolaridade dos detentos")+
  theme_minimal()+
  theme(panel.grid.major.x = element_blank())

gr3  

# Gráfico de barras para a variável reincidente

gr4 = 
  base|>
  ggplot(mapping = aes(x = reincidente, y = ..prop..,
                       group = 1)) + # Define a referência do grupo da proporção
  
  geom_bar(fill = "Darkblue") +
  
  geom_text(aes(label = after_stat(scales:: percent(..prop.., accuracy = 1)),
                group = 1), 
            stat = "count",
            size = 4, 
            vjust = 1.5, 
            color = "white")+   # configuração do rotúlo das barras
  
  labs(y = "Porcentagem", title = "Percentual da presença de Ocorrência de Reincidente", x="")+
  theme_classic()+
  scale_y_continuous(limits = c(0,1),
                     breaks = c(0,0.5,1),
                     labels = scales::percent_format())

gr4
