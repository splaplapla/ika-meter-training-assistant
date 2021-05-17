import Jcrop from "jcrop"

$(function() {

  var hasSelected = function() {
    console.log('選択されました')
  };

  var hasChanged = function() {
    console.log('変更されました');
  };

  var hasReleased = function() {
    console.log('リリースされました');
  };
  var onDblClick = function() {
    console.log('onDblClickされました');
  }
  Jcrop.attach('target_dataset', {
  shadeColor: 'red',
  multi: true
  })
  // $('#target_dataset').Jcrop({ });
});
