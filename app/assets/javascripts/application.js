// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//= require jquery3
//= require popper
//= require bootstrap

//= require quill.global

$(document).on("ready page:load", nonIdempotentFunction);

$('#myModal').on('shown.bs.modal', function () {
    $('#myInput').trigger('focus')
});

hljs.configure({   // optionally configure hl js
    languages: ['javascript', 'ruby', 'python']
});

var defaults = {
    theme: 'snow',
    modules: {
        syntax: true,
        toolbar: [
            // [{'font': ['serif', 'monospace' ]}],
            // [{ 'header': [2, 3, 4, false] }],
            [{ 'size': ['small', false, 'large', 'huge'] }],
            [{ 'color': [] }, { 'background': [] }],
            ['bold', 'italic', 'underline', 'strike'],
            ['blockquote', 'link', 'video', 'image', 'code-block'],
            [{ 'list': 'ordered'}, { 'list': 'bullet' }],
            [{ 'indent': '-1'}, { 'indent': '+1' }],
            ['clean']
        ]
    }
};

//This is the global config object
Quilljs.setDefaults(defaults);

$ ->
    $('.comment-reply').click ->
$(this).closest('.comment').find('.reply-form').toggle()
return
