
# initialize and import ---------------------------------------------------

# libraries
library(tidyverse)
library(tabulizer)
library(readxl)

# search terms
search_terms <- read_excel("C:/Users/gbushman/Documents/Projects/misc/legislative-analysis/keyword-dictionaries.xlsx", sheet = "full_dictionary") %>%
  select(dictionary, terms) %>%
  distinct()

# all relevant bills (import from most up-to-date version of the legislative tracking tool)
bills_tracking <- read_excel("C:/Users/gbushman/Documents/Projects/misc/legislative-analysis/Updated Michigan Legislative Tracking Tool (tracking starts 05_2017).xlsx", skip = 2) %>%
  mutate(bill_name = Document)


# extract text from legislative pdfs --------------------------------------

# stitch bill URLs from document name
bills_info <- separate(bills_tracking, Document, into = c("bill_origin_abbr", "bill_number", NA, "bill_year"), sep = " ") %>%
  mutate(
    bill_year        = as.numeric(bill_year),
    bill_range_start = ifelse(bill_year %% 2 == 1, bill_year, bill_year - 1),
    bill_range_end   = ifelse(bill_year %% 2 == 1, bill_year + 1, bill_year),
    bill_year_range  = str_c(bill_range_start, "-", bill_range_end),
    bill_origin      = ifelse(bill_origin_abbr == "HB", "House", "Senate"),
    bill_origin_code = ifelse(bill_origin_abbr == "HB", "HIB", "SIB"),
    bill_file_name   = str_c(bill_year, "-", bill_origin_code, "-", bill_number, ".pdf"),
    bill_url         = str_c("https://www.legislature.mi.gov/documents/", bill_year_range, "/billintroduced/", bill_origin, "/pdf/", bill_file_name)
  ) %>%
  select(bill_name, bill_url) %>%
  filter(!bill_name %in% c("HB - House Bills", "SB - SENATE BILLS", NA))

# extract bill text from pdfs
bills_contents <- bills_info %>%
  mutate(
    bill_text = map_chr(bill_url, ~str_c(extract_text(file = .x, area = list(c(70, 71, 738, 560))), collapse = " ")),
    bill_text = str_replace_all(bill_text, "\r\n|\r|\n", " "),
    bill_text = str_replace_all(bill_text, "[[:space:]]{2,}", " ")
  )


# search for shared risk and protective factor language in bills ----------

# run str_count() function over all combinations of bills and search terms
# merge on the dictionary from which each term originated
term_search_output <- map_df(
    search_terms$terms, 
    ~tibble(
      bill_name = bills_contents$bill_name, 
      search_term = ., 
      match_count = str_count(bills_contents$bill_text, regex(., ignore_case = T))
    )
  ) %>%
  distinct() %>%
  left_join(search_terms, by = c("search_term" = "terms")) %>%
  select(bill_name, dictionary, search_term, match_count)


# export term search results ----------------------------------------------

write_csv(term_search_output, "C:/Users/gbushman/Documents/Projects/misc/legislative-analysis/legislative-analysis-term-search-results-20190805.csv")
