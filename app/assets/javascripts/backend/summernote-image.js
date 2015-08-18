(function (factory) {
    /* global define */
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define(['jquery'], factory);
    } else {
        // Browser globals: jQuery
        factory(window.jQuery);
    }
}(function ($) {
    // template
    var tmpl = $.summernote.renderer.getTemplate();
    var attachments = [];
    var selectedAttachment = {};
    var carrierwaveBtn = {};

    // core functions: range, dom
    var range = $.summernote.core.range;
    var dom = $.summernote.core.dom;

    /**
     * createVideoNode
     *
     * @member plugin.carrierwave
     * @private
     * @param {String} url
     * @return {Node}
     */
    var selectAttachment = function(event) {
        var attachment = _.findWhere(attachments, {id: event.data.id} );
        selectedAttachment = attachment;
        setActiveClass();
        toggleBtn(carrierwaveBtn, true);
    };
    var uploadAttachment = function() {

        if($('.carrierwave-file')[0].files.length == 0) {
            return;
        }
        
        var data = new FormData();
        data.append('attachment', $('.carrierwave-file')[0].files[0]);
        $('.loading-message').show();
        $('.carrierwave-file').hide();

        $.ajax({
            type: 'POST',
            url: '/backend/wysiwyg_attachments',
            cache: false,
            contentType: false,
            data: data,
            processData: false,
            success: function(data) {
                createAttachmentOnPopup(data.attachment);
                $('.loading-message').hide();
                $('.carrierwave-file').show();
            },
            error: function(data) {
                $('.loading-message').hide();
                $('.carrierwave-file').show();
            }
        })
    };

    var setActiveClass = function() {
        _.each($('.attachment-item'), function(item) {
           $(item).removeClass('active');
            $("#attachment-" + selectedAttachment.id).addClass('active');
        });
    };

    var requestAttachments = function() {
        $.ajax({
            type: 'GET',
            url: '/backend/wysiwyg_attachments',
            success: function(data) {
                _.each(data, function(attachment){
                    createAttachmentOnPopup(attachment);
                })
            }
        })
    };

    var clearAttachments = function() {
      $('.images').html('');
        selectedAttachment = {};
        attachments = [];
        $('.carrierwave-file').type = "text";
        $('.carrierwave-file').type = "file";
        toggleBtn(carrierwaveBtn, false);
    };
    
    var createAttachmentOnPopup = function(attachment) {
        var container = document.createElement('div');
        container.setAttribute('id', 'attachment-' + attachment.id);
        $(container).addClass('col-md-2 attachment-item');
        $(container).html('<div class="thumbnail"><img src="' + attachment.thumb + '"/></div>');
        $('.images').prepend($(container)[0].outerHTML);
        $('#attachment-' + attachment.id).on('click', {id: attachment.id}, selectAttachment);
        attachments.push(attachment);        
    };
    var createVideoNode = function (url) {
      var container = document.createElement('div');
      //container.setAttribute('contenteditable', url);
      container.setAttribute('class', 'attachment-container');
      var image = document.createElement('img');
      image.setAttribute('src', url);
      image.setAttribute('class', 'attachment-image');
      image.setAttribute('style', 'width: 100%');
      $(container).append(image);

      return $(container)[0];
    };

    /**
     * toggle button status
     *
     * @member plugin.carrierwave
     * @private
     * @param {jQuery} $btn
     * @param {Boolean} isEnable
     */
    var toggleBtn = function ($btn, isEnable) {
        $btn.toggleClass('disabled', !isEnable);
        $btn.attr('disabled', !isEnable);
    };

    /**
     * Show carrierwave dialog and set event handlers on dialog controls.
     *
     * @member plugin.carrierwave
     * @private
     * @param {jQuery} $dialog
     * @param {jQuery} $dialog
     * @param {Object} text
     * @return {Promise}
     */
    var showImageDialog = function ($editable, $dialog) {
        return $.Deferred(function (deferred) {
            var $carrierwaveDialog = $dialog.find('.note-carrierwave-dialog');

            var $carrierwaveBtn = $carrierwaveDialog.find('.note-carrierwave-btn');

            $carrierwaveDialog.one('shown.bs.modal', function () {
                carrierwaveBtn = $carrierwaveBtn;


                $('.carrierwave-file').change(function() {
                    uploadAttachment();
                });

                requestAttachments();

                $carrierwaveBtn.click(function (event) {
                    event.preventDefault();
                    deferred.resolve(selectedAttachment.url);

                    $carrierwaveDialog.modal('hide');
                });
            }).one('hidden.bs.modal', function () {
                //$carrierwaveUrl.off('input');
                $carrierwaveBtn.off('click');
                clearAttachments();
                $('.carrierwave-file').off('change');

                if (deferred.state() === 'pending') {
                    deferred.reject();
                }
            }).modal('show');


        });
    };

    $.summernote.addPlugin({
        /** @property {String} name name of plugin */
        name: 'image',
        /**
         * @property {Object} buttons
         * @property {function(object): string} buttons.carrierwave
         */
        buttons: {
            image: function (lang) {
                return tmpl.iconButton('fa fa-image', {
                    event: 'showImageDialog',
                    title: lang.image.carrierwave,
                    hide: true
                });
            }
        },

        /**
         * @property {Object} dialogs
         * @property {function(object, object): string} dialogs.carrierwave
         */
        dialogs: {
            picture: function (lang) {
                var body = '<div class="form-group row-fluid">' +
                    '<label>' + lang.image.url + ' <small class="text-muted">' + lang.image.providers + '</small></label>' +
                    '<input class="note-carrierwave-url carrierwave-file form-control span12" type="file" /><div class="loading-message" style="display: none;">Loading...</div>' +
                    '</div><div class="images row"></div>';
                var footer = '<button href="#" class="btn btn-primary note-carrierwave-btn disabled" disabled>' + lang.image.insert + '</button>';
                return tmpl.dialog('note-carrierwave-dialog', lang.image.insert, body, footer);
            }
        },
        /**
         * @property {Object} events
         * @property {Function} events.showImageDialog
         */
        events: {
            showImageDialog: function (event, editor, layoutInfo) {
                var $dialog = layoutInfo.dialog(),
                    $editable = layoutInfo.editable();

                // save current range
                editor.saveRange($editable);

                showImageDialog($editable, $dialog).then(function (url) {
                    // when ok button clicked

                    // restore range
                    editor.restoreRange($editable);

                    // insert carrierwave node
                    editor.insertNode($editable, createVideoNode(url));
                }).fail(function () {
                    // when cancel button clicked
                    editor.restoreRange($editable);
                });
            }
        },

        // define language
        langs: {
            'en-US': {
                image: {
                    carrierwave: 'Image',
                    carrierwaveLink: 'Image Link',
                    insert: 'Insert image',
                    url: 'Choose image',
                    providers: 'Recommended image size – 1600х900'
                }
            },
        }
    });
}));