#载入所需要的库
library("mmgenome")
library(grid)

#载入装箱分析所需要的数据，并对数据进行处理
assembly <- readDNAStringSet("data/assembly.fa", format = "fasta")

C13.11.14 <- read.table("data/C13.11.14.csv", header = T, sep = ",")[,c("Reference.sequence", "Average.coverage")]               
C13.11.25 <- read.table("data/C13.11.25.csv", header = T, sep = ",")[,c("Reference.sequence", "Average.coverage")]               
C13.12.03 <- read.table("data/C13.12.03.csv", header = T, sep = ",")[,c("Reference.sequence", "Average.coverage")]               
C14.01.09 <- read.table("data/C14.01.09.csv", header = T, sep = ",")[,c("Reference.sequence", "Average.coverage")]  

ess <- read.table("data/essential.txt", header = T, sep = " ")
tax <- read.table("data/tax.txt", header = T, sep = "\t")
pe <- read.table("data/network_pe.txt", header = T, sep = "\t")
mp <- read.table("data/network_mp.txt", header = T, sep = "\t")
rRNA16S <- read.table("data/16S.txt", header = T, sep = "\t")
pps <- read.table("data/pps.txt", sep = "\t", header = F, col.names = c("scaffold","pps_root", "pps_kingdom", "pps_phylum", "pps_class", "pps_order", "pps_family", "pps_genus", "pps_species"))[,c(1,4,5,6,7,8)]
pps[pps == ""] <- NA

#用mmgenome进行宏基因组装箱分析并将结果可视化
d <- mmload(assembly = assembly, 
            pca = T,
            coverage = c("C13.11.14", "C13.11.25", "C13.12.03", "C14.01.09"), 
            essential = ess,           
            tax = tax,
            tax.expand = "Proteobacteria",
            tax.freq = 50,
            other = c("rRNA16S", "pps")
)


colnames(d$scaffolds)
mmstats(d, ncov = 4)
p <- mmplot(data = d, x = "C13.11.25", y = "C14.01.09", log.x = T, log.y = T, color = "essential", minlength = 3000)
p

sel <- mmplot_locator(p, trans = c("log10","log10"))

#提取出感兴趣的菌种的数据
dA <- mmextract(d, sel)
mmstats(dA, ncov = 4)
mmplot(data = dA, x = "C13.11.25", y = "C14.01.09", log.x = T,  log.y = T, color = "essential")

mmplot_pairs(data = dA,
             variables = c("C13.11.14","C13.11.25","C13.12.03", "C14.01.09", "gc", "PC2"), 
             log = c("C13.11.14","C13.11.25","C13.12.03", "C14.01.09"),
             color = "pps_phylum",
             textsize = 5
)

#对提取出的数据进行进一步的装箱分析
p <- mmplot(data = dA, x = "C13.12.03", y = "C13.11.14", log.x = T, log.y = T, color = "pps_phylum")

p
sel <- mmplot_locator(p, trans = c("log10","log10"))

mmplot_selection(p, sel)
dB <- mmextract(dA, sel)
mmstats(dB, ncov = 4)
