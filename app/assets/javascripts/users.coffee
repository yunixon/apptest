Dropzone.options.uploadForm =
  autoProcessQueue: false
  maxFilesize: 500, # Mb
  maxFiles: 1
  previewsContainer: '.dropzone-files'
  uploadMultiple: false
  forceFallback: false
  addRemoveLinks: true
  clickable: '#files'
  init: ->
    myDropzone = this

    if $('.file').attr('data-filename') != ''
      $('.file').each (index, val) ->
        mockFile =
          name: $(this).attr('data-filename')
          size: 12345
        myDropzone.emit 'addedfile', mockFile
        myDropzone.emit 'thumbnail', mockFile, $(this).attr('data-fileurl')
        myDropzone.emit 'complete', mockFile
        $(mockFile.previewTemplate).find('.dz-remove').attr('id', val.id)
        myDropzone.options.maxFiles = 0

    @element.querySelector('input#submit-file').addEventListener 'click', (e, ui) ->
      # Make sure that the form isn't actually being sent.
      e.preventDefault()
      e.stopPropagation()
      if myDropzone.getQueuedFiles().length == 0
        $('.dropzone-files').addClass('red-border')
      else
        myDropzone.processQueue()
      return

    @on 'success', (files, response) ->
      user = $('#files').attr('data-user')
      $.getScript(document.location.href = "/users/#{user}";)

    @on 'addedfile', (files, response) ->
      $('.dropzone-files').removeClass('red-border')

    @on 'sending', (file) ->
      if $('#upload_title').val().length <= 0
        $('#upload-form').submit()
        myDropzone.removeFile(file)

    @on 'canceled', (file) ->
      myDropzone.removeAllFiles(true)

    @on 'removedfile', (file) ->
      myDropzone.options.maxFiles = 1
