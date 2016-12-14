##' Download the BBS data set from crushing05/BBS.tenstop
##'  (\url{https://github.com/crushing05/BBS.tenstop/})
##' @title Download BBS 10-stop data set
##'
##'
##' @param version Version number.  The default will load the most
##'   recent version on your computer or the most recent version known
##'   to the package if you have never downloaded the data before.
##'   With \code{bbs_del}, specifying \code{version=NULL} will
##'   delete \emph{all} data sets.
##'
##' @param path Path to store the data at.  If not given,
##'   \code{datastorr} will use \code{rappdirs} to find the best place
##'   to put persistent application data on your system.  You can
##'   delete the persistent data at any time by running
##'   \code{bbs_del(NULL)} (or \code{bbs_del(NULL, path)} if you
##'   use a different path).
##' @rdname bbs_tenstop
##' @export
get_bbs10 <- function(version=NULL, path=NULL) {
  datastorr::github_release_get(bbs_info(path), version)
}

##' @export
##' @rdname bbs_tenstop
##'
##' @param local Logical indicating if local or github versions should
##'   be polled.  With any luck, \code{local=FALSE} is a superset of
##'   \code{local=TRUE}.  For \code{bbs_version_current}, if
##'   \code{TRUE}, but there are no local versions, then we do check
##'   for the most recent github version.
##'
bbs_versions <- function(local=TRUE, path=NULL) {
  datastorr::github_release_versions(bbs_info(path), local)
}

##' @export
##' @rdname bbs_tenstop
bbs_version_current <- function(local=TRUE, path=NULL) {
  datastorr::github_release_version_current(bbs_info(path), local)
}

##' @export
##' @rdname bbs_tenstop
bbs_del <- function(version, path=NULL) {
  datastorr::github_release_del(bbs_info(path), version)
}

## Core data:
bbs_info <- function(path) {
  datastorr::github_release_info("crushing05/BBS.tenstop",
                                 filename="bbs_tenstop.rds",
                                 read=readRDS,
                                 path=path)
}

##' Maintainer-only function for releasing data.  This will look at
##' the version in the DESCRIPTION file and make a data release if the
##' GitHub repository contains the same version as we have locally.
##' Requires the \code{GITHUB_TOKEN} environment variable to be set.
##'
##' @title Make a data release.
##' @param ... Parameters passed through to \code{\link{github_release_create}}
##' @param path Path to the data (see \code{\link{bbs}}).
##' @export
bbs_release <- function(..., path=NULL) {
  datastorr::github_release_create(bbs_info(path), ...)
}
