import Jcrop from "jquery-jcrop"

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

  $('#target_dataset').Jcrop({
    shadeColor: 'red',
    onSelect: hasSelected,
    onChange: hasChanged,
    onRelease: hasReleased,
    canDrag: true,
    allowMove: true,
    multi: true,
  });
});
