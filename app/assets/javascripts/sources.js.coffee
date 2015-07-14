# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('#source_avatar').fileinput
    showPreview: false
    maxFileCount: 1
    browseClass: 'btn btn-info fileinput-browse-button'
    browseIcon: ''
    browseLabel: ' ファイル選択'
    removeClass: 'btn btn-warning'
    removeIcon: ''
    removeLabel: ' キャンセル'
    uploadClass: 'btn btn-success fileinput-upload-button'
    uploadIcon: '<i class="glyphicon glyphicon-upload"></i>'
    uploadLabel: ' アップロード'
    allowedFileExtensions: ['c']
    msgValidationError: '''
      <span class="text-danger">
        <i class="fa fa-warning"></i> CSV ファイルのみ有効です。
      </span>
    '''

$(document).ready(ready)
$(document).on('page:load', ready)