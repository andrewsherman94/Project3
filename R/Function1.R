query_genbank2 <- function(target, gene, return_max){
  x <- gene
  y <- return_max
  search_returns = c()
  query <- paste0(target, "[Organism] AND ", x, "[Gene] AND ", "2000:2019[PDAT]")
  search_returns <- c(entrez_search(db = "Nucleotide", term = query, retmax = y, api_key= "343978704c7afa7b38e2ad42e30294804308"))
  z <- search_returns$id
  sequence <- entrez_fetch(db = "nuccore", id = z, rettype = "fasta", retmax = y)
  cat(sequence, file = "genbank_out.txt", append = TRUE)
  View(sequence)
  return(sequence)
}


## Remove View() later
