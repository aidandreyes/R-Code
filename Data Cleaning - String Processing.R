# load dataset
    movies <- read.csv("https://raw.githubusercontent.com/khasenst/datasets_teaching/refs/heads/main/movies.csv", header = FALSE)
    str(movies)

# subset dataset to 10 movies only
    movies10 <- c(movies[1:10,])
    movies10

# If last two characters in string are "::", there is no genre specified. Replace with a "None" and overwrite
    last_two <- substring(movies10, nchar(movies10)- 1, nchar(movies10))
    paste0(movies10[which(last_two == "::")], "None")
    movies10[which(last_two == "::")] <- paste0(movies10[which(last_two == "::")], " None ")

# Each meaningful data field is separated by two colons "::"; use strsplit() to split each string by ID, title, and genre
    strsplit(x = movies10, split = "::")

# Row bind each list item into a data frame
    movies_clean <- as.data.frame(do.call(rbind, strsplit(x = movies10, split = "::")))    # store cleaned data frame as a new data frame
    names(movies_clean) <- c("movie_id", "movie", "genre")
    movies_clean$year <- substring(movies_clean$movie, nchar(movies_clean$movie) - 4, nchar(movies_clean$movie)-1)  # new column for release date

# Clean movie column by removing year from the title
    movies_clean$movie <- substring(movies_clean$movie, 1, nchar(movies_clean$movie)-6)

# Format genre section
    movies_clean$genre <- gsub(pattern = "\\|", replacement = ", ", x = movies_clean$genre)

# Clean data frame by removing the movie ID number
    movies_clean <- movies_clean[, c("movie", "year", "genre")]
    movies_clean

