> data<-read.csv(file.choose())
> View(data)
> data$loc<-bin(data$loc, nbins = 10, labels = c("1","2","3","4","5","6","7","8","9","10"), method = "length", na.omit = TRUE)
> View(data)
> data$v.g.<-bin(data$v.g., nbins = 10, labels = c("1","2","3","4","5","6","7","8","9","10"), method = "length", na.omit = TRUE)
> min(data$ev.g.)
> max(data$ev.g.)
> View(data)
> data$ev.g.<-bin(data$ev.g., nbins = 10, labels = c("1","2","3","4","5","6","7","8","9","10"), method = "length", na.omit = TRUE)
> View(data)
> max(data$iv.G.)

> min(data$iv.G.)

> data$iv.G.<-bin(data$iv.G., nbins = 10, labels = c("1","2","3","4","5","6","7","8","9","10"), method = "length", na.omit = TRUE)
> View(data)
> data$N<-bin(data$N, nbins = 10, labels = c("1","2","3","4","5","6","7","8","9","10"), method = "length", na.omit = TRUE)
> max(data$V)

> min(data$V)

> data$V<-bin(data$V, nbins = 10, labels = c("1","2","3","4","5","6","7","8","9","10"), method = "length", na.omit = TRUE)
> View(data)
max(data$L)

min(data$L)

data$L<-bin(data$L, nbins = 3, labels = c("0","1","2"), method = "length", na.omit = TRUE)

max(data$D)

min(data$D)
data$D<-bin(data$D, nbins = 10, labels = c("1","2","3","4","5","6","7","8","9","10"), method = "length", na.omit = TRUE)
max(data$I)

min(data$I)
data$I<-bin(data$I, nbins = 10, labels = c("1","2","3","4","5","6","7","8","9","10"), method = "length", na.omit = TRUE)


max(data$E)

min(data$E)

data$E<-bin(data$E, nbins = 10, labels = c("1","2","3","4","5","6","7","8","9","10"), method = "length", na.omit = TRUE)

max(data$B)

min(data$B)

data$B<-bin(data$B, nbins = 10, labels = c("1","2","3","4","5","6","7","8","9","10"), method = "length", na.omit = TRUE)

max(data$T)

min(data$T)

data$T<-bin(data$T, nbins = 10, labels = c("1","2","3","4","5","6","7","8","9","10"), method = "length", na.omit = TRUE)

max(data$lOCode)

min(data$lOCode)

data$lOCode<-bin(data$lOCode, nbins = 6, labels = c("1","2","3","4","5","6"), method = "length", na.omit = TRUE)
max(data$lOComment)

min(data$lOComment)
data$lOComment<-bin(data$lOComment, nbins = 10, labels = c("1","2","3","4","5","6","7","8","9","10"), method = "length", na.omit = TRUE)

max(data$locCodeAndComment)

data$locCodeAndComment<-bin(data$locCodeAndComment, nbins = 5, labels = c("1","2","3","4","5"), method = "length", na.omit = TRUE)


max(data$lOBlank)


data$lOBlank<-bin(data$lOBlank, nbins = 9, labels = c("1","2","3","4","5","6","7","8","9"), method = "length", na.omit = TRUE)

max(data$uniq_Op)

min(data$uniq_Op)

data$uniq_Op<-bin(data$uniq_Op, nbins = 10, labels = c("1","2","3","4","5","6","7","8","9","10"), method = "length", na.omit = TRUE)

max(data$uniq_Opnd)

min(data$uniq_Opnd)


data$uniq_Opnd<-bin(data$uniq_Opnd, nbins = 9, labels = c("1","2","3","4","5","6","7","8","9"), method = "length", na.omit = TRUE)


max(data$total_Op)

min(data$total_Op)

data$total_Op<-bin(data$total_Op, nbins = 10, labels = c("1","2","3","4","5","6","7","8","9","10"), method = "length", na.omit = TRUE)


max(data$total_Opnd)

min(data$total_Opnd)

data$total_Opnd<-bin(data$total_Opnd, nbins = 10, labels = c("1","2","3","4","5","6","7","8","9","10"), method = "length", na.omit = TRUE)


max(data$branchCount)

min(data$branchCount)


data$branchCount<-bin(data$branchCount, nbins = 10, labels = c("1","2","3","4","5","6","7","8","9","10"), method = "length", na.omit = TRUE)

