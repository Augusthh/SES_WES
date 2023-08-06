#!/bin/bash

#### input 
#i: CHR, 1,2,...,22
#${pheno}_outcome.txt: phenofile, header is IID,pheno,age,gender,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10
#${pheno}_covar,txt: covariatesfile, header is IID,pheno,age,gender,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10

for i in {1..22};do
plink2 --bfile  /mnt/storage/home1/Huashan1/UKB_WES_data/qcstep5/unrelated_0_0884/ukb_wes_chr${i}_sample_qc_final_unrelated \
--geno 0.05 \
--mind 0.05 \
--glm hide-covar cols=chrom,pos,ref,alt,a1freq,nobs,beta,se,tz,p \
--maf 0.01 \
--hwe 1e-6 \
--vif 1000 \
--pheno /mnt/storage/home1/Huashan1/wxr_data/WES/WESCommon/${pheno}/${pheno}_outcome.txt \
--covar /mnt/storage/home1/Huashan1/wxr_data/WES/WESCommon/${pheno}/${pheno}_covar.txt \
--covar-variance-standardize PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 \
--covar-col-nums 3,4,5,6,7,8,9,10,11,12,13,14 \
--out /mnt/storage/home1/Huashan1/wxr_data/WES/WESCommon/${pheno}/${pheno}_result_chr${i}.csv
done