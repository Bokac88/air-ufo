import datepicker from 'bootstrap-datepicker'

const initializeDatepickers = function() {
  $('.datepicker').datepicker({
    format: "dd/mm/yyyy",
    todayHighlight: true
  });
}

export default initializeDatepickers;
