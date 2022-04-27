require(data.table)

#' Get dataset from database; if data is already cached, then directly retrieve from cache
#' @param cache_dir, cache directory
#' @param file_name, filename used for reading from or writing to cache directory
#' @param db_access_callback, a callback to retrieve data from database
#' @param conn, necessary for db_access_call_back
#' @param statement, sql query, necessary for db_access_call_back
#' @param force_rerun, if true, get data from database regardless of whether file exists in cache or not, and then write to cache directory  
get_df_from_db_or_cache <- function(cache_dir, file_name, 
                                    db_access_callback = NULL,
                                    conn = NULL, 
                                    statement = NULL,
                                    force_rerun = FALSE, 
                                    ...){
  df_path <- file.path(cache_dir, file_name)
  if (force_rerun | !file.exists(df_path)){
    df <- db_access_callback(conn, statement)
    write.csv(df, file = df_path, row.names = FALSE)
  }
  
  # data.table::fread is typically preferred
  df <- data.table::fread(df_path, ...)
}


#' my default theme
theme_az <- function(){
  theme_bw() + 
    theme(panel.grid = element_blank(), legend.position = "right", 
          axis.title = element_text(size = 8), 
          axis.text = element_text(size = 8), 
          legend.text = element_text(size = 8), legend.title = element_text(size = 10))
}

#' my ggsave
#' it extends ggplot2::ggsave by saving one plot to multiple files
ggsave2 <- function(filenames, ...){
  for (filename in filenames){
    ggsave(filename, ...)
  }
}
