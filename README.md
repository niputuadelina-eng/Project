# Analisis Tingkat Kepuasaan Mahiswa Terhadap Kondisi Lingkungan Kampus di FMIPA Universitas Mataram
## Latar Belakang
Aktivitas akademik merupakan bagian penting dalam kehidupan mahasiswa di perguruan tinggi. Lingkungan kampus yang kondusif, nyaman, aman, dan bersih dapat membantu mahasiswa menjalankan aktivitas akademik dengan lebih efektif sehingga meningkatkan kepuasan mahasiswa terhadap lingkungan kampus. Kepuasan mahasiswa merupakan perasaan puas yang diperoleh setelah membandingkan harapan dengan kenyataan dari pelayanan yang diterima. Tingkat kepuasan tersebut dipengaruhi oleh beberapa aspek lingkungan kampus, seperti kebersihan, fasilitas tempat duduk, area parkir, keamanan, pencahayaan, dan kenyamanan suasana belajar. Kondisi lingkungan kampus yang baik dapat menciptakan suasana belajar yang lebih kondusif sehingga meningkatkan kepuasan mahasiswa. Oleh karena itu, penelitian ini dilakukan untuk mengetahui tingkat kepuasan mahasiswa terhadap kondisi lingkungan kampus berdasarkan hasil survei online yang dilakukan kepada mahasiswa.
## Tujuan
Tujuan penelitian ini adalah untuk mengetahui tingkat kepuasan mahasiswa terhadap kondisi lingkungan kampus berdasarkan hasil survei online. 
## Metode Penelitian
Penelitian ini menggunakan pendekatan kuantitatif yang bertujuan untuk mengetahui dan menganalisis tingkat kepuasan mahasiswa FMIPA Universitas Mataram terhadap kondisi lingkungan kampus. Teknik pengambilan sampel dalam penelitian ini dilakukan dengan menggunakan rumus Slovin untuk menentukan jumlah responden yang diperlukan. Penentuan ukuran sampel menggunakan tingkat kesalahan (error) sebesar 15%, sehingga diperoleh jumlah sampel yang dianggap mampu mewakili populasi penelitian. Responden penelitian merupakan mahasiswa FMIPA Universitas Mataram yang bersedia mengisi kuesioner yang telah disebarkan secara daring melalui Google Form. Data yang terkumpul kemudian diolah dan dianalisis menggunakan perangkat lunak pemrograman RStudio untuk melakukan uji validitas, uji reliabilitas.
### Tahapan Pengolahan Data
### 1. Menentukan Sampel (Slovin)
Pada tahapan ini dilakukan penentuan jumlah sampel penelitian menggunakan rumus Slovin. Rumus Slovin digunakan untuk menentukan ukuran sampel dari suatu populasi dengan tingkat kesalahan (error) tertentu sehingga sampel yang diperoleh dapat mewakili populasi penelitian. Dalam penelitian ini, jumlah populasi mahasiswa FMIPA Universitas Mataram sebanyak 1693 mahasiswa dengan tingkat kesalahan sebesar 15%.
```r
N <- 1693
e <- 0.15

n <- N / (1 + N * e^2)

cat("Ukuran sampel Slovin:", ceiling(n))
```
### 2. Memanggil Library dan import data
Tahap ini dilakukan untuk memanggil package yang diperlukan dalam pengolahan data.
```r
library(readxl)
library(psych)
```
Tahap ini digunakan untuk membaca data kuesioner yang akan dianalisis.
```r
data29 <- read_excel("C:/Users/Lina/OneDrive/Dokumen/Matkul Teksam/Data 29.xlsx")
data44 <- read_excel("C:/Users/Lina/OneDrive/Dokumen/Matkul Teksam/Data 44.xlsx")
# Melihat data
View(data29)
View(data44)
```
### 3. Uji Validitas
Pada tahap ini dilakukan uji validitas untuk mengetahui apakah setiap item pernyataan pada kuesioner mampu mengukur variabel penelitian secara tepat. Uji validitas dilakukan dengan menghitung korelasi antara skor setiap item pertanyaan dengan skor total responden menggunakan korelasi item-total. Semakin tinggi nilai korelasi yang diperoleh, maka item tersebut semakin baik dalam merepresentasikan variabel yang diteliti. Dalam penelitian ini, uji validitas dilakukan pada data dengan 29 responden dan 44 responden untuk membandingkan hasil validitas sebelum dan sesudah penambahan jumlah sampel.

Tahapan ini digunakan untuk mengambil item-item pertanyaan yang akan diuji validitasnya.
```r
# Ambil item kuesioner
item1 <- data29[, c("P1","P2","P3","P4","P5","P6","P7","P8","P9","P10")]
item2 <- data44[, c("P1","P2","P3","P4","P5","P6","P7","P8","P9","P10")]
```
Tahapan ini digunakan untuk menghitung total skor setiap responden.
```r
# Skor total
total29 <- rowSums(item1)
total44 <- rowSums(item2)
```
Tahapan ini digunakan untuk menghitung hubungan antara setiap item dengan skor total.
```r
# Korelasi item-total
valid29 <- cor(item1, total29)
valid44 <- cor(item2, total44)

valid29
valid44
```
Tahapan ini digunakan untuk membandingkan hasil validitas antara 29 responden dan 44 responden.
```r
# Membandingkan hasil validitas
hasil_validitas <- data.frame(
  Item = colnames(data29),
  r_29 = as.vector(valid29),
  r_44 = as.vector(valid44)
)

hasil_validitas
```
### 4. Uji Reliabilitas
Pada tahap ini dilakukan uji reliabilitas untuk mengetahui tingkat konsistensi item-item pernyataan pada kuesioner. Dalam penelitian ini, uji reliabilitas dilakukan menggunakan metode Cronbach Alpha. Semakin tinggi nilai Cronbach Alpha, maka semakin baik tingkat reliabilitas instrumen penelitian. Pengujian dilakukan pada data dengan 29 responden dan 44 responden untuk membandingkan tingkat reliabilitas sebelum dan sesudah penambahan jumlah sampel.

Tahapan ini digunakan untuk menghitung nilai Cronbach Alpha pada masing-masing data.
```r
# Reliabilitas sampel 29
reli29 <- alpha(item1)
# Reliabilitas sampel 44
reli44 <- alpha(item2)

reli29
reli44
```
Tahapan ini digunakan untuk menampilkan nilai reliabilitas dari masing-masing data.
```r
# Menampilkan Nilai Cronbach Alpha
reli29$total$raw_alpha
reli44$total$raw_alpha
```
Tahapan ini digunakan untuk membandingkan hasil reliabilitas antara 29 responden dan 44 responden.
```r
hasil_reliabilitas <- data.frame(
  Sampel = c("29 Responden", "44 Responden"),
  Cronbach_Alpha = c(
    reli29$total$raw_alpha,
    reli44$total$raw_alpha
  )
)

hasil_reliabilitas
```
## Hasil dan Pembahasan
### Slovin
Tabel Slovin
| Keterangan | Nilai |
|---|---|
| Hasil Perhitungan Slovin | 43,30 |
| Jumlah Sampel | 44 Responden |

Penentuan jumlah sampel dalam penelitian ini dilakukan menggunakan rumus Slovin dengan tingkat kesalahan sebesar 15%. Berdasarkan hasil perhitungan, dari total populasi sebanyak 1693 mahasiswa diperoleh jumlah sampel sebesar 43,30 yang kemudian dibulatkan menjadi 44 responden. Jumlah sampel tersebut dianggap mampu mewakili populasi penelitian sehingga dapat digunakan untuk memperoleh data mengenai tingkat kepuasan mahasiswa FMIPA Universitas Mataram terhadap kondisi lingkungan kampus.
### Uji Validitas
Tabel Validitas
| Item  | r Hitung (44 Responden) |r tabel | Keterangan |
|---|---|---|---|
| P1 | 0.54 |0.297 | Valid |
| P2 | 0.67 |0.297 | Valid |
| P3 | 0.52 | 0.297| Valid |
| P4 | 0.60 | 0.297| Valid |
| P5 | 0.76 | 0.297| Valid |
| P6 | 0.45 | 0.297| Valid |
| P7 | 0.77 | 0.297| Valid |
| P8 | 0.72 | 0.297| Valid |
| P9 | 0.59 | 0.297| Valid |
| P10 | 0.84 | 0.297| Valid |

Berdasarkan hasil uji validitas menggunakan korelasi Perason, terhadap 10 item peryataan dengan jumlah responden sebanyak 44 orang, diperoleh nilai r hitung seluruh item lebih besar dari r tabel (0,297). Hal tersebut menunjukkan bahwa seluruh item pernyataan pada kuesioner dinyatakan valid. 

Tabel Hasil Perbandingan
| Item | r Hitung (29 Responden) | r Hitung (44 Responden) | Keterangan |
|---|---|---|---|
| P1 | 0.75 | 0.54 | Valid |
| P2 | 0.67 | 0.67 | Valid |
| P3 | 0.77 | 0.52 | Valid |
| P4 | 0.50 | 0.60 | Valid |
| P5 | 0.74 | 0.76 | Valid |
| P6 | 0.58 | 0.45 | Valid |
| P7 | 0.75 | 0.77 | Valid |
| P8 | 0.66 | 0.72 | Valid |
| P9 | 0.78 | 0.59 | Valid |
| P10 | 0.87 | 0.84 | Valid |

Berdasarkan hasil uji validitas, seluruh item pernyataan memiliki nilai r hitung yang lebih besar dibandingkan nilai r tabel ehingga seluruh item dinyatakan valid. Pada data dengan 29 responden digunakan nilai r tabel sebesar 0,367, sedangkan pada data dengan 44 responden digunakan nilai r tabel sebesar 0,297. Hasil pengujian menunjukkan bahwa item P1 sampai P10 mampu mengukur variabel penelitian dengan baik. Meskipun terdapat beberapa item yang mengalami penurunan nilai korelasi setelah penambahan jumlah responden, seluruh item tetap memenuhi kriteria validitas karena nilainya masih berada di atas r tabel, Oleh karena itu, seluruh item kuesioner layak digunakan dalam penelitian.

### Uji Reliabilitas
Tabel Reliabilitas
| Sampel | Cronbach Alpha | Keterangan |
|---|---|---|
| 44 Responden | 0.84 | Reliabel |

Berdasarkan hasil uji reliabilitas diperoleh nilai Cronbach’s Alpha sebesar 0,84. Nilai tersebut lebih besar dari 0,60 sehingga kuesioner dinyatakan reliabel. Hal ini menunjukkan bahwa seluruh item pernyataan pada kuesioner memiliki tingkat konsistensi yang baik dalam mengukur kepuasan mahasiswa terhadap kondisi lingkungan kampus.

Tabel Perbandingan
| Sampel | Cronbach Alpha | Keterangan |
|---|---|---|
| 29 Responden | 0.88 | Reliabel |
| 44 Responden | 0.84 | Reliabel |

Berdasarkan hasil uji reliabilitas menggunakan metode Cronbach Alpha, pada data 29 responden dan data 44 responden. Kedua nilai Cronbach Alpha berada di atas 0,60 sehingga instrumen penelitian dinyatakan reliabel. Hasil ini menunjukkan bahwa item-item pada kuesioner memiliki tingkat konsistensi yang baik dalam mengukur variabel penelitian. Meskipun nilai Cronbach Alpha pada 44 responden sedikit menurun dibandingkan 29 responden, nilai yang diperoleh masih berada pada kategori reliabel sehingga kuesioner tetap layak digunakan dalam penelitian.

## Kesimpulan
Berdasarkan hasil uji validitas dan reliabilitas yang telah dilakukan, seluruh item pernyataan pada kuesioner dinyatakan valid karena memiliki nilai r hitung yang lebih besar dari nilai r tabel Hasil uji reliabilitas juga menunjukkan bahwa instrumen penelitian memiliki nilai Cronbach Alpha di atas 0,60 sehingga dinyatakan reliabel dan memiliki tingkat konsistensi yang baik.

Selain itu, ketika jumlah sampel ditambahkan dari 29 responden menjadi 44 responden, seluruh item tetap memenuhi kriteria validitas dan reliabilitas. Hal ini menunjukkan bahwa instrumen penelitian tetap stabil dan layak digunakan meskipun jumlah responden bertambah. Dengan demikian, kuesioner dapat digunakan untuk mengukur tingkat kepuasan mahasiswa FMIPA Universitas Mataram terhadap kondisi lingkungan kampus.

## Link: https://forms.gle/ESSwpqQJWmYVABqo8 
