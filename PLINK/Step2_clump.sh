#!/bin/bash

#### input 
#i: CHR, 1,2,...,22
#${pheno}_for_clump.txt: significant results from step 1, header is Chr,Start,Ref,Alt,ID,A1,A1_FREQ,OBS_CT,BETA,SE,T_STAT,P,phenoname

for i in {1..22};
do
plink1.9 --bfile /home1/Huashan1/UKB_WES_data/qcstep5/unrelated_0_0884/ukb_wes_chr${i}_sample_qc_final_unrelated \
--keep /home1/Huashan1/wbs_data/lws/british_id_sample_wes_common.txt \
--clump /mnt/storage/home1/Huashan1/wxr_data/WES/WESCommon/${pheno}/${pheno}_for_clump.txt \
--clump-p1 3.504345e-07 \
--clump-p2 1e-4 \
--clump-r2 0.1 \
--clump-kb 500 \
--clump-field P \
--clump-snp-field ID \
--out /mnt/storage/home1/Huashan1/wxr_data/WES/WESCommon/${pheno}/clumped.chr${i}_${pheno}.txt
done