\name{coloc}
\alias{coloc}
\title{Colocalization analysis}
\description{
  Colocalization analysis.
}
\usage{
coloc(analysis1, analysis2,
      chrom, pos_start, pos_end,
      hgncid, ensemblid, surround = 500000,
      entity, entity1, entity2,
      style = 'Z', 
      dbc = getOption("gtx.dbConnection", NULL))
}
\arguments{
  \item{analysis1}{The key value for the first GWAS analysis to analyze}
  \item{analysis2}{The key value for the second GWAS analysis to analyze}
  \item{chrom}{Character specifying chromosome}
  \item{pos_start}{Start position of region}
  \item{pos_end}{End position of region}
  \item{hgncid}{HGNC identifier of gene to define region around}
  \item{ensemblid}{ENSEMBL gene identifier to define region around}
  \item{surround}{Distance around gene to include in region}
  \item{entity}{Identifier for an entity, for analyses of multiple entities}
  \item{entity1}{Identifier for an entity, for analysis1}
  \item{entity2}{Identifier for an entity, for analysis2}
  \item{style}{Character specifying plot style}
  \item{dbc}{Database connection}
}
\details{
  This high level function conducts a colocalization analysis, using
  summary statistics for association with two traits, across a region of
  the genome.  The two sets of summary statistics are specified using
  the \code{analysis1} and \code{analysis2} arguments.  Where one or
  both contain summary statistics for multiple entities (e.g. from eQTL or
  pQTL analyses), the desired entities must be specified (see below).

  Note that when using a \code{hgncid} or \code{ensemblid} gene
  identifier to specify the region from which to use summary statistics,
  the default \code{surround=500000} will \emph{not} include the full
  cis eQTL region as usually specified.
  
  The region of interest can be specified in several different ways.
  The region can be supplied as physical coordinates using the arguments
  \code{chrom}, \code{pos_start} and \code{pos_end}.  Alternatively, the
  region can be centered on a gene of interest, using either the
  \code{hgncid} or \code{emsemblid} argument, and the size of region
  around the gene can be modified using the \code{surround} argument.
  Note that the primary purpose of gene-identifying arguments
  \code{hgncid} or \code{ensemblid} is to specify the genomic region of
  interest (and thus the set of the variants to analyse).  It is only a
  secondary purpose that the entity for eQTL or pQTL analyses will be
  inferred from \code{hgncid} or \code{ensemblid}, if no explicit
  \code{entity} argument is given.

  Entities are used to distinguish genomic features, where a single set
  analysis includes summary statistics, for each variant, for
  associations with one or more entities.  E.g. in an eQTL analysis,
  each transcript or gene is an entity, and a single typical variant
  will have summary statistics for associations with multiple
  transcripts or genes.  If either of the analyses specified by
  \code{analysis1} and \code{analysis2} have results separated by
  entity, then the arguments \code{entity1} and \code{entity2} are used
  to specify the desired entity from each.  If either \code{entity1} or
  \code{entity2} is missing, the argument \code{entity} is used
  instead.  (This mechanism facilitates e.g. colocalization between analyses
  for the same transcript between two different eQTL datasets.)  If the
  argument \code{entity} is also missing, the function attempts to infer
  a suitable entity from the \code{hgncid} or \code{ensemblid}
  arguments.  (This leads to sensible default behaviour, and facilitates
  the most common use case of centering the genomic region of interest
  on the entity being analysed in an eQTL or pQTL dataset.)

  The \code{style} argument can be set to \sQuote{Z} to plot Z
  statistics for the two analyses, \sQuote{beta} to plot beta (effect
  size) statistics for the two analyses, or \sQuote{none} to suppress
  plotting altogether.
}
\value{
  \code{coloc} returns a data frame containing the result of the
  colocalization analysis, see \code{\link{coloc.fast}} for details.
  The plot is generated as a side effect.
}
\author{
  Toby Johnson \email{Toby.x.Johnson@gsk.com}
}
		  