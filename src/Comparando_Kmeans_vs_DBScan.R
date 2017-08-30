# Exemplo de K-Means não encontrando os 5 Clusters

if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/factoextra")

library(factoextra)
data("multishapes")
df <- multishapes[, 1:2]

plot(df, "DataSet de Multi Formas")

set.seed(123)
km.res <- kmeans(df, 5, nstart = 25)
fviz_cluster(km.res, df, frame = FALSE, geom = "point")


# ===================================================
# Exemplo de K-Means não encontrando os 5 Clusters
# ===================================================
# Exemplos de Cluster DBScan com fpc


# ==========
# Utilizando DBSCAN do pacote fpc
if(!require(fpc)) install.packages("fpc")

library("fpc")
# Compute DBSCAN using fpc package
set.seed(123)
res.fpc <- fpc::dbscan(df, eps = 0.15, MinPts = 5)

# Plotar resultados do DBSCAN
plot(res.fpc, df, main = "DBSCAN", frame = FALSE)

library("factoextra")
fviz_cluster(res.fpc, df, stand = FALSE, frame = FALSE, geom = "point")

# Print DBSCAN
print(res.fpc)


# ==========
# Utilizando DBSCAN do pacote dbscan
if(!require(dbscan)) install.packages("dbscan")

library("dbscan")

res.db <- dbscan::dbscan(df, 0.15, 5)

# Plotar resultados do DBSCAN
plot(res.db, df, main = "DBSCAN", frame = FALSE)

library("factoextra")
fviz_cluster(res.db, df, stand = FALSE, frame = FALSE, geom = "point")


# ==========
# Verificando se os clusters produzidos estão com os mesmos resultados
all(res.fpc$cluster == res.db$cluster)


# ====================================================
# Definindo o valor ótimo de eps 
dbscan::kNNdistplot(df, k =  5)
abline(h = 0.15, lty = 2)


# ====================================================



