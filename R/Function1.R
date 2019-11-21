#' Queries data from genbank
#' 
#' Pulls data from genbank and complies in into a .fasta file for further anaylsis
#' 
#' @param target the taxa sequences are wanted for (can be species, genera, family level, etc)
#' @param gene the gene of interest -- such as CytB, ND2, COI, RAG2
#' @param return_max the number of sequences to return
#' @return a list of sequences
#' @export query_genbank2


seq_req <- function(target, gene, return_max){
  library(rentrez)
  x <- gene
  y <- return_max
  search_returns = c()
  query <- paste0(target, "[Organism] AND ", x, "[Gene] AND ", "2000:2019[PDAT]")
  search_returns <- c(entrez_search(db = "Nucleotide", term = query, retmax = y, api_key= "343978704c7afa7b38e2ad42e30294804308"))
  z <- search_returns$id
  sequence <- entrez_fetch(db = "nuccore", id = z, rettype = "fasta", retmax = y)
  cat(sequence, file = "genbank_out.fasta", append = TRUE)
  return(sequence)
}


