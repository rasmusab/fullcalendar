HTMLWidgets.widget({
  name: 'fullcalendar',
  type: 'output',

  factory: function(el, width, height) {
    return {
      renderValue: function(x) {
        var calendar = new FullCalendar.Calendar(
          el, x
        );

        calendar.render();
      },

      resize: function(width, height) {
        // TODO: code to re-render the widget with a new size
      }
    };
  }
});
