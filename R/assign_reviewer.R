### Florencia D'Andrea
### Nov 27th, 2021

library(readr)
library(tibble)

#' Assign reviewers to project groups
#'
#' @param seed A random number. If you want reproducible results you need to use always the same seed number.
#' @param dataset A data.frame or tibble with a column with the student's group number (group_num).
#' @param groups_rw Max number of groups to review.
#' @param reviewers Max number of reviewers per group.
#'
#' @return The same data.frame with the column group_to_review.
#' @export
#'
#' @examples
#'
#' data(students)
#' assign_reviewer(seed = 2021,
#'                 dataset = students,
#'                 groups_rw = 30,
#'                 reviewers = 4)
#'
#'
assign_reviewer <- function(seed, dataset, groups_rw, reviewers){

  set.seed(seed)

  m <- c() # vector to accumulate random group values sampled
  r <- c() # vector to accumulate values repited 4 times

  # add column to replace with final values
  students <- students |>
    tibble::add_column(group_to_review = NA)

  for(s in 1:nrow(students)){

    # if there are group numbers repeated 4 times (r), remove them
    # then remove the group number of the reviewer
    # (we do not want students reviewing their own group!)

    if(!is.null(r)){
      values <- seq(1:groups_rw)
      values <- values[-match(r, values)]
      if(! students$group_num[s] %in% r){
        values <- values[-match(students$group_num[s], values)]}
    }else{
      values <- seq(1:groups_rw)
      values <- values[-match(students$group_num[s], values)]
    }

    n <- sample(values, 1)
    m <- c(m,n)

    # if this value sampled was obtained 4 times,
    # add it to the list of values to remove
    # (we do not want a group reviewed more than 4 times!)
    if(sum(m == n) >= reviewers){r <- c(r,n)}

    # assign to this student a random group to review
    students$group_to_review[s] <- n
  }

students
}



