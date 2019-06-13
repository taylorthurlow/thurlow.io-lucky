module Shared::DatepickerComponent
  private def setup_time_picker
    raw <<-JAVASCRIPT
      <script>
        document.addEventListener("DOMContentLoaded", function() {
            flatpickr(
              ".flatpickr",
              {
                dateFormat: "Z",
                altInput: true
              }
            );
          });
      </script>
JAVASCRIPT
  end

  private def datetime_picker(field)
    text_input field,
      type: "datetime-local",
      class: "flatpickr",
      value: input_friendly_time(field) || field.param
  end

  private def input_friendly_time(field)
    field.value.try do |value|
      value.to_s("%FT%X")
    end
  end
end
