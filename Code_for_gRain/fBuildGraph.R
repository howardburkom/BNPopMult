fBuildGraph = function(linkFileName,colSet = NULL) {
  dLinkMat = read.csv(linkFileName, header = T)
  if (!is.null(colSet)) { dLinkMat = dLinkMat[colSet,colSet]}
  arcSet = matrix(NA, nrow=0, ncol=2)
  for (iRow in 1:nrow(dLinkMat)) {
    for (iCol in 1:ncol(dLinkMat)) {
      if (dLinkMat[iRow, iCol] > 0) {
        arcSet = rbind(arcSet, c(names(dLinkMat)[iCol], names(dLinkMat)[iRow]))
      }
    }
  }
  bn_graph = empty.graph(names(dLinkMat))
  arcs(bn_graph) = arcSet
  return(bn_graph)
}