BEGIN {
    FS = "\t";
    OFS=FS;
}

{
    line[NR] = $0    # saves the line
    for (f=1; f<=NF; f++) {
        len = length($f)
        if (len>maxlen[f])
            maxlen[f] = len    # array of maximum field lengths
    }
}

END {
    for(nr=1; nr<=NR; nr++) {
        nf = split(line[nr], fields)
        for (f=1; f<nf; f++)
            # BusyBox doesn't handle %*s
            # printf "%-*s", maxlen[f]+2, fields[f]
            printf "%-" (maxlen[f]+2) "s", fields[f]
        print fields[f]     # don't need to pad the last field
    }
}