#primeiro projeto postado no github

#####
#limpando o cash/workspace
rm(list = ls())

#####
#definindo pasta de trabalho
setwd('D:/2_projetos_r/estatistica_basica/')
getwd()


#####
#instalar pacotes


#####
#carregar bibliotecas/pacotes
##caso nao tenha as bibliotecas instaladas = <<<install.packages("data.table")>>>
##utilizar modelo acima entre <<<INSTALAR BIBLIOTECAS>>>
library(data.table)

#####
#importando arquivo .CSV local
my.file <- 'USDJPYDaily.csv'


#?read_csv
my.symbols <- read.csv(my.file, header = FALSE, sep = ',', skipNul = TRUE)
class(my.symbols)

#####
#conventendo para data frame
#my.df <- as.data.frame(my.symbols)
#my.df <- as.data.table(my.symbols)
my.df <- tbl_df(my.symbols)
class(my.df)

#visualizar dados do df
glimpse(my.df)
print(my.df)

#tratando  o data frame
my.df$V1 <- str_sub(my.df$V1, start = -10)
glimpse(my.df)

#conhecendo a base de dados
dim(my.df)
names(my.df)
#renomenado oas colunas do df
names(my.df) <- c('DATA', 'OPEN', 'HIGH', 'LOW', 'CLOSE', 'TICK_VOL', 'SPREAD')
names(my.df)

#tratando cada variavel
my.day <- str_sub(my.df$DATA, start = -2)
head(my.day)
my.month2 <- str_sub(my.df$DATA, start = -5)
head(my.month2)
my.month <- str_sub(my.month2, start = 1, end = 2)
head(my.month)
my.year <- str_sub(my.df$DATA, start = 1, end = 4)
head(my.year)
my.df$DATE <- str_c(my.year, "-", my.month, "-", my.day)
glimpse(my.df)

#convertendo a data
my.df$DATE <- as.Date(my.df$DATE)
glimpse(my.df)

#excluindo a coluna DATA anterir
my.df$DATA <- NULL
glimpse(my.df)
summary(my.df)

#primeiros elementos do dataframe
head(my.df)

#ultimos elementos do dataframe
tail(my.df)

#numero de linhas e colunas
nrow(my.df)
ncol(my.df)

#conhecendo a base de dados
dim(my.df)
names(my.df)
length(my.df)

#####
#estatistica basica
#media
my.mean <- mean(my.df$CLOSE)
my.mean
#mediana
my.median <- median(my.df$CLOSE)
my.median

#criando a funcao moda
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

#obtendo a moda
my.mode <- getmode(my.df$CLOSE)
my.mode

#variancia
my.var <- var(my.df$CLOSE)
my.var
#desvio padrao
my.sd <- sd(my.df$CLOSE)
my.sd

#calculando o coeficiente de variacao
my.cv <- (my.sd / my.mean) * 100
my.cv

#ou utilizar apenas o comando abaixo
summary(my.df)
