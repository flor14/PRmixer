data = read_csv("C:/Users/Florencia/UBC_MDS_admin/v_students2021.csv")

library(randomNames)
random <- randomNames(116) |>
  enframe() |>
  separate(value, sep = ", ", into = c("surname","preferred_name"))  |>
  bind_cols(lab = data$lab, group_num = data$group_num)

write_csv(random, "students_pr.csv")


###


# let's see if it is balanced.
total <- students |>
  count(group_to_review)

total

# It is! But as expected,
# there are some cases with less than 4 reviewers
total |>
  filter(n<4) # some groups could need more

# I will consider all the groups reviewed by 4 students to select
# the reviewer needed for group 26
replace <- sample(seq(1:30)[-total$group_to_review[total$n %in% c(1,2,3)]],1)

# I select one student randomly from the group chosen
change <- students |>
  filter(group_to_review == replace) |>
  sample_n(1) |>
  pull("student_name")

}
