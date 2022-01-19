
# *Don't user this hack, use this instead: https://dreamrs.github.io/toastui/articles/extras/calendar.html :)*

# fullcalendar

This is a simple R package that allows you to created calendar widgets from R using the FullCalendar javascript library. 
I made this as a quick hack to try out the [htmlwidget](http://www.htmlwidgets.org/) framework, so it's not well tested nor does
it include any fancy stuff, it's just a simple wrapper around the [fullCalendar](https://fullcalendar.io) function in FullCalendar.

Install by using the `devtools` package:

``` r
devtools::install_github("rasmusab/fullcalendar")
```

# Example

``` r
data = data.frame(title = paste("Event", 1:3),
                 start = c("2017-03-01", "2017-03-01", "2017-03-15"),
                 end = c("2017-03-02", "2017-03-04", "2017-03-18"),
                 color = c("red", "blue", "green"))
fullcalendar(data)
```

Which would give you the following calendar widget, not as a picture as below, but "interactive" in the sense that you could switch month:

![Imgur](http://i.imgur.com/0BsTMIS.png)
