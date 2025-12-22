serializer_comparison_plot <- function() {
  row_count <- c(10, 100, 1000, 10000, 100000, 1000000)

  serializer_comparison <- function(n) {
    bench::mark(
      default = {
        df <- dplyr::sample_n(
          palmerpenguins::penguins,
          size = n,
          replace = TRUE
        )
        jsonlite::toJSON(df)
      },
      optimized = {
        df <- dplyr::sample_n(
          palmerpenguins::penguins,
          size = n,
          replace = TRUE
        )
        yyjsonr::write_json_str(df)
      },
      check = FALSE
    )
  }

  res <- bench::press(
    n = row_count,
    {
      serializer_comparison(n)
    }
  )

  return(res)
}


ting <- serializer_comparison_plot()
ting2 <- filter(ting, n == 1000)

ggplot(
  data = ting2,
  aes(x = )
)
