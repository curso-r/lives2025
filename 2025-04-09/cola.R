tab <- tibble::tibble(
  coluna_1 = c(1, 2, 3, 4, 5),
  coluna_2 = c("a", "b", NA, "d", "e"),
  coluna_3 = c("d", "b", "a", "c", NA)
)


# Filtrando coluna 1

tab |> 
  dplyr::filter(coluna_1 == 3)


# Filtrando coluna 2
tab |> 
  dplyr::filter(coluna_2 == "a")

tab |> 
  dplyr::filter(coluna_2 != "a")

tab |> 
  dplyr::filter(coluna_2 != "a" | is.na(coluna_2))


# Filtrando coluna 2 e 3

tab |> 
  dplyr::filter((coluna_2 != "a" | is.na(coluna_2)) & (coluna_3 != "a" | is.na(coluna_3)))

tab |> 
  dplyr::filter(
    dplyr::if_any(
      dplyr::everything(),
      \(x) {
        ifelse(
          is.na(x),
          FALSE,
          x == "a"
        )
      }
    )
  )
