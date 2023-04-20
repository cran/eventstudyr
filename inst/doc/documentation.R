## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(eventstudyr)

## ----Data preview-------------------------------------------------------------

dim(df_sample_dynamic)
head(df_sample_dynamic)

## ----Basic Eventstudy Example - Show Code, eval = FALSE-----------------------
#  results <- EventStudy(estimator = "OLS",
#                        data = df_sample_dynamic,
#                        outcomevar = "y_jump_m",
#                        policyvar = "z",
#                        idvar = "id",
#                        timevar = "t",
#                        post = 3,
#                        pre = 0)

## ----Basic Eventstudy Example - Run Code, echo = FALSE------------------------
results <- EventStudy(estimator = "OLS",
                      data = df_sample_dynamic,
                      outcomevar = "y_jump_m",
                      policyvar = "z",
                      idvar = "id",
                      timevar = "t",
                      post = 3,
                      pre = 0)

## ----Basic Eventstudy Example - Show Results 1, echo=TRUE, eval=TRUE----------
    summary(results$output)

## -----------------------------------------------------------------------------
## Estimator
results$arguments$estimator

## Data
results$arguments$data[1:5,]

## Variables
results$arguments$outcomevar
results$arguments$outcomevar
results$arguments$policyvar
results$arguments$idvar
results$arguments$timevar
results$arguments$controls

## Proxies
results$arguments$proxy
results$arguments$proxyIV

## Fixed Effects
results$arguments$FE
results$arguments$TFE

## Periods
results$arguments$post
results$arguments$overidpost
results$arguments$pre
results$arguments$overidpre

## Normalization
results$arguments$normalize
results$arguments$normalization_column

## Cluster
results$arguments$cluster

## Eventstudy Coefficient
results$arguments$eventstudy_coefficients

## ----EventStudyPlot example 1, fig.dim = c(7, 5)------------------------------
eventstudy_estimates_ols <- EventStudy(estimator = "OLS",
                                       data = df_sample_dynamic,
                                       outcomevar = "y_jump_m",
                                       policyvar = "z",
                                       idvar = "id",
                                       timevar = "t",
                                       post = 3,
                                       pre = 0)
 
EventStudyPlot(estimates = eventstudy_estimates_ols,
               xtitle = "Event time",
               ytitle = "Coefficient")

