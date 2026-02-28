# Análise Exploratória

Este material apresenta uma análise exploratória do conteúdo da base de dados e dicionário adicionados a este repositório através do RStudio. Esta breve análise tem como objetivo criar gráficos, interpretar e documentar através deste texto o comportamennto das variáveis observadas.

## Interpretações das Análises Gráficas

#### Dados Faltantes - Gráfico 0

Com apoio do pacote `naniar`, analisamos a integridade da base através das frequências absolutas e percentuais de dados ausentes. Dentre outras funções aplicadas para o levantamento numérico, utilizamos a função `vis_miss` para gerar uma representação visual de toda estrutura.

A análise confirmou a integridade total da base, apresentando o total de zero dados faltantes. Isso garante que as análises subsequentes não sofrerão distorçoes por ausência de registros.

### Idade - Gráfico 1

Com apoio do pacote `ggplot2` para o gráfico usamos o `geom_histogram` para analisar a distribuição etária. A estrutura das classes foi definida com um intervalo de 12 em 12 anos, iniciando aos 18 e terminando com 100 anos como limite superior da última classe.

No gráfico é possível observar que a concentração enontra-se no intervalo entre 30 e 66 anos, sendo a maior frequência registrada na faixa dos 42 aos 54 anos.

A partir da quinta classe (66 a 78 anos) nota-se um declínio considerável na quantidade de indivíduos; a partir deste ponto observa-se que quanto a maior idade, menor a ocorrência, resultando na menor ocorrência para os indivíduos acima de 80 anos.

#### Tempo Detido - Gráfico 2

Para analisar a frequência do tempo em que os detentos se encontram detidos, utilizamos um boxplot. Esta representação visual permite observar a distribuição da variável `tempo_preso` em meses, destavando a centralidade e a dispersão dos valores.

O gráfico apresenta uma distribuição visualmente simétrica, a linha que representa a mediana se situa próxima a marca de 60 meses. É possivel observar um valor discrepante no limite superior próximo a marcação de 95 meses.

Portanto a variável se comporta de forma padronização uniforme com 50% dos valores centrais observados entre 53 e 67 meses.

### Score X Escolaridade - Gráfico 3

Foi feito um boxplot cruzando duas variaveis, tendo no eixo y a variável score periculosidade e eixo x escolaridade (variável categórica). Portanto nesta visualização trata-se da relção do nível de periculosidade do detento com o nível de ensino.

A relação entre a escolaridade e o tempo de detenção revela uma dinâmica de dispersão que se altera conforme o nível de instrução formal aumenta. Nos estratos de ensino fundamental e médio, o que se observa é uma amplitude acentuada, sugerindo que a menor escolaridade está correlacionada a perfis de permanência extremamente heterogêneos. Nesses grupos, a distância entre os casos de menor e maior tempo de detenção é vasta, indicando uma alta volatilidade nos dados.

Um ponto crítico dessa distribuição no ensino médio é a posição dos valores discrepantes. Nota-se que o limite inferior de tempo está drasticamente mais afastado do corpo central dos dados do que o limite superior. Essa desconexão sugere que, embora existam casos de curtíssima permanência, eles são exceções muito mais isoladas e distantes da realidade da maioria do grupo do que os casos de longa permanência. O gráfico evidencia que o "piso" para esses indivíduos é muito mais errático do que o "teto".

Em contrapartida, o ensino superior manifesta-se como um estrato de convergência. A característica mais marcante é a redução da variabilidade: tanto os tempos mínimos quanto os máximos estão visivelmente mais próximos da mediana. Essa configuração indica que a escolaridade superior correlaciona-se a uma maior estabilidade dos dados, onde os extremos são suavizados e o tempo de permanência tende a ser mais homogêneo. Em suma, enquanto os níveis de escolaridade mais baixos abrigam discrepâncias severas, especialmente na base da distribuição, o ensino superior concentra os indivíduos em uma faixa de tempo mais estreita, reduzindo as distorções observadas nos outros grupos.

#### Reincidente - Gráfico 4

Para esta análise, utilizei o `geom_bar` com escala de 50% em 50% no eixo Y e a função `geom_text` para exibir as porcentagens nas barras.

A distribuição da reincidência na amostra revela uma concentração massiva na categoria de primeira ocorrência, que representa 81% dos casos. O gráfico de barras evidencia o contraste entre os dois grupos, mostrando que a parcela de reincidentes é minoritária, correspondendo a apenas 19%. A visualização reforça que, dentro desta base de dados, a ausêcia de reincidência é quatro vezes maior que a sua presença, evidenciando que a grande maioria dos indivíduos não apresenta registros anteriores de retorno ao sistema.

## Medidas de tendência central e dispersão

A partir deste ponto, serão apresentadas as definições e fórmulas gerais das métricas de tendência central e dispersão utilizadas no script `Analise2`.

Considerando os dados ordenados de forma crescente ($x_1, x_2, \dots, x_n$), as definições matemáticas são definida de seguinte forma:

#### 1. Média ($\bar{x}$)

$$\bar{x} = \frac{\sum_{i=1}^{n} x_i}{n}$$

#### 2. Mediana ($Md$)

$$
Md =
\begin{cases}
x_{(\frac{n+1}{2})} & , \text{ se } n 
\text{ for ímpar} \\
\frac{x_{(\frac{n}{2})} + x_{(\frac{n}
{2} + 1)}}{2} & , \text{ se } n 
\text { for par}
\end{cases}
$$

#### 3. Variância ($s^2$)

$$s^2 = \frac{\sum_{i=1}^{n} (x_i - \bar{x}^2)}{n-1}$$

#### 4. Desvio Padrão ($s$)

$$s = \sqrt{s^2}$$

#### 5. Amplitude ($R$)

$$R = x_{max} - x_{min}$$
