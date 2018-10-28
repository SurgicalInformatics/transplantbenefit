group2dummy <- function(length=3, group=1){
	if(group>length) stop("Group must be an integer less than or equal")
	out = rep(0, length-1)
	out[group-1] = 1
	return(out)
}