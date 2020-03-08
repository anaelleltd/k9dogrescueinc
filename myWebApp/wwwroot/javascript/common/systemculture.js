 $(document).ready(function () {
    $.culture = Globalize.culture("au-AU");
    $.validator.methods.date = function (value, element) {
                 return this.optional(element)
            || Globalize.parseDate(value, "ddd/MMM/yyyy", "en-AU")
            || Globalize.parseDate(value, "ddd/MMM/yyyy");
    }
}); 