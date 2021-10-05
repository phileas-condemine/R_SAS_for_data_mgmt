sas_pgm_list=list.files("programme_sas_I_echange/")
# nm=sample(sas_pgm_list,1)
codes_SAS_I=pbapply::pbsapply(sas_pgm_list,function(nm){
  file_path=paste0("programme_sas_I_echange/",nm)
  # print(file_path)
  sas_pgm_code=readLines(file_path)
  sas_pgm_code=paste(sas_pgm_code,collapse=" ")
  sas_pgm_code=gsub("\t"," ",sas_pgm_code)
  return(paste0("_____",nm,"_____",sas_pgm_code))
})

sas_pgm_list=list.files("programme_sas_T/")
sas_pgm_list=sas_pgm_list[!grepl("acces",sas_pgm_list)]
# nm=sample(sas_pgm_list,1)
codes_SAS_T=pbapply::pbsapply(sas_pgm_list,function(nm){
  file_path=paste0("programme_sas_T/",nm)
  # print(file_path)
  sas_pgm_code=readLines(file_path)
  sas_pgm_code=paste(sas_pgm_code,collapse=" ")
  sas_pgm_code=gsub("\t"," ",sas_pgm_code)
  return(paste0("_____",nm,"_____",sas_pgm_code))
})
codes_SAS=paste(c(codes_SAS_I,codes_SAS_T),collapse=" ")

save(list="codes_SAS",file="codes_SAS_I_et_T.RData")
