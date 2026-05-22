# Library yang digunakan
library(readxl)
library(psych)

# Rumus Slovin
N <- 1693
e <- 0.15

n <- N / (1 + N * e^2)

cat("Ukuran sampel Slovin:", ceiling(n))

# IMPORT DATA
data29 <- read_excel("C:/Users/Lina/OneDrive/Dokumen/Matkul Teksam/Data 29.xlsx")
data44 <- read_excel("C:/Users/Lina/OneDrive/Dokumen/Matkul Teksam/Data 44.xlsx")
# Melihat data
View(data29)
View(data44)


# UJI VALIDITAS
# Ambil item kuesioner
item1 <- data29[, c("P1","P2","P3","P4","P5","P6","P7","P8","P9","P10")]
item2 <- data44[, c("P1","P2","P3","P4","P5","P6","P7","P8","P9","P10")]
# Uji validitas
corr.test(item1)
corr.test(item2)
# Skor total
total29 <- rowSums(item1)
total44 <- rowSums(item2)
# Korelasi item-total
valid29 <- cor(item1, total29)
valid44 <- cor(item2, total44)
# Menampilkan hasil 
valid29
valid44
##Perbandingan nilai validitas sampel
hasil_validitas <- data.frame(
  Item = colnames(data29),
  r_29 = as.vector(valid29),
  r_44 = as.vector(valid44)
)

hasil_validitas

# UJI REABILITAS
# Reliabilitas sampel 29
reli29 <- alpha(item1)
# Reliabilitas sampel 44
reli44 <- alpha(item2)
# Menampilkan hasil lengkap
reli29
reli44
#
reli29$total$raw_alpha
reli44$total$raw_alpha
# Perbandingan Reabilitas
hasil_reliabilitas <- data.frame(
  Sampel = c("29 Responden", "44 Responden"),
  Cronbach_Alpha = c(
    reli29$total$raw_alpha,
    reli44$total$raw_alpha
  )
)

hasil_reliabilitas