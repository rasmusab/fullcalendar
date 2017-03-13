#' Display a FullCalendar widget
#'
#' This function creats a FullCalendar htmlwidget that will show up
#' in the viewer pane, if you're running Rstudio, or in your Rmarkdown
#' document.
#'
#' @param data a data frame with one row per event where the columns needs
#'   to follow the naming conventions by FullCalendar shown here: https://fullcalendar.io/docs/event_data/Event_Object/ .
#'   This data frame will then be translated into a json array by means of \code{jsonlite::toJSON}. The required
#'   columns are \code{title}, a string, and \code{start} as string parseable as a date, for example, "2017-02-28".
#' @param settings A list of settings for the FullCalendar.
#'   See here for the available settings: https://fullcalendar.io/docs/display/ .
#' @param width Fixed width for widget (in css units). The default is NULL, which results in intelligent automatic sizing based on the widget's container.
#' @param height Fixed height for widget (in css units). The default is NULL, which results in intelligent automatic sizing based on the widget's container.
#' @param elementId Use an explicit element ID for the widget (rather than an automatically generated one). Useful if you have other JavaScript that needs to explicitly discover and interact with a specific widget instance.
#'
#' @examples
#' library(fullcalendar)
#' data = data.frame(title = paste("Event", 1:3),
#'                  start = c("2017-03-01", "2017-03-01", "2017-03-15"),
#'                  end = c("2017-03-02", "2017-03-04", "2017-03-18"),
#'                  color = c("red", "blue", "green"))
#' fullcalendar(data)

#'
#' @export
fullcalendar <- function(data = NULL, settings = list(), width = NULL, height = NULL, elementId = NULL) {
  settings$events <- data
  json_settings <- jsonlite::toJSON(settings, auto_unbox = TRUE)

  # create widget
  htmlwidgets::createWidget(
    name = 'fullcalendar',
    x = json_settings,
    width = width,
    height = height,
    package = 'fullcalendar',
    elementId = elementId
  )
}

#' Shiny bindings for fullcalendar
#'
#' Output and render functions for using fullcalendar within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a fullcalendar
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name fullcalendar-shiny
#'
#' @export
fullcalendarOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'fullcalendar', width, height, package = 'fullcalendar')
}

#' @rdname fullcalendar-shiny
#' @export
renderFullcalendar <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, fullcalendarOutput, env, quoted = TRUE)
}
