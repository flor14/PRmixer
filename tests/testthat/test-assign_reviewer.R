
data(students)
library(dplyr)

reviewers = 4
groups_rw = 30
students <- assign_reviewer(seed = 2021,
                # dataset = students,
                groups_rw = 30,
                reviewers = 4)

# let's see if it is balanced.
total <- students |>
          dplyr::count(group_to_review)

### TESTS
print("Relation groups to review / students")
test_that("the relation between groups to review and students it is OK", {
  expect_true(as.integer(reviewers) >= ceiling(nrow(students)/as.integer(groups_rw)))
})

print("Maximum number of reviewers by group is the value defined by the user")
test_that("maximum group of reviewers is the determined by the flag", {
  expect_equal(max(as.integer(total$n)), as.integer(reviewers))
})

print("Students assigned as reviewers to a different group")
test_that("the students are not assigned as reviewers of their same group", {
  expect_equal(sum(students$group_num == students$group_to_review), 0)
})


