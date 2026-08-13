# coral matrix initialization

coralplacement <- function(numcoral, sizereef = 5) {
  reef <- matrix(0, sizereef, sizereef)
  random_coral <- sample(1:sizereef^2, size = numcoral)
  for (rc in random_coral) {
    rc_row <- (rc - 1) %/% sizereef + 1
    rc_col <- (rc - 1) %% sizereef + 1
    reef[rc_row, rc_col] <- 1
  }
  return(reef)
}

# growth function
growthfunc <- function(){
  #sets up how a coral will grow
  growth_row_offset <- c(-1,-1,-1, 0, 1, 1, 1, 0)
  growth_col_offset <- c(-1, 0, 1, 1, 1, 0, -1, -1)
  growth_roll <- sample(8,1)
  growth_row <- coral_row + growth_row_offset[growth_roll]
  growth_col <- coral_col +growth_col_offset[growth_roll]

  #checks if inbound
  in_bounds <- growth_row >= 1 &&
  growth_row <=5&&
  growth_col >=1 &&
  growth_col <= 5

  #if inbound, triggers growth to selected coordinate
  if (in_bounds == TRUE) {
  reef[growth_row,growth_col] <- 1}
}