#!/usr/local/bin/Rscript

# set up the data
df <- data.frame(Circulatory=c(32,26,19,16,14,13,11,11),
         Mental=c(11,11,18,24,23,24,26,23),
         Musculoskeletal=c(17,18,13,16,12,18,20,26),
         Cancer=c(10,15,15,14,16,16,14,14))

rownames(df) <- seq(1975,2010,by=5)

df

# set up colours and points
cols <- c("darkolivegreen3","darkcyan","mediumpurple2","coral3")
pch <- c(17,18,8,15)

# we have one point on X axis for each row of df (nrow(df))
# we then add 2.5 to make room for the legend
xmax <- nrow(df) + 2.5

# make the borders smaller
par(mar=c(3,3,0,0))

# plot an empty graph
plot(1:nrow(df), 1:nrow(df), pch="", 
        xlab=NA, ylab=NA, xaxt="n", yaxt="n", 
        ylim=c(0,35), bty="n", xlim=c(1,xmax))

# add horizontal lines
for (i in seq(0,35,by=5)) {
    lines(1:nrow(df), rep(i,nrow(df)), col="grey")
}

# add points and lines 
# for each dataset
for (i in 1:ncol(df)) {
    points(1:nrow(df), df[,i], pch=pch[i], 
        col=cols[i], cex=1.5)
        
    lines(1:nrow(df), df[,i], col=cols[i], 
        lwd=4)
}

# add bottom axes
axis(side=1, at=1:nrow(df), tick=FALSE, 
        labels=rownames(df))

axis(side=1, at=seq(-0.5,8.5,by=1), 
        tick=TRUE, labels=NA)

# add left axis
axis(side=2, at=seq(0,35,by=5), tick=TRUE, 
        las=TRUE, labels=paste(seq(0,35,by=5),"%",sep=""))

# add legend
legend(8.5,25,legend=colnames(df), pch=pch, 
        col=cols, cex=1.5, bty="n",  lwd=3, lty=1)