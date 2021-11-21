#usr/env/bash

input_dir=$1
dist_dir=$2
proj=$3
#inpit_dir contains all the fq files to be prossesed

n=29
m=36
o=1
sed -i "${m}i\ \t\\tall:" ${proj}
for file in $(ls ${input_dir}/*.R1.fq.gz)
do
    sample=$(basename ${file} .R1.fq.gz)
    mkdir ${dist_dir}/${sample}
    mv ${sample}.R1.fq.gz ${dist_dir}/${sample}
    mv ${sample}.R2.fq.gz ${dist_dir}/${sample}
    library_name=''${sample}':'
    sed -i "${n}i\ \t\\t${sample}:" ${proj}
    sed -i "$[$n+1]i\ \t\\t\\tlane${o}:" ${proj}
    sed -i "$[$n+2]i\ \t\\t\\t\\t- ${dist_dir}/${sample}/${sample}.R1.fq.gz" ${proj}
    sed -i "$[$n+3]i\ \t\\t\\t\\t- ${dist_dir}/${sample}/${sample}.R2.fq.gz" ${proj}
    sed -i "$[$m+5]i\ \t\\t\\t- ${sample}" ${proj}
    n=$[${n}+4]
    m=$[${m}+4]
    o=$[${o}+1]
done

    
    
