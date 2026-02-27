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

#### Reincidente - Gráfico 4

Foi feito um gráfico em barras para a variável reincidente marcando a escala saltando de 50% em 50%, com as barras marcando a porcentagem de cada barra e atraves deste gráfico pode se-se obeservar...
