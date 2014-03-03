module Admin::ProductsHelper
  def close_on_formatted_form_column(record,column)
    content = "<div id='datetimepicker1' class='input-append'>
    <input id= 'record_close_on_formatted' name='record[close_on_formatted]' data-format='MM/dd/yyyy HH:mm PP' value='#{record.close_on_formatted}' type='text'></input>
    <span class='add-on'>
      <i data-time-icon='icon-time' data-date-icon='icon-calendar' class='icon-calendar'></i>
    </span>
  </div>"
    content << javascript_tag("$(function() {$('#datetimepicker1').datetimepicker({language: 'en',pick12HourFormat: true});});")
    content.html_safe
  end
  def open_on_formatted_form_column(record,column)
    content = "<div id='datetimepicker2' class='input-append'>
    <input id= 'record_open_on_formatted' name='record[open_on_formatted]' data-format='MM/dd/yyyy HH:mm PP' value='#{record.open_on_formatted}' type='text'></input>
    <span class='add-on'>
      <i data-time-icon='icon-time' data-date-icon='icon-calendar' class='icon-calendar'></i>
    </span>
  </div>"
    content << javascript_tag("$(function() {$('#datetimepicker2').datetimepicker({language: 'en',pick12HourFormat: true});});")
    content.html_safe
  end
  def base_value_form_column(record,column)
    text_field_tag("record[base_value]",record.base_value)
  end
end